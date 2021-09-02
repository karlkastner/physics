function R_ohm = electrical_resistivity(d_m,l_m)
	r_m  = 0.5*d_m;
	A_m2 = pi*r_m.^2;
        rho_ohm_m  = 1.7e-8; % copper
  %      rho_ohm_m  = 2.65e-8; % alu
	R_ohm    = rho_ohm_m*l_m/A_m2;
end

