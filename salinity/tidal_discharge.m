% Wed  3 Jul 14:18:14 CEST 2019
% Karl Kastner, Berlin
%% specific tidal discharge (discharge per unit width)
%% 
% TODO, this ignores damping and convergence
function Q1 = tidal_discharge(z1,h,w)
	if (nargin()<3)
		w = 1;
	end
	g = 9.81;
	Q1 = w*z1*sqrt(g*h);
end
