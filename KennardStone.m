function Patches=KennardStone(Matrix, K, Points)

%K is the number of points
%Matrix the distance matrix 
% Points
Patches=zeros(K,4); %patches to be returned
Matrix(Matrix==0)=-inf;

max_v=max(max(Matrix));
[index1, index2]=find(Matrix==max_v);
Patches(1,:)=[index1(1),Points(index1(1),:)];
Patches(2,:)=[index1(2),Points(index1(2),:)];


% maximum of the minimum distance between the points which are selected
% and the new ones:
% for each point takes the min distance to the selected ones
iteration=2; %two points selected
 
 
 
 while iteration<K
     
     % for each patch among selected
     [dist]=Min_KS_dist(Points,Patches, iteration);    
     
     [~, maxind]=max(dist);
     maxind
     max(dist)
     Patches(iteration+1,:)=[maxind, Points(maxind,:)];
     iteration=iteration+1;
 end 


