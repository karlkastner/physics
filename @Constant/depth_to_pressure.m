% Sa 16. Mai 15:04:18 CEST 2015
% Karl Kästner, Berlin
%
%% convert depth to pressure in fresh water at standard temperature
%% 
%%    z = (p - p0)/(rho g)
%% => p = rho g z + p0
%%
%% input :
%% p0 : nx1 or scalar, pressure at water surface in BAR
%% d  : depth in metre
%%
%% output :
%% p  : nx1, pressure at measurement depth in BAR
%%
%
% TODO this is only valid for
% fresh water, max error compared to salt is (3.5-1)% = 2.5%
% constant temperature of 4degC,
% error at 30degC is 4 per mille (negligible)
% no suspended sediment
function p = depth_to_pressure(d,p0)
	%d = (p - p0)/(Constant.BAR_PER_PASCAL*Constant.g*Constant.density.water);
	p = Constant.BAR_PER_PASCAL*Constant.g*Constant.density.water*d + p0;
end

