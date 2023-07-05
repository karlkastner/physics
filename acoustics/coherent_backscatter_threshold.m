% Thu  6 Sep 11:49:09 CEST 2018
% c.f. meckelbach
% r < 1 : incoherent
% r > 1 : coherent
% C : chezy
function r    = coherent_backscatter_threshold(C,u,h,freq)
	g     = Constant.gravity;
	kappa = Constant.Karman ;
	nu    = Constant.viscosity_kinematic_water;
	cw    = Constant.sound_velocity_water();
	gamma = 1.2;
	%cd   = 2.5e-3;
	us    = u./sqrt(g)./C;
	eps   = us.^3./(h*kappa);
	% eq 31
	eta   = (nu.^3./eps).^(1/4);
	k_eta = 2*pi./eta; 
	K     = pi.*freq./cw;
	r     = gamma.*k_eta./K;
end

