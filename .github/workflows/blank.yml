function [c1, c2] = averages(G,H)
%AVERAGES produces averages inside and outside contour
%G is the matrix of grayscale values. H is heaviside of the Lipschitz function.
s = size(G);
ma = max(s);
jump1 = 1 / ma;
int1 = 0.0;
int2 = 0.0;
int3 = 0.0;
int4 = 0.0;
for i=1:s(1)
    for j=1:s(2)
        int1 = int1 + jump1 * jump1 * double(G(i,j)) * H(i,j);
        int2 = int2 + jump1 * jump1 * H(i,j);
        int3 = int3 + jump1 * jump1 * double(G(i,j)) * (1 - H(i,j));
        int4 = int4 + jump1 * jump1 * (1 - H(i,j));
    end
end
c1 = int1 / int2;
c2 = int3 / int4;

