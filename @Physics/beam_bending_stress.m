% Wed 30 Oct 17:42:08 +08 2019
% s / Pa = 1
% note : plate springs back even if yield stress is exceeded (but not all the way)
function s = beam_bending_stress(F_N,l_m,E_Pa,Iz_m4)
	M   = Physics.beam_bending_moment(F_N,l_m);
	y_m = Physics.beam_bending_deflection(F_N,l_m,E_Pa,Iz_m4);
	% resistance
	W = Iz_m4/y_m;
	s = M/W;

%	I=1/2*b*h^3;
%	s(2) = F_N*l_m*h/(8*I);
end

