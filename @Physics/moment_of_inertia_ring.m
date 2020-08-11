% Wed 30 Oct 16:29:05 +08 2019
% for thin bars this becomes: 1/2*w^3*h
function I2 = moment2_of_intertia_ring(ro,ri)
	if (~issym(ro))
		Pi = pi;
	else
		syms Pi;
	end
	I2 = Pi/2*(ro^4 - ri^4);
end
	
