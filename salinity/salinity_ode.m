% Fri 28 Jan 13:36:22 CET 2022
function [S,D] = salinity_ode(S0,D0,Afun,Kfun,Qf,x)
	y0 = [S0;D0];
	[x,y] = ode23(@(x,y) salinity_dot(x,y,Afun,Kfun,Qf),x,y0);
	S = y(:,1);
	D = y(:,2);
end

