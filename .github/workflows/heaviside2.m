function [H,delta] = heaviside2(L,eps)
%HEAVISIDE2 Performs the arctan version of the Heaviside function
s = size(L);
for i=1:s(1)
    for j=1:s(2)
        H(i,j) = 0.5*(1 + (2/pi)*atan(double(L(i,j))/eps));
        delta(i,j) = eps/(pi*((double(L(i,j)))^2+eps^2));
    end
end
