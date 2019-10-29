% Mon  7 Oct 16:04:32 PST 2019
function psat = saturation_vapor_pressure(ps0,T)
	%T0 = 293.15;	
	mode = 1;
	T01 = 273.16;	
	switch (mode)
	case {0}
	% bass 1990 (5), corrected in bass 1995 (1)
	psat = ps0*10.^(10.79584*(1-T01./T) ...
		- 5.02808*log10(T./T01) ...
		+ 1.50474e-4*(1-10^(-8.29692*(T/T01-1))) ...
		- 4.2873e-4*(10^(-4.76955*(1-T01/T)-1)) ...
		- 2.2195983);
	case {1}
		% iso
		psat = ps0*10.^(-6.8346*(T01./T).^1.261 + 4.6151);
	end
end

