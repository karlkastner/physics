% Wed 30 Oct 19:39:40 +08 2019
function strain = beam_strain(b,h,M,E)
	% section modulus
	Z = 1/6*b*h^2;
	strain = M/(Z*E);
end

