function out = SearchEngine(A,q)
[x,y] = size(A);
G = zeros(x,y);
n = 1:x;
for i = 1:x
    for j = 1:y
        G(i,j) = q/length(n) + A(j,i)*(1-q)/sum(A(j,:));
    end
end
[V,D] = eig(G);
vector = diag(D);

for k = 1:length(vector)
    if abs(vector(k)- 1) < 10*eps
        p = k;
        break
    end
end

P = V(:,p)/sum(V(:,p));
out = P;