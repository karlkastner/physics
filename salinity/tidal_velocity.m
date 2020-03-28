% Wed  3 Jul 14:02:31 CEST 2019
% Karl Kastner, Berlin
% TODO, this ignores damping and convergence
function u1 = tidal_velocity(z1,h)
	g  = 9.81;
	u1 = z1*sqrt(g/h);
end


