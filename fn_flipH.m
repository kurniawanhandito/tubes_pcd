function imgFlip = fn_flipH(img)
%fn_flipH Summary of this function goes here
%   Detailed explanation goes here
[row,col,page]=size(img);
for p=1:page
    for i=1:row
        k=col;
        for j=1:col
            imgFlip(i,k,p)=img(i,j,p);
            k=k-1;
        end
    end
end
end