% 2018-07-20 19:26:44.724801164 +0800
%
%% sound absrobption in water
%% following Francois and Garrison, 1982
%% 
%% 
%% function alpha = sound_absorption(f,S,D,T)
%%
%% input:
%% f : frequency (Hz)
%% S : salinity
%% D : depth (m)
%% T : temperature (degree C)
%%
%% output:
%% alpha = sound attenuation in dB/m (not dB/km)
%%
%% function alpha = sound_absorption(f,S,D,T,model)
%
% TODO this does not yet include pressure and salinity correction
function alpha = sound_absorption_water(f,S,D,T,model)
	if (nargin() < 5)
		model = 'francois-garrison';
	end
	
	switch (model)
	case {1,'francois-garrison'}
		% Hz to kHz
		f = 1e-3*f;
		A_3 = 3.964e-4 - 1.146e-5*T + 1.45e-7*T.^2 - 6.5e-10*T.^3;
		P_3 = 1; % at 0m depth
		alpha = A_3.*P_3.*f.^2;
		% dB/km to dB/m
		alpha = 1e-3*alpha;
	case {2,'fisher-simmons'}
		% fischer and simmons 1988
		A1 = 0; % boric acid	(not relevant for high frequencies)
		A2 = 0; % Magnesium
		% pure water
		P3 = 1; % pressure coefficient
		A3 = (55.9 - 2.37*T + 4.77e-2*T^2 - 3.84e-4*T^3)*1e-15;
		aw = A3*P3*f.^2;
		alpha = neper2db(aw);
	end
end % absorption

