% Thu 18 Jun 18:07:25 +08 2020
% Blaney - Criddle

% eq 6.3 in 
% Tavg = 1/2(T_min + T_max) per day 
function ET_mm_per_day = evapotranspiration_blanley_criddle(Tavg_C)
	% p : daily percentage of annual daytime hours
	p = 0.27; % on equator
	ET_mm_per_day = p*(0.46*(Tavg_C + 8));
end

