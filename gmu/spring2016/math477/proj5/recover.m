function Xf = recover(Yq, C, p)
% RECOVER  Recover a quantized matrix
%   Recover a matrix from a quantized matrix Yq. C is the n x n Discrete
%   Cosine Transform (DCT) matrix. p is the loss parameter.
%
%   The return value Xf is matrix representing the information recovered
%   from the quantized matrix.
Q=p*8./hilb(8);
Ydq=Yq.*Q;
Xdq=C'*Ydq*C;
Xe=Xdq+128;
Xf=uint8(Xe);
Xe
Xf
end