% function to convert into Adobe RGB with D65
function[RGB]= XYZ2AdobeRGB(XYZ)
M=[ 2.0413690 -0.5649464 -0.3446944
-0.9692660  1.8760108  0.0415560
 0.0134474 -0.1183897  1.0154096];
 RGB=(M*XYZ')';
end