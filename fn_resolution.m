function resolution = fn_resolution(img)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    [row,col,page]=size(img);
    resRow=int2str(row);
    resCol=int2str(col);
    resolution=strcat(resRow,' x ',resCol);
end