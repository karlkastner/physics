%Sun  9 May 21:31:12 CEST 2021
% ET_pot [mm/d]
function ETpot = potential_evapotranspiration_abtew(Rs,T_C)
	K1 = 0.53;
	% 8.6 in abtew
	lambda = 2.501 - 0.002361*T_C;
	ETpot = K1*Rs./lambda;
end

