% Sat 16 May 13:25:10 +08 2020
% [q] = J/s = W/s
function q = thermal_flux(k,A,dT,dx)
	if (isstr(k))
		k = Constant.thermal_conductivity.k;
	end
	q = -k.*A.*dT./dx;
end

