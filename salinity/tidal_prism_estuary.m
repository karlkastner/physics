% Wed  3 Jul 14:16:10 CEST 2019
% Karl Kastner, Berlin
%% Tidal prism
%% Pt = int_lsw^hws Q_t dt ~ A E
%% z1 : tidal amplitude
%% w0 : width of estuary at mouth
%% b  : length of width convergence
%% dH_dx = rate of damping of H
%% c.f. Savenije 2.34, 2.64
% TODO damping and phase lag
function P = tidal_prism(z1,w0,b,dz1_dx)
	% Q1 = w*tidal_discharge(z1,h0);
	% tidal range
	H = 2*abs(z1);
	dH_dx = 2*dz1_dx;
	% for a progressive wave
	P = H.*w0.*b./(1-dH_dx.*b);
end

