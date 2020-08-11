% 2020-05-18 15:34:01.514924116 +0800
function W = heat_transfer(dT_C,M_kg,material)
	k  = Constant.heat_capacity.(material);
	W  = k*dT_C*M_kg;
end

