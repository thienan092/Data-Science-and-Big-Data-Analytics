function PCAFreq(xx)

% standard normalization
nn = size(xx); n = nn(1)
mn = mean(xx);
mas = xx - repmat(mn,n,1);
stdr = std(mas);
mas = mas./repmat(stdr,n,1);

% creating PCA plot
[pc,dat] = princomp(mas);
plot(dat(:,1),dat(:,2),'k.'); hold on;
set(gca,'FontSize',16); axis equal;
title('PCA plot for text fragments','FontSize',22);
set(gcf,'Position',[232   256   461   422]);
hold off;