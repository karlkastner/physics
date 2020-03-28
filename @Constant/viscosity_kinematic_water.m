% Fri 13 Mar 11:40:54 +08 2020
function [nu,mu] = viscosity_kinematic_water(T_C)
	if (nargin()<1)
		T_C = 20;
	end
	T_K = T_C + 273.15;
	mu  = 2.414e-5*10.^(247.8./(T_K-140));
	nu  = mu/Constant.density.water;
	% vr
	%4.0e-5 / (20.0 + T_C)
end

