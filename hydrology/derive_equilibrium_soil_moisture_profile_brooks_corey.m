 syms ts h psi b dG;
dv_dh = ts*(1-(h/psi)^(-1/b))
solve(dv_dh,h)
I = int(dv_dh,h)
simplify(subs(I,h,dG)-subs(I,h,psi))
