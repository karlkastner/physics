% Wed Aug 27 10:42:35 CEST 2014
% Karl Kastner, Berlin
%
%% Physics and physical standard quantities
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
classdef Physics
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
		DB2NEPER = log(10)/20;
		% unit kg/m^3
		density = struct( 'water',     1000, ...
                                  'quartz',    2650,...
				  'steel',     8000, ...
				  'aluminium', 2700, ...
				  'air',       1.225);
		% note: temperature dependend, here 20DegC is adopted
		% unit Pa*s
		% kinematic is nu=mu/rho
		% dynamic viscosity (my)
		% TODO use equation 2.3 in julien
		%viscosity = struct('dynamic',struct('water',1e-3), ... % Pa*s = kg/sm
		%                   'kinematic',struct('water',1e-6));
		 % = struct('water', 1e-3);
		packing_density = struct('spheres',0.65);

		% yield strength : onset of plastic behaviour
		yield_strength_Pa = struct(   'quartz', 158*1e6, ...
					       'steel', 250*1e6, ...
					      'brass',  135*1e6, ...
                                           'aluminium',  83*1e6 ...
						);

		youngs_modulus_Pa = struct(    'steel',     200*1e9, ...
        				   'aluminium',  69*1e9, ...
					      'quartz',  77*1e9, ...
					      'brass',  100*1e9 ...
					    );

		% W/(m s K)
		thermal_conductivity = struct(     'glass', 0.96, ...
		           	    		'concrete', 0.90, ...
			   	    		    'wood', 0.08, ...
			       			     'air', 0.024 );

		% J/(C*kg)
		heat_capacity = struct('water', 4.186e3, ...
				       'air',   0.72e3 );

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
		q    = thermal_flux(dT,A,dx,k);
		c    = sound_velocity_water(T);
	        alpha = sound_absorption_water(f,S,D,T,model);
		t_C  = kelvin_to_celsius(t_K);
		t_K  = celsius_to_kelvin(t_C);
		d    = pressure_to_depth(p,p0);
		p    = depth_to_pressure(d,p0);
		[nu,mu] = viscosity_kinematic_water(T_C);
		mu = viscosity_dynamic_water(T_C);
		%d = dimensionless_grain_size(d50,rhos);
		%theta = critical_shear_stress_ratio(dstar,mode);
	end % methods (Static)
end % classdef Const

