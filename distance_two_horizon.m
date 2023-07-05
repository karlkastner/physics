% Thu 28 May 22:05:34 +08 2020
% Two objects d ~ sqrt(h1) + sqrt(h2)
function d_m = distance_to_horizon(h_m)
	R_m = 6.371e6; % m
	d_m = sqrt(2*R_m*h_m + h_m.^2);
end

