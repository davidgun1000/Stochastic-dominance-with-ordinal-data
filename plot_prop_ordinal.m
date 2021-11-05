figure
load('prop.mat');

mean_prop_yFSDx = mean(prop_yFSDx);
min_prop_yFSDx = min(prop_yFSDx);
max_prop_yFSDx = max(prop_yFSDx);
mean_prop_xFSDy = mean(prop_xFSDy);
min_prop_xFSDy = min(prop_xFSDy);
max_prop_xFSDy = max(prop_xFSDy);

mean_prop_ySSDx = mean(prop_ySSDx);
min_prop_ySSDx = min(prop_ySSDx);
max_prop_ySSDx = max(prop_ySSDx);
mean_prop_xSSDy = mean(prop_xSSDy);
min_prop_xSSDy = min(prop_xSSDy);
max_prop_xSSDy = max(prop_xSSDy);

mean_prop_yLDx = mean(prop_yLDx);
min_prop_yLDx = min(prop_yLDx);
max_prop_yLDx = max(prop_yLDx);
mean_prop_xLDy = mean(prop_xLDy);
min_prop_xLDy = min(prop_xLDy);
max_prop_xLDy = max(prop_xLDy);


x = 1:4;
z = 1:5;
% y = [mean_prop_yFSDx(:,1:4)]';
% h = stem(x,y);
% set(h(1),'MarkerFaceColor','blue')

subplot(3,2,1);stem(x,(mean_prop_yFSDx(:,1:4))','fill');hold on;title('2005 FSD 2002');axis([0 6 -0.1 1.1]);
subplot(3,2,3);stem(x,(mean_prop_ySSDx(:,1:4))','fill');hold on;title('2005 SSD 2002');axis([0 6 -0.1 1.1]);
subplot(3,2,5);stem(x,(mean_prop_yLDx(:,1:4))','fill');hold on;title('2005 SD 2002');axis([0 6 -0.1 1.1]);
subplot(3,2,2);stem(x,(mean_prop_xFSDy(:,1:4))','fill');hold on;title('2002 FSD 2005');axis([0 6 -0.1 1.1]);
subplot(3,2,4);stem(x,(mean_prop_xSSDy(:,1:4))','fill');hold on;title('2002 SSD 2005');axis([0 6 -0.1 1.1]);
subplot(3,2,6);stem(x,(mean_prop_xLDy(:,1:4))','fill');hold on;title('2002 SD 2005');axis([0 6 -0.1 1.1]);
