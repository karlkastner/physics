% Fri 20 Nov 14:53:26 +08 2020
%
%% backscatter as it would be measured,
%% when radial spreading, near field distortion and attnuation by water have been corrected for,
%% i.e. backscatter as caused and attenuated by sediment
%% 
%% output :
%%   bs : backscatter
%%  ibs : integral of backscatter from transducer
%%
%% bs(R)  = 1/ks(R)^2*C(R)*exp(-int_0^R 2 as(r) dr)
%% ibs(R) = int_0^R bs(r) dr
%%
%% values are integrated by the midpoint rule
%%
%% input :
%% dr_m : steps of radial distance from transducer,
%%        not necessarily along the vertical
%% d_mm : sediment diameter
%% C_kg : mass concentration of sediment given at mid-points
%% f_Hz : sound frequency of transducer
%%
%% dimensions:
%%  	1 (row)    : along range
%% 	2 (column) : ensemble / profile (space-time)
%%      3          : grain size class
function [bs,ibs,out] = simulate_backscatter(dr_m,d_mm,C_kgm3,f_Hz)

	siz = size(C_kgm3);

	% backscatter by size class
	bsk = zeros(siz);
	% attenuation by size class per unit distance
	ask = zeros(siz);

	% for each size class
	for idx=1:length(d_mm)
	        bsk(:,:,idx) = ssc2backscatter(d_mm(idx),f_Hz,C_kgm3(:,:,idx));               
	        ask(:,:,idx) = attenuation(d_mm(idx),f_Hz,C_kgm3(:,:,idx));
	end
	% total backscatter (integrated over all fractions)
	bs0  = sum(bsk,3);
	% total attenuation per unit distance (integrated over all fractions)
	as   = sum(ask,3);

	% squared attenuation coefficient (integrated over distance)
	% note that the last bin on average is only passed 1/2 times
	% exp(int_0^R a_s dr) \approx exp( (sum_(i=1)^(k-1) a_s(i) dr(i)) + 1/2 a_s(k) dr(k))
	ia  = exp(-((cumsum(as.*dr_m) - 0.5*as.*dr_m)));

	% backscatter attenuated by sound
	% squaring to account for loss on forward and return path
	bs = (ia.^2).*bs0;

	% integral of backscatter from transducer to target
	ibs = cumsum(bs.*dr_m) - 0.5*bs.*dr_m;

	if (nargout()>2)
		out.bsk = bsk;
		out.ask = ask;
		out.ia  = ia;
		out.as  = as;
		out.bs0 = bs0;
	end
end % simulate_backscatter

