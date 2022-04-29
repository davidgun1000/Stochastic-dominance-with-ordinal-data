%ordinal dominance program
load('param_2002.mat'); %load the parameter draws from the Dirichlet distribution.
load('param_2005.mat'); %load the parameter draws from the Dirichlet distribution. 

drawsx = prop_2002; 
drawsy = prop_2005;

% prop1_x = drawsx(:,1);
% prop2_x = drawsx(:,2);
% prop3_x = drawsx(:,3);
% prop4_x = drawsx(:,4);
% prop5_x = drawsx(:,5);
% 
% prop1_y = drawsy(:,1);
% prop2_y = drawsy(:,2);
% prop3_y = drawsy(:,3);
% prop4_y = drawsy(:,4);
% prop5_y = drawsy(:,5);

F_x_cum = cumsum(drawsx,2); %calculate the cdf
F_y_cum = cumsum(drawsy,2); %calculate the cdf

F_x_cum(:,5) = 1;
F_y_cum(:,5) = 1;

H_x_cum = cumsum(F_x_cum,2); %calculate the elements for second order dominance comparisons
H_y_cum = cumsum(F_y_cum,2); %calculate the elements for second order dominance comparisons

m = 10000; 


for j = 1:1000
    R = (randperm(m))';
    for i = 1:m
         F_y_cum_perm(i,:) = F_y_cum(R(i,1),:);
         H_y_cum_perm(i,:) = H_y_cum(R(i,1),:);
    end
    
    %First Order Dominance
    
    xFSDy = F_x_cum <= F_y_cum_perm;
    yFSDx = F_x_cum >= F_y_cum_perm;
    xFSDy = double(xFSDy);
    yFSDx = double(yFSDx);
    prop_xFSDy(j,:) = mean(xFSDy);
    prop_yFSDx(j,:) = mean(yFSDx);
    overall_xFSDy(j,1) = mean(prod(xFSDy,2));
    overall_yFSDx(j,1) = mean(prod(yFSDx,2));
    overall_xFSDy_lowest(j,1) = mean(prod(xFSDy(:,1:2),2));
    overall_yFSDx_lowest(j,1) = mean(prod(yFSDx(:,1:2),2));
    
    %second order dominance
    xSSDy = H_x_cum <= H_y_cum_perm;
    ySSDx = H_x_cum >= H_y_cum_perm;
    xSSDy = double(xSSDy);
    ySSDx = double(ySSDx);
    prop_xSSDy(j,:) = mean(xSSDy);
    prop_ySSDx(j,:) = mean(ySSDx);
    overall_xSSDy(j,1) = mean(prod(xSSDy,2));
    overall_ySSDx(j,1) = mean(prod(ySSDx,2));
    overall_xSSDy_lowest(j,1) = mean(prod(xSSDy(:,1:2),2));
    overall_ySSDx_lowest(j,1) = mean(prod(ySSDx(:,1:2),2));
    
    %inequality
    xLDy_part1 = F_x_cum(:,1:2) <= F_y_cum_perm(:,1:2);
    xLDy_part2 = F_x_cum(:,3:5) >= F_y_cum_perm(:,3:5);
    xLDy = [xLDy_part1 xLDy_part2];
    
    yLDx_part1 = F_x_cum(:,1:2) >= F_y_cum_perm(:,1:2);
    yLDx_part2 = F_x_cum(:,3:5) <= F_y_cum_perm(:,3:5);
    yLDx = [yLDx_part1 yLDx_part2];
    xLDy = double(xLDy);
    yLDx = double(yLDx);
    prop_xLDy(j,:) = mean(xLDy);
    prop_yLDx(j,:) = mean(yLDx);
    overall_xLDy(j,1) = mean(prod(xLDy,2));
    overall_yLDx(j,1) = mean(prod(yLDx,2));
end
%get the posterior probability estimates
mean_prop_xFSDy = mean(prop_xFSDy);
mean_prop_yFSDx = mean(prop_yFSDx);
mean_overall_xFSDy = mean(overall_xFSDy)
max_overall_xFSDy = max(overall_xFSDy)
min_overall_xFSDy = min(overall_xFSDy)
mean_overall_yFSDx = mean(overall_yFSDx)
max_overall_yFSDx = max(overall_yFSDx)
min_overall_yFSDx = min(overall_yFSDx)
mean_overall_xFSDy_lowest = mean(overall_xFSDy_lowest)
max_overall_xFSDy_lowest = max(overall_xFSDy_lowest)
min_overall_xFSDy_lowest = min(overall_xFSDy_lowest)
mean_overall_yFSDx_lowest = mean(overall_yFSDx_lowest)
max_overall_yFSDx_lowest = max(overall_yFSDx_lowest)
min_overall_yFSDx_lowest = min(overall_yFSDx_lowest)

mean_prop_xSSDy = mean(prop_xSSDy);
mean_prop_ySSDx = mean(prop_ySSDx);
mean_overall_xSSDy = mean(overall_xSSDy)
max_overall_xSSDy = max(overall_xSSDy)
min_overall_xSSDy = min(overall_xSSDy)
mean_overall_ySSDx = mean(overall_ySSDx)
max_overall_ySSDx = max(overall_ySSDx)
min_overall_ySSDx = min(overall_ySSDx)
mean_overall_xSSDy_lowest = mean(overall_xSSDy_lowest);
max_overall_xSSDy_lowest = max(overall_xSSDy_lowest);
min_overall_xSSDy_lowest = min(overall_xSSDy_lowest);
mean_overall_ySSDx_lowest = mean(overall_ySSDx_lowest);
max_overall_ySSDx_lowest = max(overall_ySSDx_lowest);
min_overall_ySSDx_lowest = min(overall_ySSDx_lowest);

mean_prop_xLDy = mean(prop_xLDy);
mean_prop_yLDx = mean(prop_yLDx);
mean_overall_xLDy = mean(overall_xLDy)
max_overall_xLDy = max(overall_xLDy)
min_overall_xLDy = min(overall_xLDy)
mean_overall_yLDx = mean(overall_yLDx)
max_overall_yLDx = max(overall_yLDx)
min_overall_yLDx = min(overall_yLDx)

save('prop.mat','prop_xSSDy','prop_ySSDx','prop_xLDy','prop_yLDx','prop_xFSDy','prop_yFSDx');
save('overall_mean.mat','mean_overall_xSSDy','mean_overall_ySSDx',...
    'mean_overall_xSSDy_lowest','mean_overall_ySSDx_lowest','mean_overall_xLDy','mean_overall_yLDx',...
    'mean_overall_xFSDy','mean_overall_yFSDx',...
    'mean_overall_xFSDy_lowest','mean_overall_yFSDx_lowest');
save('overall_max.mat','max_overall_xSSDy','max_overall_ySSDx',...
    'max_overall_xSSDy_lowest','max_overall_ySSDx_lowest','max_overall_xLDy','max_overall_yLDx',...
    'max_overall_xFSDy','max_overall_yFSDx',...
    'max_overall_xFSDy_lowest','max_overall_yFSDx_lowest');  
save('overall_min.mat','min_overall_xSSDy','min_overall_ySSDx',...
    'min_overall_xSSDy_lowest','min_overall_ySSDx_lowest','min_overall_xLDy','min_overall_yLDx',...
    'min_overall_xFSDy','min_overall_yFSDx',...
    'min_overall_xFSDy_lowest','min_overall_yFSDx_lowest');  
    
