% Wed 30 Oct 16:53:20 +08 2019
% beam supported by cantilevers at both ends
% [M] = kg*m^2/s^2
function M = beam_bending_moment(F_N,l_m)
	M = F_N*l_m/4;
end
