% Wed  3 Jul 13:40:18 CEST 2019
%% Canter Cremer Number
%% ratio of fresh water to sea water that flows into the estuary
%% Qf : fresh water discharge
%% T  : tidal period
%% Pt : tidal prism
%% Savenije, Salinity and tides, eq. 1.1, 2.35 and 5.67
function N = canter_cremer_number(Qf,T,Pt)
	N = Qf.*T./(Pt);
end

