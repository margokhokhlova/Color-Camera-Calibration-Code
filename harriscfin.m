image=imread('chessboard00.png');
C = corner(image, 'Harris');
imshow(image);
hold on
plot(C(:,1), C(:,2), 'r*');
%----------------------------------------------%
%to double
I = im2double(image);
%Gradient derivatives 
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
%Gaussian filer g of size 9x9, std. dev. Sigma=2.
g=fspecial('gaussian',[3 3],2);
Im1 = imfilter(BWs,g,'same'); % only for multipl grad
Im2= imfilter(BW2s,g,'same');
Im3= imfilter(BW3s,g,'same');
%---------------------------------------------%
%Part 1
%Matrix M
%convolution kernel
%k = [1 1 1; 1 0 1; 1 1 1];
 %  M1 = conv2(BWs(i,j), k,'same');   
%for y^2 derivatives
    %M2 = conv2(BW2s(i,j), k,'same');
    %for xy^2 derivatives
    %M3 = conv2(BW3s(i,j), k,'same');
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
                     
     end
end
toc 
%-------------------------------------------%
%Part 3
%I want to take just 81 biggest values. to check them, I sort the array and
%find the the value of size(B)-81 element.
%figure, imshow(E,[]);
B = reshape(E,1,size(E,1)*size(E,2));
B=sort(B);
B=B(length(B)-81);
E81=E;
E81(E81<=B)=0;
[p_x,p_y]=find(E81>0);
features=[p_x,p_y];
figure;
imshow(image);
hold on
plot(features(:,1),features(:,2),'r+');
%Same for R value
A = reshape(R,1,size(R,1)*size(R,2));
A=sort(A);
A=A(length(A)-81);
R81=R;
R81(R81<=A)=0;
[px,py]=find(R81>0);
feat=[px,py];
figure;
imshow(image);
hold on
plot(feat(:,1),feat(:,2),'r+');
%----------------------------------------------------%
%Part 4
%%% Non-maxmimum suppression
window=11;
[m,n]=size(E); 
Q=E;
for ii=1:m+1-window

   Q(ii,:)=max(E(ii:ii+window-1,:),[],1); 

end

for ii=1:n+1-window

   Q(:,ii)=max(Q(:,ii:ii+window-1),[],2); 

end

for ii=1:m+1-window
    for jj=1:n+1-window
        if Q(ii,jj)~= max(max(Q(ii:ii+window,jj:jj+window)));
            Q(ii,jj)=0;
        end
    end
end



%%
%Perform Non-Maximum Suppression
% H = nonMaximalSupp(dx, dy, magGrad, lowThresh, highThresh)
% H is suppressed image
% Im1 and Im2 are the gradients
% magGrad is the magnitude of gradient
% lowThresh and highThresh are the thresholds
%{lowTresh=12.75;
%{ 
highTresh=20;
[magGrad, Gdir] = imgradient(image,'prewitt'); %taking gradient
magmax = max(magGrad(:));
    if magmax > 0
        magGrad = magGrad / magmax;
    end
[row, col] = size(magGrad);
E = false(row, col);
idxStrong = [];
for dir = 1:4
    idxLocalMax = cannyFindLocalMaxima(dir,Im1,Im2,magGrad);
    idxWeak = idxLocalMax(magGrad(idxLocalMax) > lowThresh);
    E(idxWeak)=1;
    idxStrong = [idxStrong; idxWeak(magGrad(idxWeak) > highThresh)]; %#ok<AGROW>
end

[m,n] = size(E);

if ~isempty(idxStrong) % result is all zeros if idxStrong is empty
    rstrong = rem(idxStrong-1, m)+1;
    cstrong = floor((idxStrong-1)/m)+1;
    H = bwselect(E, cstrong, rstrong, 8);
else
    H = zeros(m, n);
end 
%} 
%%
%{
[H,W]=size(I);
sigma=1;
size_of_kernel = 11*sigma+1;  
adjust= ceil(size_of_kernel/2)
non_max = E;

for r=1+ceil(size_of_kernel/2):H-ceil(size_of_kernel/2) 

    for c=1+ceil(size_of_kernel/2):W-ceil(size_of_kernel/2)  

       

        %%quantize:

        if (E(r,c) == 0) tangent = 5;       

        else tangent = (E(r,c)/E(r,c));   

        end

        if (-0.4142<tangent & tangent<=0.4142)

            if(E(r,c)<E(r,c+1) | E(r,c)<E(r,c-1))

                non_max(r,c)=0;

            end

        end

        if (0.4142<tangent & tangent<=2.4142)

            if(E(r,c)<M3(r-1,c+1) | E(r,c)<M3(r+1,c-1))

                non_max(r,c)=0;

            end

        end

        if ( abs(tangent) >2.4142)

            if(E(r,c)<E(r-1,c) | E(r,c)<E(r+1,c))

                non_max(r,c)=0;

            end

        end

        if (-2.4142<tangent & tangent<= -0.4142)

            if(E(r,c)<E(r-1,c-1) | E(r,c)<E(r+1,c+1))

                non_max(r,c)=0;

            end

        end

    end

end
%}
%%
% non-max again
%{
supressed_im = zeros(253, 250);
for i = 2  : 252
    for j = 2 : 349
        
        if (Im1(i, j) == 0)
        	if (im_gradient_mag(i, j) > im_gradient_mag(i, j - 1) && im_gradient_mag(i, j) > im_gradient_mag(i, j + 1))
                supressed_im(i, j) = im_gradient_mag(i, j);
            else
                supressed_im(i, j) = 0;
            end
        end

        if (n_direction_dis(i, j) == 45)
            if (im_gradient_mag(i, j) > im_gradient_mag(i + 1, j - 1) && im_gradient_mag(i, j) > im_gradient_mag(i - 1, j + 1))
                supressed_im(i, j) = im_gradient_mag(i, j);
            else
                supressed_im(i, j) = 0;
            end
        end

        if (n_direction_dis(i, j) == 90)
            if (im_gradient_mag(i, j) > im_gradient_mag(i - 1, j) && im_gradient_mag(i, j) > im_gradient_mag(i + 1, j))
                supressed_im(i, j) = im_gradient_mag(i, j);
            else
                supressed_im(i, j) = 0;
            end
        end

        if (n_direction_dis(i, j) == 135)
            if (im_gradient_mag(i, j) > im_gradient_mag(i - 1, j - 1) && im_gradient_mag(i, j) > im_gradient_mag(i + 1, j + 1))
                supressed_im(i, j) = im_gradient_mag(i, j);
            else
                supressed_im(i, j) = 0;
            end
        end

    end
end

imshow(supressed_im); %}
title('Supressed Image');

