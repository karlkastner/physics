% Thu 12 Jul 16:23:40 CEST 2018
% Tue  1 Dec 12:47:06 +08 2020
% Baker 1984

function a = optical_attenuation(d_mm,c_m,f_Hz)
	if (nargin()<2)
		c_m = 2650;
	end
	if (nargin()<3)
		%f_Hz = 
		lambda = 290e-9;
	else
%	c      = Constant.velocity_light; 
	c      = 3e8;
	lambda = c/f_Hz;
	end
	rhos = 2650;

	d_m = 1e-3*d_mm;
	m1 = rhos*Geometry.sphere_volume(d_m);
	% number concentration
	N = c_m/m1;
	x = pi*d_m / lambda;
	% m : scattering coefficient (1-1.2)
	% shape factor for glass
	m = 1.14
	% m-1<<1
	s = 2*x*(m-1);
	K = 2 - 4/s*sin(s) + 4/s^2*(1-cos(s));
	bf = 0;
	b  = 1;
	% ignoring near forward scatter (infinitessimal receiver and transducer diameter)
	% attenuation coefficient (eq 7)
	a = 0.25*K*(1-bf/b)*N*pi*d_m.^2;
	% 11 for mass
	% C = 3/2*K*(1-bf/b)*C/(rho*a);

%Disk vs spherical scatter
%adisk = (1+2e)/2 (2/(3e))^2/3 asphere
%attenuation coefficient, C is mass concentration
%c = a C
%
%Scatter: (lynch 1994)
%a:
%R  = aopt*3/4*1/a;

end
