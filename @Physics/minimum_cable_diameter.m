% 2019-10-28 13:27
% single pole isolated in air
% source: VDE 0298 T4 06/13 Tabellen: 11, 17, 18, 21, 26 und 27
% copper cable
function A_mm2 = minimum_cable_diameter(I_A,T_C)
if (nargin()<2)
	T_C = 30;
end
AI = [0.75  15
1.00  19
1.50  24
2.50  32
4.00  42
6.00  54
10.00  73
16.00  98
25.00  129
35.00  158
50.00  198
70.00  245
95.00  292
120.00  344
150.00  391
185.00  448]
A_mm2 = interp1(AI(:,1),AI(:,2),I_A,'linear',NaN);

% for cables with max 70C environment temperature
TF = [10  1.22
15  1.17
20  1.12
25  1.06
30  1.00
35  0.94
40  0.87
45  0.79
50  0.71
55  0.61
60  0.50
65  0.35]

% temperature correction
A_mm2 = A_mm2*interp1(TF(:,1),TF(:,2),T_C);

end

