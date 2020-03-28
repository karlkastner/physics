% Thu 14 Jun 14:55:02 CEST 2018
function [L,Linf] = short_wave_length(h,T)
	g = 9.81;
	% eckart 1952
	Linf = (g/(2*pi))*T^2;
	% komar 1974
	L = Linf*sqrt(tanh(2*pi*h/Linf));
end

