% Sat 21 Jul 14:40:39 CEST 2018
%
%% convert suspended sediment concentration to backscatter,
%% not including attenuatio by sediment
%%
%%
%% function bs = ssc2backscatter(ssc,d_mm,f,varargin)
%%
%% input
%% d_mm   : particle radius
%% f_Hz   : transducer frequency
%% C_kgm3 : mass concentration of sediment [ssc] = g/l = kg/m^3
%%
%% output
%% bs : backscatter, [bs] = (m/s)^2
function bs   = ssc2backscatter(d_mm,f_Hz,C_kgm3,varargin)
	rho_s = Constant.density.quartz;
	d_m     = 1e-3*d_mm;

	% mass of a single particle
	m1    = rho_s*Geometry.sphere_volume(d_m/2);

	% number of particles
	n     = C_kgm3./m1;

	% scattering cross section of a sincle particle
	sigma = scattering_cross_section3(d_mm,f_Hz,varargin{:});

	% backscatter
	% bs = ks^2 C_kgm3
	bs = n.*sigma;

	% note that this makes it consistend with Thorne meral, eq 1
	% sassi 1212 has the spurious factor of 3/(16 pi) in 
	bs = bs/(3/(pi*16));
end % ssc2backscatter

