% Wed 30 Oct 16:36:53 +08 2019
% E  : youngs modulus
% Iz : second moment of inertia w/r to axis of load application
%
% cantilevered beam, supported at both ends
% point load applied to centre
%
% [d] = kg*m/s^2*(m^3)*1/(kg/(m*s^2))*1/m^4
%     = kg*m*s^-2*m^3*m*s^2*kg^-1*m^-4
%     = m
%
% validated with:
% https://www.engineeringtoolbox.com/beam-stress-deflection-d_1312.html
% https://skyciv.com/free-beam-calculator/
% shear is +/- F/2
%
%function [d_m,theta] = beam_deflection(F_N,l_m,E_Pa,Iz_m4,p)
function [d_m,theta] = beam_bending_deflection(F_N,l_m,E_Pa,Iz_m4,p)
	% max deflection at centre
	d_m = F_N*l_m^3/(48*E_Pa*Iz_m4);
	% end point slope
	theta = F_N*l_m^2/(16*E_Pa*Iz_m4);

	% for not in centre, deflected at p*l
	% F*p^2*(1-p^2)*L^3/(3*E*I)
	% for p = 0.5 ->
end

