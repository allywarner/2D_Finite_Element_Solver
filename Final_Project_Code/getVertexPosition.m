function [vx,vy] = getVertexPosition(x,y,mesh)
%This function takes a list of x and y positions of the nodes and based on
%the mesh list of nodes.

vx = zeros(size(mesh));
vy = zeros(size(mesh));

for i = 1:size(mesh,1)
    for j = 1:size(mesh,2)
        inx = mesh(i,j);
        vx(i,j) = x(inx);
        vy(i,j) = y(inx);
    end
end

end

