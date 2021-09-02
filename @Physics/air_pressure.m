% Thu 18 Jun 12:04:54 +08 2020
%Air pressure at sea level
%kpa
%97	low
%101	normal
%103	high
function p_kpa = air_pressure(h)

	p0 = 101.3;
	
	M = 0.02896968; %molar mass of air
	R0 = 8.314462618; % universal gass constant
	T0 = 288.16; % K sea level standard temp
	g = 9.81;
	H = T0*R0/(g*M)
	p_kpa = p0*exp(-h/H);
	
end

