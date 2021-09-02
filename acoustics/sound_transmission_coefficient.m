% Nov 28  2019
% z = rho*c
function T = sound_transmission_coefficient(z_a,z_w)
	% transmission coefficient
	T = 4*z_a*z_w/(z_a+z_w)^2;
end

