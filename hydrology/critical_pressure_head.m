% Sat 10 Jul 17:55:36 CEST 2021
% Critical pressure head to reduce evaporation
% philip & de vries, eq 3 1957
% edlefsen-anderson 1943, p 260
% Hr : humidity
% h_c : critical head
% c.f. kelving equation
function h_c = critical_pressure_head(Hr,T_C)
	g = 9.81;
	% Hr = exp(g h_c M /(R T)]
	% T : absolute temperature (Kelvin)
	T_K = 273 + T_C;
	%  universal gas constant
	R = 8.314; % kg m^2/s^2/K/mol
	%
	% M : molecular weight of water
	M = 0.018015; %kg/mol
	h_c = log(Hr)*(R*T_K)/(M*g);
end 

