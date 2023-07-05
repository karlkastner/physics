% Wed  7 Jul 20:48:34 CEST 2021
%
% Kr = K/Ks hydraulic conductivity relative to saturate conductivity
% Se : normalized water content 
function Kr = hydraulic_conductivity_genuchten(Se,n,k)
	switch (k)
	case {0}
		% mualem 1976 model
		% Kr = theta^(1/2) int_0^theta h^-1 dz / int_0^1 h^-1 dz
		% eq 8 in genuchten 1980
		m  = 1-1./n;
		% c.f. kosugi-2002
		l = 0.5;
		Kr = Se.^l.*(1 - (1-Se.^(1./m)).^m).^2;
	case {1}
		% Burdine's model
		% Kr = theta^2 int_0^theta h^-2 dz/int_0^1 h^-2 dz
		m = 1-2./n;
		Kr = Se.^2.*( 1 - (1-Se.^(1./m)).^m );
	end
end

