% CALIBRATION SECTION 
% calibration from xyz_camera data to cielab color space
% camera_calibration(samples, Points, Patches, 1, 'Nikon',  new_sensitivity, new_Light, new_spectral, NumberPoints);


function calib_matrix=camera_calibration(samples, Points, Patches, calibration_method, camera_type, camera_sensitivity, light, spectral, K) 

XYZ_camera=calculate_reference(camera_sensitivity, samples, light, camera_type);
% obtain XYZ with a given cam coordinates
ideal_val_all=xyz2lab(Points,'WhitePoint','d65'); %get the lab values

ideal_val=xyz2lab(Patches(:,2:4), 'WhitePoint','d65');

if calibration_method==1 % standart calibration method
calib_matrix=pinv(XYZ_camera)*ideal_val;
%A=RGB+(3x10) x LAB(3x10)

% could be added the mean color calibration -> then the mean component is
% added to matrix lab and a is 4x3 and not 3x3
Points_camera_XYZ=spectraltoXYZ(spectral, light, camera_sensitivity); % spectral, light, observer
temp_val=zeros(1,3); %values to calc the error


error=zeros(1, size(spectral,2));
for i=1:size(spectral,2)
    
    temp_val=Points_camera_XYZ(i,:)*calib_matrix;
    error(i)=sqrt((ideal_val_all(i,1)-temp_val(1))^2)+sqrt((ideal_val_all(i,2)-temp_val(2))^2)+sqrt((ideal_val_all(i,3)-temp_val(3))^2);
end
%% calculate the error for the calibration matrix provided

mean(error)
max(error)
end




end