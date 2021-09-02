% Sun  8 Jul 10:41:40 CEST 2018
%%
%% accoustic attenuation coefficient of suspended particles
%%
%% c.f hanes 2012
%%
%% input
%% [d_mm]   = mm            : (sieve) diameter of particles
%% [f_hz]   = Hz = 1/s      : transducer frequency
%% [C_kgm3] = kg/m^3 = mg/l : mass concentration of sediment
%%
%% output
%% [a_s]    = 1/m (neper) : total attenuation per unit distance
%%  a_snu   : viscuous attenuation
%%  a_ss    : attenuation due to scattering
%% for db : chi_db  = 8.7 chi_neper
%%
%% for normalization : chi_s = a_s(C_kgm3=2650)
%%
%% function [as,asnu,ass,X,chi] = attenuation_coefficient(d_mm,f,C_kgm3,mode)
%%
function [a_s,a_snu,a_ss,X,chi_neper] = attenuation(d_mm,f_Hz,C_kgm3,opt)
	if (nargin()<3 || isempty(C_kgm3))
		% unit mass concentration (1kg/m^3)
		C_kgm3 = 1;
	end
	if (nargin() < 4)
		opt = struct();
	end
	if (isfield(opt,'rho_s'))
		rho_s = opt.rho_s;
	else
		rho_s = Constant.density.quartz;
	end
	% pass rho_w in case of saline water
	if (isfield(opt,'rho_w'))
		rho_w = opt.rho_w;
	else
		rho_w = Constant.density.water;
	end
	if (isfield(opt,'method'))
		method = opt.method;
	else		
		%mode = 'thorne-theoretical';
		%mode = 'thorne-empirical';
		method = 'moate-2012';
	end

	d_m    =  1e-3*d_mm;

	[chi_neper,k] = normalized_particle_radius(d_mm,f_Hz);

	a_snu = viscuous_attenuation(C_kgm3, d_mm, k, f_Hz, rho_s,rho_w);

	% attenuation by scattering (shadowing)
	switch (method)
	case {'urick-1948'}	
		% ass = (d_m*C_kgm3*k^4)/(12*pi*rho_s);
		X   = 1/4.5*chi_neper.^4;
	case {'thorne-manley-1993'}
		if (0)
			Ka = (gk^2 + gr^2/3)/6;
		else
			% from thorne-hardcastle 1993
			Ka = 0.18;
		end
		X  = (4/3)*Ka*chi_neper.^4./(1 + 0.9*chi_neper.^(5/2) + 4/3*Ka*chi_neper.^4);
	case {'thorne-hardcastle-1993'}
		ka = 0.18;
		X = 4/3*ka*chi_neper.^4./(1 + chi_neper.^2 + 4/3*ka*chi_neper.^4);
	case {'medwin-clay-1997'}
		% c.f. Russ and Boss 2012
		% scattering cross section
		sigma = TODO;
		X = 4/pi*sigma;
	case {'thorne-hanes-2002'}
		ka = 0.18;
		X = 1.1*(4/3)*ka*chi_neper.^4./(1 + 1.3*chi_neper.^2 + 4/3*ka*chi_neper.^4);
	case {'thorne-meral-2008'}
		% thorne 2008 eq 9
		% hanes 2012
		% scattering cross-section
		X   = ( 0.29*chi_neper.^4 )./(0.95 + 1.28*chi_neper.^2 + 0.25*chi_neper.^4);
		%ass = 1.5./d_m.*C_kgm3/rho_s.*X;
	case {'betterridge-thorne-2008'}
		X = 0.24*(1-0.4*exp(-((chi_neper-5.5)/2.5).^2)) ...
			.*chi_neper.^4./(0.7 + 0.3*chi_neper + 2.1*chi_neper.^2 - 0.7*chi_neper.^3 + 0.3*chi_neper.^4);
	case {'thorne-theoretical'}
		% thorne 2008, eq 5b
		e  = 39;
		%  X ~ 0.26
		X  = 2*( ((e-1)/(3*e))^2 + 1/3*((rho_s - rhow)/(2*rho_s+rhow))^2);
		X  = X*chi_neper.^4;
		%f   = 1.17*chi_neper^2;
		%ass = 1.5./d_m.*C_kgm3/rho_s.*X;
	case {'moate-2009'}
		% asymptote for raleigh   0.32 xi^4
		% asymptote for geometric 1.4
		X = 0.29*chi_neper.^4./(0.92 + 0.9*chi_neper.^2 + 0.21*chi_neper.^4);
	case {'moate-2012'} % c.f. thorne 2014, aberle 2017
		X = rho_s*(0.09*chi_neper.^4)./(1380 + 560*chi_neper.^2 + 150*chi_neper.^4);
	otherwise
		error('here');
	end
	% thorne 2008, 1, a3
	% 1.5 neper ~ 6.5 db, c.f guerrero 2011
	a_ss = 3/2*C_kgm3./(d_m*rho_s).*X;

	% total attenuation
	a_s = a_snu + a_ss;
end % attenuation

