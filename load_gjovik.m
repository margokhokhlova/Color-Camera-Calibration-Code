% load gjovik set
data=load('materials_avantes.mat');

m=size(data.materials,2);
n=size(data.materials{1,1}.interpolated_reflectance,1);
spectraldata=zeros(n,floor(m*0.5)); %taking each second measurement coz the data are weird
k=1;
for i=1:2:m 
    spectraldata(:,k)=data.materials{1,i}.interpolated_reflectance(:,2);
k=k+1;    
end


% sample data
sm=10; %sampling ininitial 5 or 10 nm, depending on the dataset
new_spectral=zeros(40, size(spectraldata,2));
n=1;
for i=1:sm:size(spectraldata,1)-9 %%check!
    
    new_spectral(n,:)=spectraldata(i,:);
    n=n+1;
    if (n==40)
        break; end
end