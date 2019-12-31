function [Lnew] = pde2(delta,mu,L,v,l1,l2,F,c1,c2)
%PDE2 finds L(n+1) based on all the needed values
s = size(F);
Lnew = L;
t = 0.001/mu;
for i=1:s(1)
    for j=1:s(2)
        Lnew(i,j) = L(i,j) + t * delta(i,j) * (mu * (((L(i+2,j)-2*L(i+1,j)+L(i,j))*(L(i,j+1)-L(i,j))^2-2*(L(i+1,j+1)+L(i,j)-L(i,j+1)-L(i+1,j))*(L(i+1,j)-L(i,j))*(L(i,j+1)-L(i,j))+(L(i,j+2)-2*L(i,j+1)+L(i,j))*(L(i+1,j)-L(i,j))^2)/((abs(L(i+1,j)+L(i,j+1)-2*L(i,j)))^1.5)) - v - l1*(F(i,j)-c1)^2 + l2*(F(i,j)-c2)^2);
        if isinf(Lnew(i,j)) || isnan(Lnew(i,j))
         %   Lnew(i,j) = L(i,j) + t * delta(i,j) * (0.0 - v - l1*(F(i,j)-c1)^2 + l2*(F(i,j)-c2)^2);
            Lnew(i,j) = L(i,j) + t * delta(i,j) * (mu * (((L(i+2,j)-2*L(i+1,j)+L(i,j))*(L(i,j+1)-L(i,j))^2-2*(L(i+1,j+1)+L(i,j)-L(i,j+1)-L(i+1,j))*(L(i+1,j)-L(i,j))*(L(i,j+1)-L(i,j))+(L(i,j+2)-2*L(i,j+1)+L(i,j))*(L(i+1,j)-L(i,j))^2)/((abs(L(i+1,j)+L(i,j+1)-2*L(i,j)+0.000000001))^1.5)) - v - l1*(F(i,j)-c1)^2 + l2*(F(i,j)-c2)^2);
        end
    end
end
