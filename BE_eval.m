function Res=BE_eval(Bme,t_i)
    n=length(Bme);
    Res=zeros(n,1);
    for i=1:n
        syms t;
        Res(i)=subs(Bme(i),t,t_i);
    end
end