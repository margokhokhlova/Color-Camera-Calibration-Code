I=imread('vintage.jpg');
Im=rgb2ycbcr(I);
imshow(Im);
%4:2:2
img=I;
figure(1), imshow(img);title('original image');
Y=0.299*img(:,:,1)+0.587*img(:,:,2)+0.114*img(:,:,3);
Cb=-0.1687*img(:,:,1)-0.3313*img(:,:,2)+0.5*img(:,:,3)+128;
Cr=0.5*img(:,:,1)-0.4187*img(:,:,2)-0.0813*img(:,:,3)+128;
figure(2), subplot (1,3,1), imshow(Y), title('Y,Cb,Cr components'),
subplot(1,3,2), imshow(Cb),subplot(1,3,3), imshow(Cr);
Cb(:, 2:2:end) = [];
Cr(:, 2:2:end) = [];
%Forward Discrete Cosine Transform

fun = @(block_struct) dct2(block_struct.data);
BY = blockproc(Y,[8 8], fun);
BCb=blockproc(Cb,[8 8], fun);
BCr=blockproc(Cr,[8 8], fun);
%4. Quantization
qv1 =double([
            16 11 10 16  24  40  51  61
            12 12 14 19  26  58  60  55
            14 13 16 24  40  57  69  56
            14 17 22 29  51  87  80  62
            18 22 37 56  68 109 103  77
            24 35 55 64  81 104 113  92
            49 64 78 87 103 121 120 101
            72 92 95 98 112 100 103 99]);
        
   for row=1:8:size(BY,1)-8
          for column = 1:8:size(BY,2)-8
          %quantization
          xf(row:row+7,column:column+7)=round(BY(row:row+7,column:column+7)/qv1);
          end
      end
        
        
      % Unquantization
      
    for row=1:8:size(xf,1)
          for column = 1:8:size(xf,2)
          %dequantization
          xr(row:row+7,column:column+7)=xf(row:row+7,column:column+7)*qv1;
          end
      end
        
%inverse dct
 xr=double(xr);
 T = dctmtx(8);
 invdct = @(block_struct) T' * block_struct.data * T;
 BYrest = blockproc(xr,[8 8], invdct);
          
        
        
        
       