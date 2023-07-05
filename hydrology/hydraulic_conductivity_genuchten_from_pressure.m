% Wed  7 Jul 20:48:28 CEST 2021
%
% h : pressure potential
%
% Kr : conductivity
function Kr = hydraulic_conductivity_genuchten_from_h(h,a,n,k)
	switch (k)
	case {0}
		m = 1-1./n;
		Kr =    (1-(a.*h).^(n-1).*(1 + abs(a.*h).^n).^-m).^2 ...
		     ./ ((1 + abs(a.*h).^n).^(m/2));
	case {1}
		m = 1-2./n;
		Kr =    (1-abs(a.*h).^(n-2).*(1+abs(a.*h).^n).^-m) ...
                     ./ ( 1 + abs(a.*h).^n).^(2*m);
	end
%	Kr = Se.^2.*(1 - (1-Se.^(1./m)));
%	Se = (1 + abs(a.*h).^n).^-m;
end
