% Mon  7 May 18:06:53 CEST 2018
% Karl Kästner, Berlin
%
%% convert temperature from degree Celsius to Kelvin
%% function t_K = celsius_to_kelvin(t_C)
function t_K = celsius_to_kelvin(t_C)
		% offset of temperature (°K)
		TEMPOFFSET_C = -273.16;
		t_K = t_C - TEMPOFFSET_C;
end

