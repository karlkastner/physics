function sigma = scattering_cross_section(d_mm,f_Hz,varargin)
	d_m = 1e-3*d_mm;

	% form function
	fb     = backscatter_form_function(d_mm,f_Hz,varargin{:});

	sigma =	1/4*(d_m/2).^2.*fb.^2;
end


