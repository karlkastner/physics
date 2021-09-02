% 2021-05-06 22:11:18.670509712 +0200
function Epot = potential_evapotranspiration_langbein(T_C)
	Epot = 325 + 21*T_C + 0.9*T_C.^2;
end

