% Wed 30 Oct 11:55:48 +08 2019
% function F = drag_force(cD,rho,A,u)
function F = drag_force(cD,rho,A,u)
	F = 0.5*cD*rho*A*u^2;
end
