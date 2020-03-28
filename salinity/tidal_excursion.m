% Wed  3 Jul 14:29:55 CEST 2019
% Karl Kastner, Berlin
%% Tidal excursion length
%% Pt : tidal prism
%% h0 : depth
%% w0 : width
function E = tidal_excursion(Pt,h0,w0)
	E = Pt./(w0*h0);
end

