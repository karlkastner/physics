% Wed  5 Sep 14:29:41 CEST 2018
function backscatter_form_function_theoretic()
	e = 1e-7;
	f    = 0;
	n = 0;
	% theta = pi for sonars (c.f. gaunard and uberall)
	cos_theta = -1;
	while (true)
		bn = 
		fold = f + (2*n+1)*bn*legendre_man(n,cos_theta);
		f = f+
		if (abs(f-fold) < abs(e*f))
			break;
		end
		n = n+1;
	end
	% scale
	f = 2/(k*as)*f;
end

