% Wed  3 Jul 13:45:31 CEST 2019
%% Dispersion at river mouth during high water slack 
%%
%% v0 : tidal velocity scale
%% E0 : tidal excursion
%% h0 : depth
%% a  : convergence length
%% Nr : Richargson Number
%%
%% Savenije 1993c, Savenije, Salinity and Tides, eg. 5.70
function D0_hws = dispersion_hws_savenije(v0,E0,h0,a,Nr,isconvergent)
	if (~isconvergent)
		D0_hws = 1400*v0.*h0*sqrt(Nr);
	else
		D0_hws = 1400*v0.*h0.*E0./a.*sqrt(Nr);
	end
end

