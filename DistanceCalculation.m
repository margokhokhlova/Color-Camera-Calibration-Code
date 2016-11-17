function DistMat=DistanceCalculation(Points)
N=size(Points,1);
DistMat=zeros(N,N);
for m=1:N;
    for n=1:N;
    DistMat(m,n)=sqrt(sum((Points(m,:)-Points(n,:)).^2));
    end
end
