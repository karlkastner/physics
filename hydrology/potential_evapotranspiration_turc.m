% Sun  9 May 22:13:56 CEST 2021
% abtew, 6.16
function ETpot_mm_d = potential_evapotranspiration_turc(Rs,T_C)
	K2 = 0.013;
	ETpot_mm_d = K2*(23.89*Rs + 50).*T_C./(15 + T_C);
end

