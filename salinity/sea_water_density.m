% Wed 12 Jun 21:24:50 CEST 2019
% Karl Kastner, Berlin

function [rho,rho_smow,K] = sea_water_density(S,T,p)
%K = compressibility(S,T,P);

a0	=  999.842594;
a1	=  6.793953e-2;
a2	= -9.095290e-3;
a3	=  1.001685e-4;
a4	= -1.120083e-6;
a5	=  6.536332e-9;

b0 =  8.2449e-1;
b1 = -4.0899e-3;
b2 =  7.6438e-5;
b3 = -8.2467e-7;
b4 =  5.3875e-9;

c0 = -5.7246e-3;
c1 =  1.0227e-4;
c2 = -1.6546e-6;

d0 = 4.8314e-4;

e0 =  19652.210000;
e1 =  148.420600;
e2 = -2.327105;
e3 =  1.360477e-2;
e4 = -5.155288e-5;

f0 =  54.674600;
f1 = -0.603459;
f2 =  1.099870e-2;
f3 = -6.167000e-5;

g0 =  7.9440e-2;
g1 =  1.6483e-2;
g2 = -5.3009e-4;
h0 =  3.23990;
h1 =  1.43713e-3;
h2 =  1.16092e-4;
h3 = -5.77905e-7;
i0 =  2.28380e-3;
i1 = -1.09810e-5;
i2 = -1.60780e-6;
j0 =  1.91075e-4;

k0 =  8.50935e-5;
k1 = -6.12293e-6;
k2 =  5.27870e-8;
m0 = -9.9348e-7;
m1 =  2.0816e-8;
m2 =  9.1697e-10;

B1 = b0 + b1*T + b2*T.^2 + b3*T.^3 + b4*T.^4;
C1 = c0 + c1*T + c2*T.^2;
F1 = f0 + f1*T + f2*T.^2 + f3*T.^3;
G1 = g0 + g1*T + g2*T.^2;
Aw = h0 + h1*T + h2*T.^2 + h3*T.^3;
A1 = Aw + (i0 + i1*T + i2*T.^2).*S + j0*S.^1.5;
Bw = k0 + k1*T + k2*T.^2;
B2 = Bw + (m0 + m1*T + m2*T.^2).*S;

rho_smow = a0 + a1*T + a2*T.^2 + a3*T.^3 + a4*T.^4 + a5*T.^5;
rho_ST0 = rho_smow + B1.*S + C1.*S.^1.5 + d0.*S.^2;
Kw = e0 + e1*T + e2*T.^2 + e3*T.^3 + e4*T.^4;
K_ST0 = Kw  + F1.*S + G1.*S.^1.5;
K_STp = K_ST0 + A1.*p + B2.*p.^2;

rho = rho_ST0./(1 - p./K_STp);

if (~issym(S))
	rho(S<0) = NaN;
end

end
