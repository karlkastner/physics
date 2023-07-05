% infiltraition according to phillips
% series expansion of the solution to:
% dtheta/dt = d/dz (D dtheta/dz) - dK/dtheta dtheta/dz
% t < (S/A2)^2 must not be large
function [I, v] = infiltration_phillips(t,S,A)
	% philips 1969, eq 64, 95, 195
	% A = A2+K0
	% An = int_theta0^theta1 phin dtheta
	% A2 ~ K1 - K0
	% A somewhat smaller K1 due to series expansion
	I = S*sqrt(t) + A*t;
	% 97
	v = 0.5*S./sqrt(t) + A;
end

