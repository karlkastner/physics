% 2020-11-24 11:13:26.653580223 +0800
function [P,f] = sound_pressure_sphere_collision(v,a,r)
	if (nargin()<2)
		a = 1;
	end
	if (nargin()<3)
		r = a;
	end
	E = Physics.youngs_modulus_Pa.quartz;
	c = Physics.sound_velocity.air;
	P = E*1.26e-6*(r./a).^-1.07.*(v./c).^1.25;
	f = 76.1/a;
end

