clear;close all;
im=imread('img021.bmp');
fim=mat2gray(im);
level=graythresh(fim);
bwfim=imbinarize(fim,level);
[bwfim0,level0]=fcmthresh(fim,0);
[bwfim1,level1]=fcmthresh(fim,1);
%subplot(1,2,1);
imshow(fim);title('Original');
%subplot(1,2,2);
imshow(bwfim1);title(sprintf('FCM1,level=%f',level1));

%fill holes
se=strel('disk',3);
bw=imclose(bwfim1,se);
bw=imfill(bw,'holes');
figure,imshow(bw)
L=bwlabel(bw);
f=(L==1);
Area=sum(sum(f));
[R,C]=meshgrid(1:size(bw,2),1:size(bw,1));
cx=sum(sum(R.*f))/Area;
cy=sum(sum(C.*f))/Area;
disp([cx cy])

%extract lesion part
% [centers, radii, metric] = imfindcircles(bw,[10 20]);
% 
% %Retain the five strongest circles according to the metric values.
% centersStrong1 = centers(1:1,:); 
% radiiStrong1 = radii(1:1);
% metricStrong1 = metric(1:1);
% 
% %Draw the five strongest circle perimeters over the original image.
% viscircles(centersStrong1, radiiStrong1,'EdgeColor','b');
