function pca_calc_mire(spectral)
%% PCA and error metrics are taken from 
% On the spectral dimensionality of object colors
% by Jon Y. Hardeberg


% get the mean values for the reflectance spectra for each patch

average_refl = mean(spectral,2);
P=size(spectral,1); N=size(spectral,2);
spect_norm=zeros(size(spectral));
% mean normalize data for each wavelenght (no scaling, scaled already)
for i=1:N
spect_norm(:,i)=spectral(:,i)-average_refl;
end

%% PCA
[U,S,V] = svd(spect_norm);
%% Error calculation for the restoration
Error=zeros(P, N); %to store the variance
for i=1:P
z=U(1:i,:)*spect_norm; % as in the paper, project on the vector of i principal components (singular vector)
reconstruction=U(1:i,:)'*z;
%add mean value
for j=1:P
reconstruction(j,:)=reconstruction(j,:)+average_refl;
end
% error calculation
Error(i,:)=sum(abs(spectral-reconstruction)); %to sum up all the errors
end
 
%% calculation of the variance and accumulated Energy Ea(P)
eigen_vals=diag(S); % singular values
residual_energy=zeros(size(eigen_vals));
for i=1:P %for al the principal components
energy(i)=sum(eigen_vals(1:i)); 
end
accumulated_energy=energy./energy(end);
for j=1:P
   residual_energy(j)=1-accumulated_energy(j); 
end

%% plot everything
figure
subplot(2,1,1);
plot(mean(Error'),  '-.r'); title('Mean Error (red) and Max Error'); hold on;
plot(max(Error'), '-.b'); 
subplot(2,1,2);
plot(residual_energy, '-.g*'); title('Residual Energy (green) and Accumulated energy'); hold on;
plot(accumulated_energy, '-.r');
%% Percent mark to find the min num vectors to keep 99% of variance
percent=min(find(accumulated_energy>0.99))
end







