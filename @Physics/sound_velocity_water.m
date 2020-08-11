% Sun Oct  6 16:24:11 UTC 2013
% Karl Kästner, Berlin
%
%% sound velocity in water
%% following Lubbers and Graaff (1998)
%% this formula does not include depth and salinity effects
%
function c = sound_velocity_water(T)
	if (nargin()<1)
		% standard temperature
		T = 20;
	end
	c = 1404.3 + 4.7*T + 0.04*T.^2;
end

