% The range of the data taken is: 400-700 for all the measurements %

%LOAD data from munsell mat
munsell=load('munsell380_780_1_glossy.mat');
spectraldata=munsell.X();
%sample the data by 10 nm
sm=10; %sampling ininitial 5 or 10 nm, depending on the dataset
new_spectral=zeros(30, size(spectraldata,2)); %% as in jon paper 400-700
n=size(spectraldata,1);
k=1;
for i=21:sm:n-81
    new_spectral(k,:)=spectraldata(i,:);
    k=k+1;
end
clear spectraldata;
 
 %% load data from mira_pigments (380-780)
spectraldata=read_spectra('mire_pigments.dat');
sm=5; %sampling ininitial 5 or 10 nm, depending on the dataset
new_spectral=zeros(30, size(spectraldata,2)); %% as in jon paper 400-700
n=size(spectraldata,1);
k=1;
for i=21:sm:n-81
    new_spectral(k,:)=spectraldata(i,:);
    k=k+1;
end
clear spectraldata;

%% RUN PCA ON THE DATA %%
%pca_calc(spectral);
pca_calc(new_spectral);
%% CONVERT & PLOT
XYZ=munsell.XYZ();
RGB=xyz2rgb(XYZ);
%part to define color of a plot
C = repmat(RGB,1,1);
C=C./255;
%c = C(:);
%C = repmat([1,2,3],numel(RGB),1);
figure
hold on
scatter3(RGB(:,1), RGB(:,2), RGB(:,3),  17, C, 'filled'); title('Munsell Color Dataset');
xlabel('R');
ylabel('G'); zlabel('B');


scatter3(Patches(:,2), Patches(:,3), Patches(:,4), 19, 'MarkerEdgeColor', 'r');
view (20, 30);
% calculation
% DistM=DistanceCalculation(RGB);
% Patches=KennardStone(DistM, 24, RGB);


%% Data about cameras for calibration

%change the directory
cd 'C:\Users\margo\Documents\Custom Office Templates\MATLAB\project_restauration\data'
%camera Nikon 380-730, BGR
sensitivity=xlsread('NikonD200_senor_sensitivity_July142015_ap6_2016.xls', 'A2:C352');
%plot(380:730, sensitivity(:,1), 'b', 380:730, sensitivity(:,2),'g',380:730, sensitivity(:,3), 'r'); title('Spectral Sensitivity camera Nikon D200, 380-730');
%sample the data
size_s=size(sensitivity,1);
new_sensitivity=zeros(30,3);
sm=10; %sampling ininitial 5 or 10 nm, depending on the dataset
k=1;
for i=21:sm:size_s-31
    new_sensitivity(k,:)=sensitivity(i,:);
    k=k+1;
end
clear sensitivity;
%% Load light source data
%range 300-830
Light=xlsread('all_1nm_data.xls','C5:C535');
size_s=size(Light,1);
 new_Light=zeros(30,1);
sm=10; %sampling ininitial 5 or 10 nm, depending on the dataset
k=1;
for i=101:sm:size_s-131
    new_Light(k)=Light(i);
    k=k+1;
end
clear Light;
%% Load CIE 31 observer RGB
XYZ_standard=xlsread('ciexyz31_1.csv', 'B1:D471');
% plot(360:830,XYZ_standard(:,1), 'r', 360:830,XYZ_standard(:,2), 'g', 360:830,XYZ_standard(:,3), 'b'); title('Standard Observer 31 values');
 size_s=size(XYZ_standard,1);
 new_XYZ=zeros(30,3);
sm=10; %sampling ininitial 5 or 10 nm, depending on the dataset
k=1;
for i=41:sm:size_s-131
    new_XYZ(k,:)=XYZ_standard(i,:);
    k=k+1;
end
clear XYZ_standard; 

% pca noise reduction

%get back to the original directory
cd ..
%% Kennard stone calculation
Points=spectraltoXYZ(new_spectral, new_Light, new_XYZ); % spectral, light, observer

Distance=DistanceCalculation(Points);
NumberPoints=20;
Patches=KennardStone(Distance, NumberPoints, Points);

%% main code %% 
% Calibration is from XYZ to CIELAB space
samples=zeros(NumberPoints, size(new_spectral,1));
for i=1:NumberPoints
    index=Patches(i,1);
    samples(i,:)=new_spectral(:,index);
end
camera_calibration(samples, Points, Patches, 1, 'Nikon',  new_sensitivity, new_Light, new_spectral, NumberPoints);
% calculate the error of the calibration



