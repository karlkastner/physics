% Wed  4 Jan 14:16:52 CET 2023
% when ground is not covered by (insulating) snow
%
% Stefan equation
% c.f. Kurylyk 2016 (for si-units)
% c.f aldrich 1953 eq 2-23, for empirical units
% D_f = sqrt(48 k F / L )
%
function D_m = soil_freezing_depth(fdd)
	% heat conductivity in unfrozen zone
	% [k] = W / m / C
	% for silt 1, sand 2 
	k = 1.0;
	% volumetric moisture content
	% [phi] = 1
	phi = 0.35;
	% density
	% [rho] = kg/m^3
	rho_w = 1000;
	% L : latent heat of fusion
	% [L] = J / kg
	L_w = 3.3*10^5;

	fd_s = fdd*86400;

	% [D] = sqrt( W / m / C * C * s / kg * m^3 / J * kg)
	%     = sqrt( (J/s) * s * m^2 / J)
	%     = sqrt( m^2) = m
	D_m = sqrt(2*k*fd_s./(phi*rho_w*L_w));
end

