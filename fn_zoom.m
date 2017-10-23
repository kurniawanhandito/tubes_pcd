function imgZoom = fn_zoom(img,times)
%Kodingan dibawah MERUJUK dari laman berikut
%https://www.mathworks.com/matlabcentral/fileexchange/40993-image-zooming?focused=3781720&tab=function
%zoom2 adalah fungsi untuk men-zoom citra
%inputan berupa citra dan times

    [row,col,page]=size(img);
    if page==3
        x=img(:,:,1);
        y=img(:,:,2);
        z=img(:,:,3);
    end
    
    k=1; %Counter for Row and
    l=1; %Column replication
    
    f=times/100;

    for i=1:row %Loop for reading row and
        for t=1:f %Row replication

            for j=1:col %Loop for reading column and
                for t=1:f %Column replication

                    if page==3 %If Image is RGB
                        imgZoom1(k,l)= x(i,j);
                        imgZoom2(k,l)= y(i,j);
                        imgZoom3(k,l)= z(i,j);
                    else %If Image is grayscale
                        imgZoom(k,l)=img(i,j);
                    end
                    l=l+1;
                end
            end
            l=1;
            k=k+1;
        end
    end
    if page==3 %If Image is RGB
        imgZoom(:,:,1)=imgZoom1;
        imgZoom(:,:,2)=imgZoom2;
        imgZoom(:,:,3)=imgZoom3;
    end
end