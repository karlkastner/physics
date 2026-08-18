% Thu 28 May 12:57:52 +08 2020
% van der Maas 1992
function [Q_heat, Q_vol] = heat_convection_through_orifice(dT,h,w)
	g   = Physics.gravity;   % m/s^2
	rho = Physics.density.air;    % kg/m^3
	Cv  = 0.7e3;  % J/(kg*K)
	u = sqrt(g*h);
	A = h*w;
	Q_vol  = u*A;
	Q_heat = -rho*Cv*dT*Q_vol;
end

