% Thu 13 Jun 09:37:45 CEST 2019
% https://oceanlife.it/index.php/it/19-notizie/350-water-salinity-converter

% TODO vectorize with newton interation or bisection
% TODO for newton, drho/dS is analytic
function S = density2salinity(rho,T,p)
	%S = zeros(size(rho));
	S = 0.5*35*ones(size(rho));
	for idx=1:size(rho)
		%S(idx) = fzero(@(S) rho - sea_water_density(S,T(idx),p(idx)),S(idx));
		% fminsearch and fminunc take the same time
		S(idx) = fminsearch(@(S) (rho - sea_water_density(S,T(idx),p(idx))).^2,S(idx));
		%S(idx) = fminunc(@(S) (rho - sea_water_density(S,T(idx),p(idx))).^2,S(idx));
	end
end


