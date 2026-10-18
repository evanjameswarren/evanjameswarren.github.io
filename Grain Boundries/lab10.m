clear;close all;

img = imread("1045_post_3rd_etch_40x.jpg"); 
subplot(3,1,1)
sgtitle("1045 Annealed Steel Grain Boundaries")
imagesc(img)
imgGray = rgb2gray(img); % converting img from 3dim(rgb), to single value for easier manipulation
[h,w] =size(imgGray); 
colormap("gray")
subplot(3,1,2)
imagesc(imgGray)
hold on 


thresholdValue = 255* graythresh(imgGray) % graythresh() funciton to identify image pixal threshold value
imgLogical = imgGray>thresholdValue; % 
subplot(3,1,3)
imagesc(imgLogical)



pearlitePix = nnz(imgLogical);

totalPix = h*w;

percPearlite = 100* (1-(pearlitePix/totalPix))






