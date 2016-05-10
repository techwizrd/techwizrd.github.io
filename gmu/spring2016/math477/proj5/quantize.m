
function [Yq, Xf] = quantize(X, C, p)
% QUANTIZE  Quantize a matrix
%   Carry out the conversion, centering, transforming, and quantization of
%   a square n x n matrix X. Denote by C the n x n Discrete Cosine
%   Transform (DCT) matrix. p is the loss parameter.
%
%   The return value Yq is matrix representing the new quantized version of
%   the image.
Xd=double(X);
Xc=Xd-128;
Y=dct(Xc);
%Q=p*8./hilb(8);
Q=p*[16   11   10   16   24    40    51    61;
 12   12   14   19   26    58    60    55;
 14   13   16   24   40    57    69    56;
 14   17   22   29   51    87    80    62;
 18   22   37   56   68    109   103   77;
 24   35   55   64   81    104   113   92;
 49   64   78   87   103   121   120   102;
 72   92   95   98   112   100   103   99]
Yq=round(Y./Q);
Ydq=Yq.*Q;
Xdq=idct(Ydq);
%Xdq=C'*Ydq*C;
Xe=Xdq+128;
Xf=uint8(Xe);
end
