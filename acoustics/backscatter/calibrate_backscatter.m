% Thu 26 Nov 21:44:25 +08 2020
function [param,cp,stat] = calibrate_backscatter(range,c,bs,ibs,weight,mode)
	siz = size(c);
	switch (mode)
	case {'slope-intercept'}
		% fit without attenuation 
		p     = PolyOLS(1);
		p.fit(flat(bs),flat(c),flat(weight));
		cp    = p.predict(flat(bs));
		cp    = reshape(cp,siz);
		param = p.param;
	case {'slope-intercept-attenuation'}		
		% calibrate with attenuation
		%pp            = [1000,50,0,0];
		pp            = [4.3,0.05,0,0];
		%pp           = [pp(2),pp(1),0,0];
		%p             = struct();
		bsfun         = @(p,bs,ibst,range) (p(1).*bs./(1 + 2*p(3).*ibst + 2*p(4)*range) + p(2));
		w_sqrt        = sqrt(weight);
		pp            = lsqnonlin(@(p) flat(w_sqrt).*(flat(c) - bsfun(p,flat(bs),flat(ibs),flat(range))),pp);
		cp            = bsfun(pp,flat(bs),flat(ibs),flat(range));
		cp            = reshape(cp,siz);
		param = pp;
%		obj.param{1}  = pp;
	case {'power-law'}	
		% power law
		lp  = PowerLS();
		lp.fit(flat(bs),flat(c),flat(weight));
		cp    = reshape(lp.predict(flat(bs)),siz);
		param = lp.param;
	otherwise 
		error('unimplemented method');
	end
		%obj.param{3} = lp.param;
		cp = real(cp);	

		% statistics for goodness of fit	
		%cp_ = reshape(cp,[],3);
		%res = cp_ - flat(tsi.ct);
		%Rs = [];
		%rmse  = [];
		%mae = [];
		%mre = [];
		stat = struct();
		%for idx=1:size(cp_,2),
		stat.sd         = wstd(flat(weight),flat(c));
		stat.rmse       = wrms(flat(weight),flat(c-cp));
		%stat.R2         = wcorr(,cp_(:,idx))^2;
		stat.R2         = 1 - (stat.rmse./stat.sd).^2;		

		 %stat.mre(idx)   = max(abs((flat(tsi.ct)-cp_(:,idx)))./abs(flat(tsi.ct)));
		 %stat.mae(idx)   = mean(abs((flat(tsi.ct)-cp_(:,idx))));
		 %stat.maxae(idx) = max(abs((flat(tsi.ct)-cp_(:,idx))));
		 %stat.rmsre(idx) = rms((flat(tsi.ct)-cp_(:,idx))./flat(tsi.ct));
		 %rmsre(idx) = rms(log(cp_(:,idx)./flat(tsi.ct)));
		%end

		%for idx=1:size(cp,5)
		%	obj.tsi.rmse(idx) = wrms(flat(weight),flat(cp(:,:,:,:,idx)-tsi.ct));
			%obj.tsi.R2(idx)   = wcorr(flat(weight),flat(tsi.ct),flat(weight),flat(cp(:,:,:,:,idx))).^2;
		%	obj.tsi.R2(idx)   = corr(flat(tsi.ct),flat(cp(:,:,:,:,idx))).^2;
		%end
end
	
