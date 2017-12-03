function imgRotate = fn_rotate(img, degree)
%fn_rotate Summary of this function goes here
%   Detailed explanation goes here
[row,col,page]=size(img);
for p=1:page
    for i=1:row
        for j=1:col
            imgRotate(i,j,p)=img(i*cosd(degree)-j*sind(degree),j*cosd(degree)+i*sind(degree)),p);
        end
    end
end
end