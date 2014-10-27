
%% assumming im in memory as im
%
% also nIm = double(im)./(2^16 - 1);
nIm = single(im);

%% log filter, to remove noise and dc
sigma = 7;
hSize = 40;
f = fspecial('log', hSize, sigma);

fIm = imfilter(nIm, f);

%% Threshold log
mask = fIm < -10;


%% Dilate Signal
mask = imdilate(mask, strel('disk', 5));

%% Watershed
f2 = fspecial('disk', 18);
wIm = imfilter(nIm, f2);
wIm(~mask) = -Inf;
wIm = watershed(wIm);

%% Remove large, small and (low signal) spots
props = regionprops(wIm);

%% Compare with DAPI?