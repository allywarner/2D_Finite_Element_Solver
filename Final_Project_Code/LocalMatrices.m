function [localA,localb,localbCenter] = LocalMatrices(x,y)
%Computes the local matrices

localA = zeros(3);
localb = zeros(3,1);
localbCenter = zeros(3,1);

[b,c,A] = Diff_Triangle(x,y);

%constant
% for i = 1:3
%     localb(i) = A/3;
% end

%evaluating the function
f = @(x,y)8*pi^2*sin(2*pi*x)*sin(2*pi*y);

source = zeros(3,1);
for i = 1:3
    source(i) = f(x(i),y(i));
end

for i= 1:3
    inx1 = mod(i,3) + 1;
    inx2 = mod(inx1,3) + 1;
    localb(i) = A*(2*source(i)+source(inx1)+source(inx2))/12;
end

%centered
xcen = 0;
ycen = 0;
for i = 1:3
    xcen = xcen+x(i);
    ycen = ycen+y(i);
end

xcen = xcen/3;
ycen = ycen/3;

for i = 1:3
    localbCenter(i) = (A/3)*f(xcen,ycen);
end

%Let's build a matrix
localA(1,1) = b(1)^2+c(1)^2;
localA(2,2) = b(2)^2+c(2)^2;
localA(3,3) = b(3)^2+c(3)^2;
localA(1,2) = b(1)*b(2) + c(1)*c(2);
localA(2,1) = localA(1,2);
localA(1,3) = b(1)*b(3) + c(1)*c(3);
localA(3,1) = localA(1,3);
localA(2,3) = b(2)*b(3) + c(2)*c(3);
localA(3,2) = localA(2,3);

localA2 = localA;

%boundary conditions
[localA,localb] = checkBoundary1(localA,localb,x,y);
[~,localbCenter] = checkBoundary1(localA2,localbCenter,x,y);
% [localA,localb] = checkBoundary2(localA,localb,x,y);

%Divide by 1/4A
localA = localA.*(1/(4*A));

end



