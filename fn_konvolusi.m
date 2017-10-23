function imgKonv = fn_konvolusi(img,kernel)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    imgGray=rgb2gray(img);
    imgKonv=imgGray;
    [bf, kf]=size(imgGray);
    [bg, kg]=size(kernel);
    
    m2=floor(bg/2);
    n2=floor(kg/2);
    
    pad=zeros(bf+4,kf+4);
    pad(3:bf+2,3:kf+2)=imgGray;
    [b_pad, k_pad]=size(pad);
    
    for i=m2+1:b_pad-m2
        for j=n2+1:k_pad-n2
            temp=0;
            for k=-m2:m2
                for l=-n2:n2
                    temp=temp+kernel(k+m2+1,l+n2+1)*pad(i-k,j-l);
                end
            end
            imgKonv(i,j)=temp;
        end
    end
    imgKonv=imgKonv(2:bf+3,2:kf+3);
end
