%2,3,4
I = imread('color.jpg');
J = rgb2gray(I);
figure, imshow(I), figure, imshow(J)
imwrite(J,"gray.png");


%5
Img = imread('color.jpg');
J2 = rgb2gray(Img);
energy = sum(J2(:));
disp( energy)

%6
noised=imnoise(J,'gaussian');
figure
imshow(noised);
imwrite(noised,"graywithnoise.bmp");
img=J;
img=double(img(:));
ima=max(img(:));
imi=min(img(:));
mse=std(img(:));
snr=20*log10((ima-imi)./mse);
disp(snr)

img=noised;
img=double(img(:));
ima=max(img(:));
imi=min(img(:));
mse=std(img(:));
snrnoise=20*log10((ima-imi)./mse);
disp(snrnoise)


%7
ft = fftshift(log(abs(fft2(noised))));
figure
imshow(ft, []);


%8 3 ways to remove noise
rowAvg = mean(double(J2),2);
rowNoise = rowAvg - mean(rowAvg);
% Cancellation of noise
Igray2 = double(J2) - rowNoise;
Igray2 = uint8(Igray2);
imwrite(Igray2,"grayclearnoise.bmp");

Kaverage =filter2(fspecial('average',3),noised)/255;
imwrite(Kaverage,"grayaverage.bmp");

Kmedian =medfilt2(noised) ;
imwrite(Kmedian,"grayKmedian.bmp");
figure
imshow(J-Igray2)
%wich one was better
peaksnr1 = psnr(Igray2,J);
peaksnr2 = psnr(uint8(Kmedian),J);
peaksnr3 = psnr(uint8(Kaverage),J);
disp(peaksnr1)
disp(peaksnr2)
disp(peaksnr3)

%9



