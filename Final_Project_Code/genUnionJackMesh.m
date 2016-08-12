function [mesh] = genUnionJackMesh(gridSize)
%This function makes a list of elements and their node vertecies.
%Finds which elements are boundary elements

%Make mesh matrix
mesh = [];

inx = 1;
element = 1;

for i = 1:gridSize-1
    for j = 1:gridSize-1
        if (mod(gridSize,2) ~= 0 && mod(inx,2) == 0) ||...
                (mod(gridSize,2) == 0 && (mod(i,2) == 0 &&...
                mod(inx,2) ~= 0) || (mod(i,2) ~= 0 && mod(inx,2) == 0))
            mesh(element,:) = [inx,inx+gridSize,inx+1];
            mesh(element+1,:) = [inx+gridSize,inx+(gridSize+1),inx+1];
        else
            mesh(element,:) = [inx,inx+gridSize,inx+(gridSize+1)];
            mesh(element+1,:) = [inx,inx+(gridSize+1),inx+1];
        end
        inx = inx + 1;
        element = element + 2;
    end
    inx = inx + 1;
end

end

