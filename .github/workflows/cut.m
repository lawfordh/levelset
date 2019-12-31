function [c] = cut(L,bound)
c = L;
for i=1:size(L,1)
    for j=1:size(L,2)
        if abs(L(i,j)) > bound
            c(i,j) = 0.0;
        end
    end
end
