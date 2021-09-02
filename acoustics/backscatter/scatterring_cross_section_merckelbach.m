% 2020-11-29 14:30:55.196636400 +0800
function [st si sc] = scattering_cross_section_merckelbach(k,a,cs,us)
	rhos = 2650;
	% a : sediment radius
	
	xi0=3e4;
	usc = 0.038;

	% TODO a^6/a^3
	si = 25/48*k^4/(pi*rhos)*a^3*cs;
	sc = xi0*max(0,us-usc)^2*cs^2;
	
	st = si+sc;
end

