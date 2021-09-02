% 2021-05-10 16:24:31.071662798 +0200
function dv_eq = dv_eq(d_G,type)
	tab   = readtable('equilibrium-soil-moisture-profile-brooks-corey.csv');
	id    = find(strcmp(tab.Soil_Type,type));
	b = tab.b(id)
	Psi_ae = 1e-3*tab.Psi_ae(id)
	Theta_s =tab.Theta_s(id)
%k=0:1
%z = Psi_ae*exp(2i*pi*b*k)
	dv_eq = Theta_s.*(d_G - d_G.^(1-1/b)./( (1-1/b).*Psi_ae.^(-1/b)) - Psi_ae./(1-b));
%$	dv_eq = d_G*Theta_s - Psi_ae*Theta_s + (b*Psi_ae*Theta_s)/(b - 1) - (b*d_G*Theta_s)./((d_G/Psi_ae).^(1/b).*(b - 1));
%	nanmedian(abs(dv_eq-dv_eq_))
end

