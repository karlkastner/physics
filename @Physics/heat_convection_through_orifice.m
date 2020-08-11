% Thu 28 May 12:57:52 +08 2020
% van der Maas 1992
function [Q_heat, Q_vol] = heat_convection_through_orifice(dT,h,w)
	g   = 9.81;   % m/s^2
	Cv  = 0.7e3;  % J/(kg*K)
	rho = 1.2;    % kg/m^3
	u = sqrt(g*h);
	A = h*w;
	Q_vol  = u*A;
	Q_heat = -rho*Cv*dT*Q_vol;
end

