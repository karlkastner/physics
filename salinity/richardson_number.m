% Wed  3 Jul 14:04:11 CEST 2019
%% Estuarine Richardson Number
%% potential energy due to mixing the entire fresh water with sea water
%% ratio of potential energy and buoyancy 
%% Savenije, Salinity and Tides, 2.36
%% drho : difference of sea water and fresh water density
%% rho  : fresh water density
%% h    : depth
%% v    : tidal velocity scale
%% N    : Cramer number
function Nr = richardson_number(drho,rho,h,v,N)
	if (isempty(drho))
		drho = 25; % kg
	end
	if (isempty(rho))
		rho = 1e3;
	end
	g = 9.81;
	Nr = drho./rho.*g.*h./v.^2.*N; % N=Qf*T/Pt 
end

