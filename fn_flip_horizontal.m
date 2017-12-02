function imgFlip = fn_flip_horizontal(img)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    imgFlip=img(1:end,end:-1:1,:); 
end