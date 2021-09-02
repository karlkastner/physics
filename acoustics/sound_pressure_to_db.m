% http://www.sengpielaudio.com/calculator-soundlevel.htm
function L_db = sound_pressure_to_db(p)
	p0   = 2*10^-5;
	L_db = 20*log10(p./p0);
end
