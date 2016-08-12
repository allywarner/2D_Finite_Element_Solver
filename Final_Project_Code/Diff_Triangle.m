function [b,c,A] = Diff_Triangle(x,y)
%Computes the 1st order differentiation arrays for linear triangles.

b = zeros(1,3);
c = zeros(1,3);

area2 = x(2)*y(3)-x(3)*y(2)+x(3)*y(1)-x(1)*y(3)+x(1)*y(2)-x(2)*y(1);
A = abs(area2)/2;

for i = 1:3
    inx1 = mod(i,3) + 1;
    inx2 = mod(inx1,3) + 1;
    b(i) = (y(inx1) - y(inx2));%/area2;
    c(i) = (x(inx2) - x(inx1));%/area2;
end

end

