function [C] = contour2(I,L)
%CONTOUR Outputs image with contour over it
s = size(I);
C = I;
for i=2:s(1)
    for j=2:s(2)
        if L(i,j)*L(i+1,j) <= 0 || L(i,j)*L(i-1,j) <= 0 || L(i,j)*L(i,j+1) <= 0 || L(i,j)*L(i,j-1) <= 0 || L(i,j)*L(i+1,j+1) <= 0 || L(i,j)*L(i-1,j+1) <= 0 || L(i,j)*L(i+1,j-1) <= 0 || L(i,j)*L(i-1,j-1) <= 0
               C(i,j,1) = 255;
               C(i,j,2) = 0.0;
               C(i,j,3) = 0.0;
        end
    end
end
