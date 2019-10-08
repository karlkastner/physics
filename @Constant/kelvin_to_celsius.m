% Mon  7 May 18:06:53 CEST 2018
% Karl Kästner, Berlin
%
%% convert temperature degree Kelvin to Celsius
function t_C = kelvin_to_celsius(t_K)
		% offset of temperature (°K)
		% TODO no magic numbers
		TEMPOFFSET_C = -273.16;
		t_C = t_K + TEMPOFFSET_C;
end

