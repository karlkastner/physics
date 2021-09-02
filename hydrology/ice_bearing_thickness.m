% M : kg
function h = ice_bearing_thickness(M)
	g = 9.81; % m/s^2
	A = 344738; % pascal = N/m^2
	h = sqrt(g*M/A);
end

