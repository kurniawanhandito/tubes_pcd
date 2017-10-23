function imgFlip = fn_flip_vertical(img)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    [row,col,page]=size(img);
    for x=1:page
        k=row;
        for i=1:row
            for j=1:col
                imgFlip(k,j,x)=img(i,j,x);
            end
            k=k-1;
        end
    end
end

