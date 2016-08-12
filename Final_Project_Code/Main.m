function [u,ucen] = Main(h)
%Final Project: 2D FEM Solver

%close any figures
close all

if nargin < 1
    h = 1/2;
end

%Gets the x and y positions for grid and then makes the union jack grid.
%Outputs a #ofElementx3 grid with the indexes of the triangle vertices. 
[x,y,gridSize] = getPositions(h);
[mesh] = genUnionJackMesh(gridSize);

%plots the union jack grid
% figure 
% triplot(mesh,x,y,'m')
% title('Finite Element Grid','FontWeight','bold','FontSize',14)
% xlabel(sprintf('h = %0.4f',h1),'FontWeight','bold')
% xlim([0 1])
% ylim([0 1])

%Getx the x,y positions of the elements' vertices
[vx,vy] = getVertexPosition(x,y,mesh);

row1 = [];
row2 = [];
row3 = [];
b1 = [];
b2 = [];
b3 = [];
c1 = [];
c2 = [];
c3 = [];
for i = 1:length(vx)
    [localA,localb,localbCenter] = LocalMatrices(vx(i,:),vy(i,:));
    temprow1 = localA(1,:);
    temprow2 = localA(2,:);
    temprow3 = localA(3,:);
    row1 = [row1;temprow1];
    row2 = [row2;temprow2];
    row3 = [row3;temprow3];
    tempb1 = localb(1);
    tempb2 = localb(2);
    tempb3 = localb(3);
    b1 = [b1;tempb1];
    b2 = [b2;tempb2];
    b3 = [b3;tempb3];
    tempc1 = localbCenter(1);
    tempc2 = localbCenter(2);
    tempc3 = localbCenter(3);
    c1 = [c1;tempc1];
    c2 = [c2;tempc2];
    c3 = [c3;tempc3];
end

[A,b] = GlobalMatrix(row1,row2,row3,b1,b2,b3,x,mesh);
[Acen,bcen] = GlobalMatrix(row1,row2,row3,c1,c2,c3,x,mesh);

%[A,b] = BoundaryStuff(A,b,x,y);

u = A\b;
ucen = Acen\bcen;

z = zeros(1,length(x));

figure
subplot(2,2,1)
trisurf(mesh,x,y,z,u,'edgecolor','k','facecolor','interp');
view(2),axis([0 1 0 1]),axis equal,colorbar
title('Finite Element Method - Constant Source')
xlabel(sprintf('h = %0.4f',h))
saveas(gcf,sprintf('secondSystem_wrong%d.png',1/h))

subplot(2,2,2)
trisurf(mesh,x,y,z,ucen,'edgecolor','k','facecolor','interp');
view(2),axis([0 1 0 1]),axis equal,colorbar
title('Finite Element Method - Center of Triangle')
xlabel(sprintf('h = %0.4f',h))

[exactx,exacty] = meshgrid(0:h:1,0:h:1);
exactu = sin(2*pi*exactx).*sin(2*pi*exacty);

subplot(2,1,2)
trisurf(mesh,exactx,exacty,z,exactu,'edgecolor','k','facecolor','interp');
view(2),axis([0 1 0 1]),axis equal,colorbar
title('Exact Solution')
xlabel(sprintf('h = %0.4f',h))
saveas(gcf,sprintf('SolutionCompare_%d.png',1/h))

end
