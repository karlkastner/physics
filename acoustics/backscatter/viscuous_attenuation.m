% Sun  8 Jul 10:41:40 CEST 2018

% c.f.
% Urick 1948
% Richards 2003
% Holdaway 1999
% Heathershaw 1996
% viscous attenuation
function as_nu = viscous_attenuation(C_kgm3,d_mm,k,f_Hz,rho_s,rho_w)
	% [nu] = m/s
	nu   =  Constant.viscosity_kinematic_water;	

	d_m   = 1e-3*d_mm;
	gamma = sqrt(pi*f_Hz/nu);
	s     = (9./(2*gamma*d_m)).*(1+2./(gamma*d_m)); 
	T     = 0.5 + 4.5./(gamma*d_m);
	as_nu =   ( 0.5*k.*C_kgm3/rho_s.*(rho_s/rho_w-1)^2 ...
		.*( s./(s.^2+(rho_s/rho_w+T).^2) ) );
end	

