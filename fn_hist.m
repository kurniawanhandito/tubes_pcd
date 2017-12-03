function fn_hist(img)
%fn_hist Summary of this function goes here
%   Detailed explanation goes here
[row,col,page] = size(img);
histRed=zeros(1,256);
histGreen=zeros(1,256);
histBlue=zeros(1,256);
for i=1:row
    for j=1:col
        levelRed=img(i,j,1);
        histRed(levelRed+1)=histRed(levelRed+1)+1
        levelGreen=img(i,j,2);
        histGreen(levelGreen+1)=histGreen(levelGreen+1)+1
        levelBlue=img(i,j,3);
        histBlue(levelBlue+1)=histBlue(levelBlue+1)+1
    end
end
luminance=0:255;
figure, plot(luminance, histRed, 'Red', luminance, histGreen, 'Green', luminance, histBlue, 'Blue');
title('Histogram');
grid on;
end