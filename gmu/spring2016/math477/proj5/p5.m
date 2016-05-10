%% Chapter 11.2.2: Image Compression
% We begin by loading a m x n x 3 matrix of RGB color using imread. Before
% we continue, we'd like to convert our matrix to grayscale. A common
% method of doing this mentioned in the text is to use the following
% formula
%                   X = 0.2126 R + 0.7152 G + 0.0722 B              (11.15)
% Note that the constants are doubles, so we need to convert MATLAB's
% default datataype uint8 to a double for computation. After we use the
% equation to convert to grayscale, then we should convert back to uint8
% for displaying the image
x = imread('Lenna.png');
x = double(x);
r = x(:,:,1); g=x(:,:,2); b=x(:,:,3);
xgray = 0.2126*r +0.7512*g+0.0722*b;  
xgray=uint8(xgray);
imagesc(xgray); colormap(gray)
imwrite(xgray, 'Lenna-grayscale.png');

%%  11.2 Problem 3
% In the previous section we read an RGB image into a matrix and converted
% it to a grayscale image. Now, let us crop the resultant grayscale matrix
% to a multiple of 8.
n = min(size(xgray));
n = n - mod(n, 8);
xcrop = xgray(1:n,1:n);

%% 11.2 Problem 3 (a)
% Extract an 8 x 8 pixel block. Display the block with the imagesc command.
xb = xcrop(1:8,1:8);
imagesc(xb); colormap(gray)

%% 11.2 Problem 3 (b)
% Apply the 2D-DCT
imwrite(xb, 'original-block.png');
[Yq1,Xf1] = quantize(xb, dct(double(xb)), 1)
imagesc(Xf1); title('Block (0:8, 0:8), p=1'); colormap(gray);
[Yq2,Xf2] = quantize(xb, dct(double(xb)), 2)
imagesc(Xf2); title('Block (0:8, 0:8), p=2'); colormap(gray);
[Yq4,Xf4] = quantize(xb, dct(double(xb)), 4)
imagesc(Xf4); title('Block (0:8, 0:8), p=4'); colormap(gray);

%% 11.2 Problem 3 (c)
xNew = compress(xcrop, 1);
imwrite(xNew, 'grayscale-p1.png');
xNew = compress(xcrop, 2);
imwrite(xNew, 'grayscale-p2.png');
xNew = compress(xcrop, 4);
imwrite(xNew, 'grayscale-p4.png');
xNew = compress(xcrop, 8);
imwrite(xNew, 'grayscale-p8.png');
xNew = compress(xcrop, 16);
imwrite(xNew, 'grayscale-p16.png');)
xNew = compress(xcrop, 32);
imwrite(xNew, 'grayscale-p32.png');
xNew = compress(xcrop, 64);
imwrite(xNew, 'grayscale-p64.png');
xNew = compress(xcrop, 128);
imwrite(xNew, 'grayscale-p128.png');
xNew = compress(xcrop, 256);
imwrite(xNew, 'grayscale-p256.png');

%%
% Note: these become all gray when p gets high enough because we are trying
% to get matrices of all 0s for our Huffman encoding (so that we can just
% say that there will be 20 zeros ahead). We add back 128 during the
% dequantization and inverse transform process, and this results in the
% gray color. 0 is black, 255 is white, and as the value 128 is right in
% between the two, 128 represents gray.
x = imread('Lenna.png');
r = x(:,:,1); g=x(:,:,2); b=x(:,:,3);
losses = 2.^[0:8];
for p=losses
    xNew = x;
    rnew = compress(r, p); gnew = compress(g, p); bnew = compress(b, p);
    xNew = cat(3, rnew, gnew, bnew);
    %xNew(:,:,1) = rnew; xNew(:,:,2) = gnew; xNew(:,:,3) = bnew;
    imwrite(xNew, sprintf('rgb-p%d.png', p));
    disp(sprintf('Writing rgb-p%d.png', p));
end

%% YUV Conversions
x = double(imread('Lenna.png'));
r = x(:,:,1); g=x(:,:,2); b=x(:,:,3);
y = 0.299 * r + 0.587 * g + 0.114 * b;
u = -0.14713 * r - 0.28886 * g + 0.436 * b;
v = 0.615 * r - 0.51499 * g - 0.10001 * b;
losses = 2.^[0:8];
for p=losses
    xNew = x;
    ynew = compress(y, p); unew = compress(u, p); vnew = compress(v, p);
    rnew = ynew + 1.139834576 * vnew;
    gnew = ynew -.3946460533 * unew -.58060 * vnew;
    bnew = ynew + 2.032111938 * unew;
    xNew = cat(3, rnew, gnew, bnew)./255;
    %xNew(:,:,1) = rnew; xNew(:,:,2) = gnew; xNew(:,:,3) = bnew;
    imwrite(xNew, sprintf('yuv-p%d.png', p));
    disp(sprintf('Writing yuv-p%d.png', p));
end
