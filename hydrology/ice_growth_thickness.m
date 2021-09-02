% https://www.meteoblue.com/de/wetter/archive/export/berlin_deutschland
% https://www.wetterkontor.de

% ice breaks below 28 mm for a 80 kg person 
% factors like wind (tree shade), sun, cloudyness not considered

% Ashton 1989

% thermal conductivity of ice
k = 2.22; % W/(m*K)
% heat enthalpy of fusion
L = 3.3355e5 % J/kg
% temperature at ice-water interface
Tm = 0
% density of ice
rho = 910;
% coefficient
alpha = 0.5;
% heat transfer coefficient, still air
% 20 for windy locations
Hi = 10;

tab=readtable('~/temp-ulm.csv');
tab=readtable('~/temp-marzahn.csv');
dt = 1/24;

t = tab.Var2;
I = 0;
for idx=1:length(t)
	I(idx+1,1) = I(idx)+t(idx);
	I(idx+1) = min(I(idx+1),0);
end
fdd = I(2:end);

% integrate
fdd = -dt*fdd;%tab.Var2);

s = sqrt(2*k/(rho*L)*86400)
h = alpha*s*sqrt(fdd);
h(:,2) = 0.0133*(fdd).^0.58;
h(:,3) = sqrt(2*k/(rho*L)*86400*fdd + (k/Hi)^2) - k/Hi;

subplot(2,1,1)
plot(h)
subplot(2,1,2)
plot(fdd)

