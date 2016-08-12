function [A,b] = BoundaryStuff(A,b,x,y)
%Updates A and b based on their boundary conditions.

nodeNum = length(y);

for i = 1:nodeNum
    if x(i) == 0
        boundary = 0;
        A(i,:) = zeros(size(A(i,:)));
        A(i,i) = 1;
        b(i) = boundary;
        for j = 1:nodeNum
            if i ~= j
                b(j) = b(j) - A(j,i)*boundary;                                                                                                                                              
                A(j,i) = 0;
            end
        end
    end
end

for i = 1:nodeNum
    if x(i) == 1
        boundary = 1;
        A(i,:) = zeros(size(A(i,:)));
        A(i,i) = 1;
        b(i) = boundary;
        for j = 1:nodeNum
            if i ~= j
                b(j) = b(j) - A(j,i)*boundary;
                A(j,i) = 0;
            end
        end
    end
end

for i = 1:nodeNum
    if y(i) == 0 || y(i) == 1
        boundary = x(i);
        A(i,:) = zeros(size(A(i,:)));
        A(i,i) = 1;
        b(i) = boundary;
        for j = 1:nodeNum
            if i ~= j
                b(j) = b(j) - A(j,i)*boundary;
                A(j,i) = 0;
            end
        end
    end
end

end

