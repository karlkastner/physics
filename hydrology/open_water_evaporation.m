function open_water_evaporation(A,T_C)
	% evaporation coefficient
	theta = (25+19*v_wind);
	%
	T = 271+T_C;
	pws = exp(77.3450 + 0.0057*T - 7235/T)./T.^8.2;
	% 
	xs    = 0.62198 pw/(pa - pw);
	% humidity ratio of air
	x     = 0.62198*pws/(pa - pws);
	dm_dt = (A
end
