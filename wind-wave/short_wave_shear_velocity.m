% Thu 14 Jun 15:06:17 CEST 2018
function um = short_wave_shear_velocity(T,H,h)
	[L,Linf] = short_wave_length(h,T);
	um = pi*H/(T*sinh(2*pi*h/L));
end

