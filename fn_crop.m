function imgCrop = fn_crop(img,x1,y1,width,height)
%fn_crop Summary of this function goes here
%   Detailed explanation goes here
[row,col,page]=size(img);
i=1;
j=1;
for p=1:page
    for x1=x1:height
        for y1=y1:width
            imgCrop(i,j,p)=img(x1,y1,p);
            j=j+1
        end
        i=i+1
    end
end