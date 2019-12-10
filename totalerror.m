function [out] = totalerror(tn,to,h,AbsError)
TotalError = 0;
for i=0: (tn-to)./h
    TotalError = TotalError + (h .* AbsError(i+1));
end
out = TotalError;
end

