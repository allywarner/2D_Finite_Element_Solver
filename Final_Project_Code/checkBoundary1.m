function [A,b] = checkBoundary1(A,b,x,y)
%Updates A and b based on their boundary conditions.

nodeNum = length(y);

for i = 1:nodeNum
    if x(i)==0 || y(i)==0 || x(i)==1 || y(i)==1
        boundary = 0;
        A(i,i) = 1;
        b(i) = boundary;
    end
end