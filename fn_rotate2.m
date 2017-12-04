function imgRotate = fn_rotate2(img,degree)
%Kodingan dibawah MERUJUK dari laman berikut
%http://angeljohnsy.blogspot.com/2015/11/image-rotation-in-matlab-examples.html

    x1=zeros([size(img,1)*size(img,2) 1]);
    x2=zeros([size(img,2)*size(img,1) 1]);
    
    %Ubah ukuran
    imgRotate=uint8(zeros([size(img,1) size(img,2) 3 ]));
    
    m=1;
    %Tentukan titik tengah
    midx=ceil((size(imgRotate,1)+1)/2);
    midy=ceil((size(imgRotate,2)+1)/2);
    
     for i=1:size(img,1)
         i1=i-midx;
         for j=1:size(img,2)
             %Konversi dari koordinat kartesian ke koordinat polar
             [t,r]=cart2pol(i1,j-midy);
             %Convert from radians to degree and add the degree value
             %Konversi dari satuan sudut radian ke derajat dan ditambahkan
             %dengan degree inputan dari user
             t1=radtodeg(t)-degree;
             %Konversi dari derajat ke radian kembali
             t=degtorad(t1);
             %Konversi ke Koordinat Kartesian
             [x,y]=pol2cart(t,r);
             x1(m)=round(x+midx);
             x2(m)=round(y+midy);
             m=m+1;
        end
     end
     %Cek apakah nilainya muat dalam ukuran gambar
     x1(find(x1 < 1))=1;
     x2(find(x2 < 1))=1;
     
     n=1;
     for i=1:size(img,1)
         for j=1:size(img,2)
             imgRotate(x1(n),x2(n),:)=img(i,j,:);
             n=n+1;
         end
     end
end