function imgZoom = fn_zoomOut(img, times)
%fn_zoomOut Summary of this function goes here
%   Detailed explanation goes here
[row, col, page] = size(img);
for p=1:page
    for i=1:row*times
        for j=1:col*times
            imgZoom(i,j,p)=img(ceil(i/times),ceil(j/times),p);
        end
    end
end