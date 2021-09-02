% Sun  9 May 18:54:35 CEST 2021
function [tab_h,tab_d,s] = simumlate_weather(monthly_P,monthly_R,monthly_TC,monthly_S,T)
	itype = 'linear';

	p_ww_h = 0.9;
	T_ww_h = 1/(1-p_ww_h);
	T_ww_d = 1/24*T_ww_h;
	
	days_per_month = 365/12;
	hours_per_month = 24*days_per_month;

	% hourly_t = (0.5/24:1/24:365-0.5/24);

	% day of year
	% mod(0:nt-1,365)+1;
	hourly_t = (0:1/24:T-1/24)';
	J        = mod(hourly_t,365);

	% number of days with rainfall
	n_w = monthly_R;
	% probability that rainfall starts
	% corrected for overlap between consecutive days
	q = n_w/days_per_month;
	p_dw_d = (1 + T_ww_d - (1 + 2*T_ww_d - 4*T_ww_d*q + T_ww_d.^2).^(1/2))./(2*T_ww_d);

	% probability, that rainfall starts per hour
	p_dw_h = (1-(1-p_dw_d).^(1/24));

	% calculation of average intensity of an individual event
	p_dd_h = 1-p_dw_h;
	T_dd_h = 1./(1-p_dd_h);
	I_m    = monthly_P*12/(24*365).*(T_dd_h+T_ww_h)./T_ww_h;

	t_m = (0.5:11.5)'*(365/12);

	% interpolate to hourly_data
	p_dw_h      = interp1_circular(t_m,p_dw_h,J,itype);
	hourly_I    = interp1_circular(t_m,I_m,J,itype);
	hourly_TC   = interp1_circular(t_m,monthly_TC,J,itype);
	hourly_S    = interp1_circular(t_m,monthly_S,J,itype);

	latitude_rad = deg2rad(50);
	z_m = 0;
	[Rs,Rso,Ra] = solar_radiation(latitude_rad,J,hourly_S,z_m);
%	hourly_Epot      = potential_evapotranspiration_abtew(Rs,hourly_TC)/24;
%	hourly_Epot      = potential_evapotranspiration_blaney_criddle(hourly_TC,hourly_S)/24;
	hourly_Epot     = potential_evapotranspiration_makking(Rs,hourly_TC)/24;
%	hourly_Epot     = potential_evapotranspiration_turc(Rs,hourly_TC)/24;

%	hourly_Epot = potential_evapotranspiration_langbein(hourly_TC);
%	hourly_Epot = potential_evapotranspiration_langbein(mean(hourly_TC))/mean(hourly_Epot)*hourly_Epot/(365*24);

	% rainfall
	nt  = T*24;
	hourly_P = zeros(nt,1);
	% intensity
	%I = exprnd(I,nt,1);
	for idx=2:nt
		if (hourly_P(idx-1) == 0)
			% dry to wed
			hourly_P(idx) = (rand()<=p_dw_h(idx));
		else
			% wet to wet
			hourly_P(idx) = (rand()<=p_ww_h);
		end
		if (hourly_P(idx))
			hourly_P(idx) = exprnd(hourly_I(idx));
		end
	end

	t0 = datenum('01/01/2000');
	hourly_t = hourly_t + t0;
	hourly_datestr = datestr(hourly_t,'yyyymmddhh');
	tab_h            = table(hourly_datestr,hourly_t,hourly_P,hourly_Epot,hourly_TC);
	tab_h.Properties.VariableNames = {'date','t_d','P_mm','Epot_mm','T_C'};

	% compute daily values
	daily_P    = sum(reshape(hourly_P,24,[]))';
	daily_Epot = sum(reshape(hourly_Epot,24,[]))';
	daily_TC   = mean(reshape(hourly_TC,24,[]))';
	daily_t    = hourly_t(1:24:end); 
	daily_date     = hourly_datestr(1:24:end,:);
	tab_d      = table(daily_date,daily_t,daily_P,daily_Epot,daily_TC);
	tab_d.Properties.VariableNames = {'date','t_d','P_mm','Epot_mm','T_C'};

	s.T_dd_h = T_dd_h;
	s.T_ww_h = T_ww_h;
	s.p_ww_h = p_ww_h;
	s.p_dd_h = p_dd_h;
	s.p_dw_h = p_dw_h;
	s.p_wd_h = (1-p_ww_h);

	% verification
	if (1)
		% number of wet days
		val = [sum(monthly_R),mean(daily_P>0)*365];
		fprintf('R        %5.2f %5.2f %5.2f\n',val(1),val(2),(val(2)-val(1))/val(1));
		fprintf('%f %f %f\n',[mean(hourly_P>0) mean(s.T_ww_h)./mean(s.T_ww_h+s.T_dd_h)]);
		% annual rainfall amount
		val = [sum(monthly_P),mean(daily_P)*365];
		printf('P         %5.2f %5.2f %5.2f %f\n',val(1),val(2),(val(2)-val(1))/val(1),std(daily_P)/sqrt(length(daily_P))/mean(daily_P));
		val = [mean(monthly_TC),mean(daily_TC)];
		printf('TC        %5.2f %5.2f %f5.2\n',val(1),val(2),(val(2)-val(1))/val(1));
		printf('ETpot     %5.2f\n',mean(daily_Epot)*365/12);
%		P_  = reshape(P,24,[]);
%		P_  = sum(P_);
%	val = [365*mean(P_>0),mean(t.R_d)*12, ];
%	printf('rain days %5.2f %5.2f %f\n',[val,val(1)/val(2)]);
	%[mean(s.T_ww_h./(s.T_ww_h+s.T_dd_h)*365)/12, mean(s.T_dd_h./(s.T_ww_h+s.T_dd_h)*365)/12]
	end
end

