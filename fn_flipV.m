function imgFlip = fn_flipV(img)
%fn_flipV Summary of this function goes here
%   Detailed explanation goes here
[row,col,page]=size(img);
for p=1:page
    k=row;
    for i=1:row
        for j=1:col
            imgFlip(k,j,p)=img(i,j,p);
        end
        k=k-1;
    end
end
end

