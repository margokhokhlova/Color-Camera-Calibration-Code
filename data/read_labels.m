function labels = read_labels(filename,P);
% --------------------------------------------------------------
% function labels = read_labels(filename,P);
% --------------------------------------------------------------
% Title:	read_labels.m
% Author:  	Jon Yngve Hardeberg, ENST (1998)
% Purpose: 	Read from disk the names of the spectra to be 
%		used for illustrations labels etc
% Requirements:	matlab v. 5.0
% Version:	1.1, February 25, 1998
% Input:	filename = string with the filename
%		P = number of lines to read
% Output: 	labels = a matrix with the names of the reflectances
% Remarks:	Adapted specially for the file pigment_labels.txt,
%		should be modified for other formats
% --------------------------------------------------------------


fid = fopen (filename, 'rt');
if fid==-1
	error(['Error opening file ' filename]);
end

for(i=1:P)
 lin=fgets(fid);
 [token,rem]=strtok(lin);
 rem=strrep(rem,setstr(9), '');rem=strrep(rem,setstr(10),''); %removing tab and CR/NL characters
% rem=strrep(rem,'''','''''');
 if(str2num(token) ~= i)
  disp([' Problem with label :' lin]);
 else
  if(i==1)
   labels=rem;
  else
   labels = str2mat(labels,rem);
  end
 end
end

return;