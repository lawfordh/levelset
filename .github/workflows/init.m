function [Phi] = init(I)
%INIT Initializes lipschitz function with a rectangular contour
%   Input image output matrix with Lipschitz values
s = size(I);
Phi = zeros(s(1)+2,s(2)+2);
step = 1 / max(double(s(1)),double(s(2)));

u = floor(double(s(1))/4);
l = floor(double(3*s(1))/4);
left = floor(double(s(2))/4);
right = floor(double(3*s(2))/4);

for i=1:s(1)+2
    for j=1:s(2)+2
        if (i >= u) && (i <= l) && (j < left)
            Phi(i,j) = j - left;
        elseif (i < u) && (j < left)
            Phi(i,j) = -1 * sqrt(double((i-u)^2 + (j-left)^2));
        elseif (i < u) && (j >= left) && (j <= right)
            Phi(i,j) = i - u;
        elseif (i < u) && (j > right)
            Phi(i,j) = -1 * sqrt(double((i-u)^2 + (j-right)^2));
        elseif (i >= u) && (i <= l) && (j > right)
            Phi(i,j) = right - j;
        elseif (i > l) && (j > right)
            Phi(i,j) = -1 * sqrt(double((i-l)^2 + (j-right)^2));
        elseif (i > l) && (j >= left) && (j <= right)
            Phi(i,j) = l - i;
        elseif (i > l) && (j < left)
            Phi(i,j) = -1 * sqrt(double((i-l)^2 + (j-left)^2));
        elseif (i > u) && (i < l) && (j > left) && (j < right)
            d = [(i - u),(l - i),(j - left),(right - j)];
            Phi(i,j) = double(min(d));
        end
    end
end
Phi = step .* double(Phi);
