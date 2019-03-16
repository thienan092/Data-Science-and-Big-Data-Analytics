function GenBrowser(str,wid,fragn,startp)

% we will show 100 fragments in the detailed view
endp = startp+wid*100;
nn = size(fragn); n = nn(1);
xr1 = startp/(n*wid); 
xr2 = endp/(n*wid);
cnames = ['k','r','g','b','m','c','y'];

subplot('Position',[0 0 1 0.1]);

for i=1:size(fragn)
    plot(i/n,0,strcat(cnames(fragn(i)),'s'),'MarkerSize',2); hold on;
end
plot([xr1 xr1],[-1 1],'k'); hold on;
plot([xr2 xr2],[-1 1],'k');
axis off;

subplot('Position',[0 0.1 1 0.1]);
for i=floor(startp/wid)+1:floor(endp/wid)+1
    plot([(i-0.5)*wid (i+0.5)*wid],[0 0],strcat(cnames(fragn(i)),'-'),'LineWidth',10); hold on;
end
axis off;

subplot('Position',[0 0.25 0.98 0.75]);
xlim([0,1]); ylim([0,1]); twid = 100; nlin = 24; k=startp;
for j=1:nlin
for i=1:twid
    col = cnames(fragn(floor(k/wid)+1));
    h=text(i/twid,1-j/nlin,str(k),'FontSize',8,'FontName','FixedWidth'); 
    set(h,'Color',col);
    k=k+1;
end
end
axis off;

set(gcf,'Position',[64   356   879   195]);
