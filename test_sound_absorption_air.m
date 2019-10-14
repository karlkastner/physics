% Mon  7 Oct 16:48:32 PST 2019
f = logspace(1,6);

hr_ = [0,100];

clf
for idx=1:length(hr_)
a = sound_absorption_air(f,[],hr_(idx));
%a = a/(1000*0.31);
a = a*1000/0.31;
loglog(f,a)
hold on
end

