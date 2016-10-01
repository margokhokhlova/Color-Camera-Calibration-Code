function dist=Min_KS_dist(set, selected, K)
%K=size(selected,1);
dist=zeros(size(set,1),1); 
for picksel=1:K
    set(selected(picksel,1),:)=[inf,inf,inf];
end


for i=1:size(set,1)
    cand_point_dist=zeros(K,1);
    for j=1:K
        cand_point_dist(j)=sqrt(sum((set(i,:)-selected(j,2:4)).^2));

    end
   % cand_point_dist(cand_point_dist==0)=inf;
    dist(i)=min(cand_point_dist);
    if (dist(i)==0)
        break
    end
end
dist(dist==inf)=-inf; % to pass the distance valur which I can work with
end




% dist=zeros(size(set,1),1); 
% for i=1:size(set,1)
% dist(i)=sqrt(sum((set(i,:)-selected(2:4)).^2));    
% end
% dist(dist==0)=inf;
% [val, index]=min(dist);
