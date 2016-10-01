function XYZ=calculate_reference(camera_sensitivity, spectral_data, light_source, camera_type)

% camera Nikon 380-730 1
% source: https://rip94550.wordpress.com/2009/10/26/color-from-spectrum-to-tristimulus/
% mire - 380-780
%light %range 300-830

% if strcmp(camera_type,'Nikon')==1
%     %then get all the values in the same range
%     Light=light_source(8:42); 
%     if size(spectral_data,2)==40
%     spectral_data=spectral_data(:, 1:35); %depending on the selected samples
%     end
% end

Points=spectral_data*camera_sensitivity;

Normalization=light_source'*camera_sensitivity;

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


XYZ=Points;



