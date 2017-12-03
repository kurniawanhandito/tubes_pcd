function imgRotate = fn_rotate(img, degree)
%fn_rotate Summary of this function goes here
%   Detailed explanation goes here
[row,col,page]=size(img);
for i=1:page
    for j=1:row
        for k=1:col
            imgRotate(j,k,i)=img(j*cosd(degree)-k*sind(degree),k*cosd(degree)+j*sind(degree)),page);
        end
    end
end