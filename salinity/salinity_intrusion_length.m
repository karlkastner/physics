% Fri 22 Jul 15:00:29 CEST 2016
% Karl Kastner, Berlin
function L = salinity(D0,K,Qf,A0,a)
	L = a.*log(D0*A0./(K*a*Qf) + 1);
end

