function [A,b] = GlobalMatrix(row1,row2,row3,b1,b2,b3,x,mesh)
%Creates the global matrix from the local matrices

A = zeros(length(x),length(x));
b = zeros(length(x),1);

for i = 1:size(mesh,1)
    inx = mesh(i,:);
    subMatrix = [row1(i,:);row2(i,:);row3(i,:)];
    A(inx,inx) = A(inx,inx) + subMatrix;
    subVec = [b1(i);b2(i);b3(i)];
    b(inx) = b(inx) + subVec;
end

end

