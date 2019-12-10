%(t0, y0, tf, h, f)
function abser = euler2_10(t0, y0, tf, h, f,trueF)
    numb=(tf-t0)./h + 1;
    tn=t0;
    yn=y0;
    x(numb)=0;
    y(numb)=0;
    TrueVal(numb)=0;
    for n=1:numb
        x(n)=tn;
        y(n)=yn;
        TrueVal(n)= trueF(tn);
        slop=f(tn,yn);
        tn=tn+h;
        yn=slop.*h+yn;
        
    end
    AbsError = abs(TrueVal - y);
    hold on;
    plot(x,y)
    xlabel('t')
    ylabel('y')
    abser=AbsError;
end
