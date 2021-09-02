function I = moment_of_intertia_cylinder(r1,r2)
	% perpendicular to length
	I = pi/4*(r1.^4 - r2.^4);
end
