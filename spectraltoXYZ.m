%%% function to calculate the data from the spectral to the XYZ
function Points=spectraltoXYZ(spectral, light, observer)

% normalize to the same range
%light=light(9:end-5);
%observer=observer(3:end-5, :);
%correction for light
for i=1:size(spectral,2)
spectral(:,i)=spectral(:,i).*light;
end
Points=spectral'*observer;

Normalization=light'*observer;

%normalize by middle value (https://rip94550.wordpress.com/2009/10/26/color-from-spectrum-to-tristimulus/)
for i=1:size(Points,1)
    Points(i,:)=Points(i,:)./Normalization(2);
end
%% and finally normalize the sum to 1
for i=1:size(Points,1)
v = Points(i,:);
Points(i,:) = v / norm(v, 1); % using the 1-norm
end
%get the xyz values
