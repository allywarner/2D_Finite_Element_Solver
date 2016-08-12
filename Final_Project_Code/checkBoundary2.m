function [A,b] = checkBoundary2(A,b,x,y)
%Updates A and b based on their boundary conditions.

nodeNum = length(y);

%boundary for g1
for i = 1:nodeNum
    if x(i)==0
        boundary = 0;
        A(i,i) = 1;
        b(i) = boundary;
    end
end

%boundary for g2
for i = 1:nodeNum
    if x(i)==1
        boundary = 1;
        A(i,i) = 1;
        b(i) = boundary;
    end
end

%boundary for g3
for i = 1:nodeNum
    if y(i)==0
        boundary = x(i);
        A(i,i) = 1;
        b(i) = boundary;
    end
end

%boundary for g4
for i = 1:nodeNum
    if y(i)==1
        boundary = x(i);
        A(i,i) = 1;
        b(i) = boundary;
    end
end

end

