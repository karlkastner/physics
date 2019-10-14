% Mon  7 Oct 15:39:59 PST 2019

% c.f. bass 1990
% f : freq_Hz 
% a : dB/m

% c.f. morse, ingard 6.4.14
function a = sound_absorption_air(f,ps,hr)
%	a_dB_m = 3e-2*freq_Hz.^2;
	T_ = 20;

	ps = 1;
	ps0 = 1;

	T0 = 293.15;	
	T = T0 + (T_-20);
	if (nargin()<3 || isempty(hr))
		hr = 50; % %
	end

	psat = saturation_vapor_pressure(ps0,T);

	h = hr*(psat./ps0)./(ps./ps0)
	frn = ps./ps0.*(T0./T).^(1/2).*(9 + 280*h.*exp(-4.17*((T0/T).^(1/3) - 1)));
	fro = (ps./ps0).*(24 + 4.04e4*h.*(0.02+h)*(0.391+h).^(-1));

	a = f.^2.*(   1.84e-11*(ps./ps0).^(-1).*sqrt(T./T0) ...
		  + (T./T0).^(-5/2)*( ...
		                      1.278e-2*(exp(-2239.1./T) ./ (fro + f.^2./fro)) ...
		                    + 1.068e-1*(exp(-3352.0./T) ./ (frn + f.^2./frn))  ...
		                  ) ...
		);

