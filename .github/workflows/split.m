function [in,out] = split(I,L)
s = size(I);
out = I;
in = I;
for i=1:s(1)
    for j=1:s(2)
        if L(i,j) < 0
            in(i,j,1) = 256.0;
            in(i,j,2) = 256.0;
            in(i,j,3) = 256.0;
        else
            out(i,j,1) = 256.0;
            out(i,j,2) = 256.0;
            out(i,j,3) = 256.0;
        end
    end
end
