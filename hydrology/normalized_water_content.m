% 2021-07-07 21:00:36.449997364 +0200
function Se = normalized_water_content(h,a,n,k)
	switch (k)
	case {0}
		m = 1-1./n;
	case {1}
		m = 1-2./n;
	end
	Se = (1 + abs(a.*h).^n).^-m;
end

