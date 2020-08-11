% Thu 12 Jul 16:23:40 CEST 2018
% Baker 1984
% m : scattering coefficient (1-1.2)
% m = 1.14 for glass

	x = pi*a/lambda;
	sigma = 2*x*(m-1);
	K = 2 - 4/sigma*sin(sigma) + 4/sigma^2*(1-cos(sigma));
	% attenuation coefficient
	% m-1<<1
	% ignoring near forward scatter (infinitessimal receiver and transducer diameter)
	% eq 7
	bf = 0;
	b  = 1;
	% 7 for number
	c = K*(1-bf/b)*n*pi*a^2/4; 
	% 11 for mass
	C = 3/2*K*(1-bf/b)*C/(rho*a);


%Disk vs spherical scatter
%adisk = (1+2e)/2 (2/(3e))^2/3 asphere
%attenuation coefficient, C is mass concentration
%c = a C
%
%Scatter: (lynch 1994)
%a:
%R  = aopt*3/4*1/a;

