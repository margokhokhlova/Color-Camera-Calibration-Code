image=imread('chessboard00.png');
C = corner(image, 'Harris');
imshow(image);
hold on
plot(C(:,1), C(:,2), 'r*');

%to double
I = im2double(image);
%Gradient derivatives 
%other way Sobel Method
hvert = (fspecial('sobel'));
BW = imfilter(I,hvert,'same');
BW2=imfilter(I, transpose(hvert),'same');
figure();
subplot(2,1,1),
imshow(BW);
subplot(2,1,2);
imshow(BW2);
%square derivatives
BWs=BW.^2;
BW2s=BW2.^2;
BW3s=BW.*BW2;
%along xy 
%[Gmag,Gdir] = imgradient(GxGy)

%Gaussian filer g of size 9x9, std. dev. Sigma=2.
g=fspecial('gaussian',[3 3],2);
Im1 = imfilter(BWs,g,'same'); % only for multipl grad
Im2= imfilter(BW2s,g,'same');
Im3= imfilter(BW3s,g,'same');

%Part 1
%Matrix M
%(because first does not have 3 neigbours)
       %for x^2 derivatives
    %convolution kernel
%    k = [1 1 1; 1 0 1; 1 1 1];
 %   M1 = conv2(BWs(i,j), k,'same');   
    %for y^2 derivatives
  %  M2 = conv2(BW2s(i,j), k,'same');
    %for xy^2 derivatives
   % M3 = conv2(BW3s(i,j), k,'same');
   %end 
%end
tic  
for i=2:252
    for j=2:249
        M1=sum(sum(Im1(i-1:i+1, j-1:j+1))); %3 by 3
        M4=sum(sum(Im2(i-1:i+1, j-1:j+1)));
        M3=sum(sum(Im3(i-1:i+1, j-1:j+1)));
        M=[M1 M3; M3 M4];
%Matrix E which contain the value of smaller eigenvalue of M
%for every point of image
      
E(i,j)=min(eig(M));


     
%Part 2
%Matrix R with the result of equation        
             R(i,j)=det(M)-0.04*trace(M)^2;
        
        %Part 3
        % 81 features and check if E and R are similar
     
        %for certain window just one maximum. Non-max suppression. To take
       %reshape matrix. we can sort or take maximum values
        
    end
end
toc   
%imshow(image);
%hold on
%plot((:,1), R(:,2), 'r*');

%I want to take just 81 biggest values. to check them, I sort the array and
%find the the value of size(B)-81 element.
%figure, imshow(E,[]);
B = reshape(E,1,size(E,1)*size(E,2));
B=sort(B);
B=B(length(B)-81);
E81=E;
E81(E81<=B)=0;
%Same for R value
A = reshape(R,1,size(R,1)*size(R,2));
A=sort(A);
A=A(length(A)-81);
R81=R;
R81(R81<=A)=0;
imshow(R81);

%%% Non-maxmimum suppression
%It = suppression(Im3,abs(Im2),abs(Im3));
%figure(6),imshow(It);


