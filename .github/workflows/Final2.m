function [Ifinal,in,out,Phinew,Phidiff] = Final2(I)
%FINAPhi Executes image segmentation on an image I using a level set method
mu = 0.001;
iterations = 3000;
Phi = init(I);
C = contour2(I,Phi);
video = VideoWriter('segmentation.avi');
open(video);
writeVideo(video,C);
if ndims(I) == 3
    G = rgb2gray(I);
else
    G = I;
end
F = fractional(G);
[H,delta] = heaviside2(Phi,0.1);
[c1,c2] = averages(F,H);
Phinew = pde2(delta,mu,Phi,0.0,1.0,1.0,F,c1,c2);
Phidiff(1) = sum(sum(abs(Phinew-Phi)))
i = 2;
while i <= iterations
    [H,delta] = heaviside2(Phinew,0.1);
    [c1,c2] = averages(F,H);
    Phinew1 = pde2(delta,mu,Phinew,0.0,1.0,1.0,F,c1,c2);
    Phidiff(i) = sum(sum(abs(Phinew1-Phinew)));
    Phinew = Phinew1;
    if mod(i,floor(iterations/30)) == 0 || i == 1
        Ifinal = contour2(I,Phinew);
        writeVideo(video,Ifinal);
        i
        Phidiff(i)
        imshow(Ifinal)
    end
    i=i+1;
end
[in,out] = split(I,Phinew);
Phinew = cut(Phinew,3);
close(video);
