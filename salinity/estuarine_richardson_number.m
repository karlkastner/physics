% Wed  1 Sep 17:24:00 CEST 2021
function [Nr] = estuarine_richardson_number(Delta_rho,rho,h,v,Qf,T,P)

% prismatik
D0 = c1*sqrt(pi)*(sqrt(Delta_rho/rho*g*h0)/v0)^a1*(C^2/g)^a2*(|u0|/v0)^a3*v0*h0

	Nr = Delta_rho/rho*g*h/(v^2)*Qf*T/P;
end

