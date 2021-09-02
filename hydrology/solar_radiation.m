% Wed 12 May 18:41:31 CEST 2021
% abtew 2.9
% jensen 1974 (not accessible)
% allen 2005
% s : sunshine hours
% J : julian day
% TODO convert day of year to julian day
function [Rs,Rso,Ra] = solar_radiation(latitude_rad,J,s,z_m)
	% altitude
	if (nargin()<4)
		z_m = 0;
	end

	% phi : latitude
	phi = latitude_rad;

	% squared inverse relative distance factor sun-earth
	% allen, 23
	dr    = 1 + 0.033*cos(2*pi/365*J);

	% delta : solar declination (Allen, eq 24)
	delta = 0.409*sin(2*pi/365*J - 1.39);

	% ws : sunset hour angle (Allen, eq 27
	ws = acos(-tan(phi).*tan(delta));

	% solar constant
	G = 4.92; % MJ m^2 h^-1	

	% 2.6 abtew
	Ra = 24/pi*G*dr.*(ws.*sin(phi).*sin(delta) + cos(phi).*cos(delta).*sin(ws));
	% 2.7 abtew
	Rso = (0.75 + 2e-5*z_m).*Ra;
	% 2.9 in abtew
	% the 1/24 is missing in abtew
	Rs  = (0.35 + 0.61*s/24).*Rso; 
end

