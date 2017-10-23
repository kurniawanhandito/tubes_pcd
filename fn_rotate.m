function imgRotate = fn_rotate(img,degree)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [row,col,page]=size(img);
    for x=1:page
        for i=1:row-1
            for j=1:col-1
                imgRotate(i,j,x)=img(((i*cosd(degree))-(j*sind(degree))),((j*cosd(degree))+(i*sind(degree))),x);
            end
        end
    end
end

