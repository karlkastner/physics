% Fri  1 Nov 20:54:23 +08 2019
% TODO, this does not account for the thread
function s_Pa = bolt_stress(F_N,d_m)
	r_m = d_m/2;
	A_m2 = pi*r_m^2;
	s_Pa = F_N/A_m2;
end

