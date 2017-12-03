function imgZoom = fn_zoomOut(img, times)
%fn_zoomOut Summary of this function goes here
%   Detailed explanation goes here
[row, col, page] = size(img);
for i=1:page
    for j=1:row*times
        for k=1:col*times
            imgZoom(j,k,i)=img(ceil(j/times),ceil(k/times),i);
        end
    end
end