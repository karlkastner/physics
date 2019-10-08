% Wed Aug 27 10:42:35 CEST 2014
% Karl Kastner, Berlin
%
%% Constant and physical standard quantities
%
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
%  
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%  
%  You should have received a copy of the GNU General Public License
%  along with this program.  If not, see <https://www.gnu.org/licenses/>.
classdef Constant
	properties (Constant)
		% von Karman constant
		Karman = 0.41;
		% acceleration by gravity on earth
		g = 9.81; % m/s^2
		gravity = 9.81;
		MINUTES_PER_DAY  = 1440;
		MINUTES_PER_YEAR = 1440*365.25;
		SECONDS_PER_DAY  = 86400;
		SECONDS_PER_YEAR = 86400*365.25;
		% unit kg/m^3
		density = struct( 'water',  1000, ...
                                  'quartz', 2650);
		% note: temperature dependend, here 20DegC is adopted
		% unit Pa*s
		% kinematic is nu=mu/rho
		% dynamic viscosity (my)
		% TODO use equation 2.3 in julien
		viscosity = struct('dynamic',struct('water',1e-3), ... % Pa*s = kg/sm
		                   'kinematic',struct('water',1e-6));
		 % = struct('water', 1e-3);
		packing_density = struct('Spheres',0.65);

		%
		% Mathematics
		%
		% euler
		Euler = exp(1);
		
		sound_velocity_quartz = 5968;

		%
		% pressure
		% 
		BAR_PER_PASCAL = 1e-5;
	end % Const
	methods (Static)
		c    = sound_velocity_water(T);
	        alpha = sound_absorption(f,S,D,T,model);
		t_C  = kelvin_to_celsius(t_K);
		t_K  = celsius_to_kelvin(t_C);
		d    = pressure_to_depth(p,p0);
		p    = depth_to_pressure(d,p0);
		%d = dimensionless_grain_size(d50,rhos);
		%theta = critical_shear_stress_ratio(dstar,mode);
	end % methods (Static)
end % classdef Const
