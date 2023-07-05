% Fri 28 Jan 13:27:29 CET 2022
function dy_dx = salinity_dot(x,y,Afun,Kfun,Qf)
	A = feval(Afun,x);
	K = feval(Kfun,x);
	
	S = y(1);
	D = y(2);
	
	% 5.42, 5.16,5.17
	dS_dx = -S*Qf./(A*D);
	if (S<=0)
		dS_dx = 0;
	end

	% 5.43
	dD_dx = -K*Qf./A;
	if (D<=0)
		dD_dx = 0;
	end
	dy_dx = [dS_dx; dD_dx];
end

