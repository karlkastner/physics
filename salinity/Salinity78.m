% Thu May 23 20:56:25 UTC 2013
% Karl Kästner, Berlin

% from:
% Algorythms for computation of fundamental properties of sea water, unesco, 1993

classdef Salinity78
properties (Constant)
	C0 = 4.2914; % [S/m] conductivity of standard seawater
	%C0 = 4.29175; from https://salinometry.com/stp-conductivity-calculator/
	S0 = 32.4356; % g potassium / kg water for K15 = 1
end % properties 
methods (Static)

% ppt = psu = pss = 1g/l = 0.1%  max 2000        
% conductivity to salinity
% in S/m
%   T : temperature in degree celsius (IPTS-68)
%   P : pressure in decibar (1 dbar = 0.1 bar = 10^4 Pascal)
% SAL : salinity in PSS-78 (PSU = 1 ppt)
%       this is 35.0 for standard sea water
function SAL = conductivity2salinity(C, T, P)
	  %C0 = obj.salinity2conductivity(35*ones(size(C)),T,P)
	  C0 = Salinity78.C0;
	  SAL = Salinity78.conductivity_ratio2salinity(C./C0,T,P);
	  %SAL = Salinity78.SAL78(C/Salinity78.C0,T,P);
end % conductivity2saliniy()

% compute salinity from conductivity, temperature and pressure
% CND : conductivity ratio = 1 for SALINITY = 35 PSS-78 (pss=psu=ppt)
%       at 15.0 deg Celsius and Atmospheric pressure     
function SAL78 = conductivity_ratio2salinity(CND, T, P)
	  DT   = T - 15;
	  Res  = CND;
          RT   = Res ./ (    Salinity78.RT35(T) .* (1.0 + Salinity78.C(P) ...
                          ./ (Salinity78.B(T) + Salinity78.A(T) .* Res)));
          RT   = sqrt(abs(RT));
          SAL78 = Salinity78.SAL(RT, DT);
end % sal78()

function C = salinity2conductivity(CND,T,P)
	 C = Salinity78.C0 .* Salinity78.salinity2conductivity_ratio(CND,T,P);
end

% invert salinity to conductivity by the newton raphson method
% note: cnd is actually salinity
function cnd = salinity2conductivity_ratio(CND,T,P)
	DT = T - 15;
	% FIRST APPROXIMATION
	RT = sqrt(CND/35.0);
	SI = Salinity78.SAL(RT,DT);
	% ITERATION LOOP BEGINS HERE WITH A MAXIMUM OF 10 CYCLES
	% TODO, this was fixed, did not converge for initial implementation, was damped by 0.5
	for idx=1:100
		RT = RT + (CND - SI)./Salinity78.SAL(RT,DT);
		SI = 0.5*(SI + Salinity78.SAL(RT,DT));
		%SI = Salinity78.SAL(RT,DT);
		DELS = abs(SI - CND);
		%[idx SI CND]
		if (~(max(flat(DELS)) > 1.e-4))
			% value converged
			break;
		end
	end % for idx
	% COMPUTE CONDUCTIVITY RATIO
	RTT = Salinity78.RT35(T).*RT.*RT;
	AT = Salinity78.A(T);
	BT = Salinity78.B(T);
	CP = Salinity78.C(P);
	CP = RTT.*(CP + BT);
	BT = BT - RTT.*AT;
	% solve quadratic equation for r = rt35*rt*(1+c/ar+b);
	R = sqrt(abs(BT.*BT + 4.0*AT.*CP)) - BT;
	% conductivity return
	cnd = 0.5*R./AT;
end

% C(XP) POLYNOMIAL CORRESPONDS TO A1-A3 CONSTANTS: LEWIS 1980
function C = C(XP)
      C = ((3.989E-15 * XP - 6.370E-10) .* XP + 2.070E-5) .* XP;
end

function B = B(XT)
      B = (4.464E-4 * XT + 3.426E-2) .* XT + 1.0;
end

% A(XT) POLYNOMIAL CORRESPONDS TO B3 AND B4 CONSTANTS: LEWIS 1980
function A = A(XT)
      A = -3.107E-3 * XT + 0.4215;
end

function SAL = SAL(XR, XT)
    % PRACTICAL SALINITY SCALE 1978 DEFINITION WITH TEMPERATURE
    % CORRECTION;XT :=T-15.0; XR:=SQRT(RT);
      SAL = ((((2.7081*XR-7.0261).*XR+14.0941).*XR+25.3851).*XR ...
              - 0.1692).*XR+0.0080 ...
              + (XT./(1.0+0.0162*XT)).*(((((-0.0144*XR ...
              + 0.0636).*XR-0.0375).*XR-0.0066).*XR-0.0056).*XR+0.0005);
end % SAL

% FUNCTION RT35: C(35,T,0)/C(35,15,0) VARIATION WITH TEMPERATURE
function RT35 = RT35(XT)
      RT35 = (((1.0031E-9 * XT - 6.9698E-7) .* XT + 1.104259E-4) .* XT ...
               + 2.00564E-2) .* XT + 0.6766097;
end % RT35

% takes salinity as fraction and converts it to PSU
% S : (gramms of salt per kilogramm solution)
% psu : relative conductivity compared 32.4356g Potassuium / kg
function psu = salinity2psu(S)
	psu =      0.0008 ...
		-  0.1692*sqrt(S./S0) ...
		+ 25.3851*S./S0 ...
		+ 14.0941*(S./S0).^1.5 ...
		-  7.0261*(S./S0).^2 ...
		+  2.7081*(S./S0).^2.5;
end % salinity2psu

end % methods

end % classdef

