% Nov 28  2019

rho_a   = 1.2; % kg/m^3
c_a     = 344; % m/s
rho_w   = 1000;
c_w     = 1500; 

c_quartz = 5800

z_a = rho_a*c_a
z_w = rho_w*c_w

% this is about 1/1000, two way 1/1e6
T = sound_transmission_coefficient(rho_a*c_a,rho_w*c_w)



% for glass:
T = (z_a/z_g)^2*(v_g/(pi*f*d))^2


