function imgRotate = fn_rotate90(img)
%fn_rotate90 Summary of this function goes here
%   Detailed explanation goes here
[row,col,page]=size(img);
for x=1:page
    k=col;
    for i=1:row
        for j=1:col
            imgRotate(j,k,x)=img(i,j,x);
        end
        k=k-1;
    end
end
end