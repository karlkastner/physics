% Fri 13 Mar 11:43:31 +08 2020
function mu = viscosity_dynamic_water(varargin)
	[nu,mu] = Constant.viscosity_kinematic_water(varargin{:});
end
