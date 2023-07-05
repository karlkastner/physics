% Wed 11 May 14:02:56 CEST 2016
% Karl Kastner, Berlin
% Equations from Salinity and tides in alluvial estuaries, 2nd Ed. Savenije, 2012
% c.f. Deynoot
%
% S0 : salinity at mouth (0-35ppt)
% D0 : diffusivity at mouth (0-1000)
% K  : van der Burghs coefficient (0-1)
% Qf : river discharge
% A0 : cross sectional area at mouth
% a  : convergence length of area
% x  : upstream distance to locations, where salinity is calculated with
function [S, D] = salinity_from_dispersion_savenije(S0,D0,K,Qf,A0,a,x)
	% 4.23
	% D/D0 = (S/S0)^k 

	% diffusion coefficient
	% 4.36
	%D = D0 - K*a*Qf/A0 * (exp(x/a) - 1);
	% integrate x./a
	if (~isscalar(a))
		dx = diff([0;cvec(x)]);
		x_div_a = cumsum(1./a.*dx);
	else
		x_div_a = x./a;
	end

	D = bsxfun(@minus,D0,K.*a.*Qf./A0.*(exp(x_div_a) - 1));
	D = max(0,D);
	% 5.45
	% Salinity concentration
	D_div_D0 = bsxfun(@times,D,1./D0);
	S = S0.*(D_div_D0).^(1./K);
end

