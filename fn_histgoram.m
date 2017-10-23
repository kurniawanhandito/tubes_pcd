function histogram = fn_histgoram(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    gray=rgb2gray(img);
    [row,col]=size(gray);
    t=1:256;
    n=0:255;
    count=0;
    for z=1:256
        for i=1:row
            for j=1:col
                if gray(i,j)==z-1
                    count=count+1;
                end
            end
        end
        t(z)=count;
        count=0;
    end
    figure, histogram=bar(n,t);
end

