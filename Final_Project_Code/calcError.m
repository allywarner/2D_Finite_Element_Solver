function calcError

%Different FEM grid spacing
gridSpacing = [5,10,20,40,80];

%calculates error for each grid spacing
error = zeros(length(gridSpacing),1);
error_cen = zeros(length(gridSpacing),1);
for i = 1:length(gridSpacing)
    
    h = 1/gridSpacing(i);
    
    %exact solution
    [x,y,~] = getPositions(h);
    exactu = sin(2*pi*x).*sin(2*pi*y);
    
    %FEM solution
    [u,ucen] = Main(h);
    
    %compare error
    error(i) = max(abs(exactu - u));
    error_cen(i) = max(abs(exactu - ucen));
end

%plot error
figure
loglog(1./gridSpacing,error,'m','LineWidth',2)
hold on
loglog(1./gridSpacing,(1./gridSpacing).^2,'k','LineWidth',2)
loglog(1./gridSpacing,error_cen,'g','LineWidth',2)
legend('Function Evaluation Error','Squared Uniform Discretization',...
    'Centroid Error','Location','NorthWest')
title('2D FEM Error','FontWeight','bold','FontSize',14)
xlabel('Mesh Spacing','FontWeight','bold')
ylabel('Error','FontWeight','bold')
saveas(gcf,'nonuniform_error_FEM.png')

close all
end