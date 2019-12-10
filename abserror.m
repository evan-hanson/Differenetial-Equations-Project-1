%(t0, y0, tf, N, f)
function out = abserror(t0, y0, tf, N, f,trueF)
    numb=N+1;
    tn=t0;
    yn=y0;
    x(numb)=0;
    y(numb)=0;
    TrueVal(numb)=0;
    h = (tf-t0)./N;
    for n=1:numb
        x(n)=tn;
        y(n)=yn;
        TrueVal(n)= trueF(tn);
        slop=f(tn,yn);
        tn=tn+h;
        yn=slop.*h+yn;
        
    end
    AbsError = abs(TrueVal - y);
    out=AbsError;
end
