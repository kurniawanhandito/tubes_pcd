function imgEq = fn_histogram_eq(img)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    [row,col,page]=size(img);
    pixels=row*col;
    
    imgEq=uint8(zeros(row,col));
    freq=zeros(256,1);
    probf=zeros(256,1);
    probc=zeros(256,1);
    cum=zeros(256,1);
    output=zeros(256,1);
    
    for i=1:row
        for j=1:col
            value=img(i,j);
            freq(value+1)=freq(value+1)+1;
            probf(value+1)=freq(value+1)/pixels;
        end
    end
    
    sum=0;
    no_bins=255;
    
    for i=1:size(probf)
        sum=sum+freq(i);
        cum(i)=sum;
        probc(i)=cum(i)/pixels;
        output(i)=round(probc(i)*no_bins);
    end
    for i=1:row
        for j=1:col
            imgEq(i,j)=output(img(i,j)+1);
        end
    end
end

