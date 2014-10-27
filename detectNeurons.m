
%% assumming im in memory as im
%
% also nIm = double(im)./(2^16 - 1);


%% log filter, to remove noise and dc
sigma = 7;
hSize = 40;
f = fspecial('log', hSize, sigma);

fIm = imfilter(nIm, f);

%% Threshold log


%% Dilate Signal


%% Watershed


%% Remove large, small and (low signal) spots


%% Compare with DAPI?