% Fri 22 Jul 15:00:29 CEST 2016
% Karl Kastner, Berlin
%
% c.f. savenije 2012, salinity and tides ed 2.1, eq 5.48
% 
function L = salinity(D0,K,Qf,A0,a)
	L = a.*log(D0*A0./(K*a*Qf) + 1);
end

