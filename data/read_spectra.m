function [R,N,P,l1,l2,dl]= read_spectra(filename);
% --------------------------------------------------------------
% function [R,N,P,l1,l2,dl]= read_spectra(filename);
% --------------------------------------------------------------
% Title:	read_spectra.m
% Author:  	Jon Yngve Hardeberg, ENST (1998)
% Purpose: 	Read from disk spectra from a database having the 
%		following format: 
%		First line: P l1 l2 dl N
%		nth line: r_n(l1), r_n(l1+dl), r_n(l1+ 2*dl)..r_n(l2)
% Requirements:	matlab v. 5.0
% Version:	1.2, March 1, 2003
% Input:	filename = string with the filename
% Output:	R = (N x P) matrix of P spectra
%		N = Number of sampling points
%		P = Number of reflectances
%		l1 = lower wavelength limit
%		l2 = upper wavelength limit
%		dl = wavelength step	
% --------------------------------------------------------------

fid = fopen (filename, 'rt');
if fid==-1
	error(['Error opening file ' filename]);
end

cont=1;
while(cont)
 line=fgets(fid);
 if(line(1)=='%')
  disp(line);
 else
  cont=0;
 end
end
x=sscanf(line,'%f ',[5 1]);
% s=fscanf(fid,'%s\n', [1 1]);
%x=fscanf(fid,'%f ',[5 1]);

P = x(1);
l1 = x(2); 
l2 = x(3); 
dl = x(4); 
N = x(5); 
clear x;

disp(['Reading file ' filename]);
disp(['containing P=' int2str(P) ' samples, sampled in N=' int2str(N) ' wavelength intervals']);
disp(['of ' int2str(dl) ' nm from ' int2str(l1) ' to ' int2str(l2) ' nm']);

for(i=1:P)
	r= fscanf(fid,'%f ',[N 1]);
	R(:,i)=r;
end

fclose(fid);