function fragn = ClustFreq(xx,k)

% centralization and normalization
nn = size(xx); n = nn(1)
mn = mean(xx);
mas = xx - repmat(mn,n,1);
stdr = std(mas);
mas = mas./repmat(stdr,n,1);

% calculating principal components
[pc,dat] = princomp(mas);

% k-means clustering
[fragn,C] = kmeans(mas,k);

% projecting cluster centers into the PCA basis
XTP = C; temp = size(XTP); nums = temp(1);
X1c = XTP-repmat(mn,nums,1);
X1r = X1c./repmat(stdr,nums,1);
X1P = pc'*X1r'; X1P = X1P';

% marking the central cluster black
cnames = ['k','r','g','b','m','c','y'];
for i=1:k  no(i) = norm(X1P(i,1:3)); end
[m,mi] = min(no);
for i=1:size(fragn)
      if fragn(i)==mi fragn(i)=1; elseif fragn(i)==1 fragn(i)=mi; end    
end

% plotting the result using PCA 
for i=1:n
    plot(dat(i,1),dat(i,2),'ko','MarkerEdgeColor',[0 0 0],'MarkerFaceColor',cnames(fragn(i))); hold on;
end
set(gca,'FontSize',16); axis equal;
title('K-means clustering','FontSize',22);
set(gcf,'Position',[232   256   461   422]);
