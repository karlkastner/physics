% Thu 14 Jun 13:23:01 CEST 2018
% u : 10m above bottom
% h : significant wave height
function h = wave_height_from_wind_speed(u)
	% pierson 1991
	h      = 1.6e-2*u.^2;
	fdx    = u > 7.5; % m/s;
	h(fdx) = 1e-2*u(fdx).^2 + 8.1e-2*u(fdx).^3;
end

