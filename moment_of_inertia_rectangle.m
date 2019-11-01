% Wed 30 Oct 16:29:05 +08 2019
% for thin bars this becomes: 1/2*w^3*h
% function I2 = moment_of_intertia_rectangle(w,h)
function [Ix,Iy,Ixy] = moment_of_intertia_rectangle(w,h)
	Ix = w*h^3/12;
	Iy = w^3*h/12;
	Ixy = Ix + Iy;
%	I2 = 1/12*w*h*(w^2 + h^2);
end

