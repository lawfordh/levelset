function [fract] = fractional(G)
%FRACTIONAL Turns grayscale matrix into matrix with values between 0 and 1.
fract = double(G) / double(max(max(G)));
