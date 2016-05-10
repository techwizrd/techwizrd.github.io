function Xnew = compress(X, p)
% COMPRESS an image
%   Compress an image using the DCT with a loss parameter of p.
n = min(size(X));
n = n - mod(n, 8);
Xnew = X;
for i=0:8:n-8
    for j=0:8:n-8
        xb = X(i+1:i+8,j+1:j+8);
        [Yq1,Xf1] = quantize(xb, dct(double(xb)), p);
        Xnew(i+1:i+8,j+1:j+8) = Xf1;
    end
end
end