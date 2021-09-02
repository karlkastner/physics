% Sun  9 May 21:50:07 CEST 2021
% abtew 6.3
function ETpot_mm_d = potential_evapotranspiration_blaeney_criddle(T_C,S_h)
	p = S_h/24;
	ETpot_mm_d = p.*(0.46*T_C + 8);
end

