% Sun  9 May 22:06:21 CEST 2021
function ETpot_mm_d = potential_evapotranspiration_makking(Rs,T_C,P_kPa)
	if (nargin()<3)
		P_kPa = 101.325;
	end

	T_K = T_C + 237.3;

	% 5.1 abtew
	es = 0.611*exp(17.27*T_C./T_K);

	Delta  = 4098*es./T_K.^2;
	lambda = 2.501 - 0.00236*T_C;
	gamma = 0.0016286*P_kPa./lambda;	

	ETpot_mm_d = 0.743*Delta.*Rs./((Delta+gamma).*lambda);
end
	
