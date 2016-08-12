function [xPosArr,yPosArr,gridSize] = getPositions(h)
%Gets x and y positions of the nodes

%Set at 0.5 for testing.
if nargin < 1
    h = 0.5;
end

%Checks to see if 1/h is an integer.
if floor(1/h) ~= 1/h
    error('1/h must be an integer, please input a different step size.');
end

%Sets the size of the grid based on h.
gridSize = (1/h) + 1;

%Initialized the positions of the grid.
xPos = 0:h:1;
yPos = 0:h:1;
xPosArr = [];
inx = 1;

%Draws the grid and saves the positions.
for i = 1:gridSize
    xPosArr = [xPosArr;xPos'];
    for j = 1:gridSize
        yPosArr(inx) = yPos(i);
        inx = inx + 1;
    end
end
yPosArr = yPosArr';

end
