function imgRotate = fn_rotate90(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [row,col,page]=size(img);
    for x=1:page
        k=col-1;
        for i=1:row-1
            for j=1:col-1
                imgRotate(j,k,x)=img(i,j,x);
            end
            k=k-1;
        end
    end
end

