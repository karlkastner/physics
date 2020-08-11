% Mon Jan 19 11:11:13 CET 2015
% Karl Kästner, Berlin
%
%% convert pressure to depth in fresh water at standard temperature
%% 
%% z = (p - p0)/(rho*g)
%%
%% input:
%% p  : nx1, pressure at measurement depth in BAR
%% p0 : nx1 or scalar, pressure at water surface in BAR
%%
%% output:
%% d  : depth in metre
%
% TODO this is only valid for
% fresh water, max error compared to salt is (3.5-1)% = 2.5%
% constant temperature of 4degC,
% error at 30degC is 4 per mille (negligible)
% no suspended sediment
function d = pressure_to_depth(p,p0)
	d = (p - p0)/(Constant.BAR_PER_PASCAL*Constant.g*Constant.density.water);
end

