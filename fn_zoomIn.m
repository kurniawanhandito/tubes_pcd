function imgZoom = fn_zoomIn(img, times)
%fn_zoomIn Summary of this function goes here
%   Detailed explanation goes here
[row, col, page] = size(img);
for p=1:page
    for i=1:row*times
        for k=j:col*times
            imgZoom(i,j,p)=img(ceil(i/times),ceil(j/times),p);
        end
    end
end