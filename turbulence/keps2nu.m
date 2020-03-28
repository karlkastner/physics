% Sat 17 Nov 15:03:05 CET 2018
% note : mu = rho nu
function nu_t = keps2nu(k,e)
	c_mu = 0.09;
	nu_t = c_mu*k.^2./e;
end

