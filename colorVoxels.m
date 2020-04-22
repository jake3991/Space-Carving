function [X,Y,Z,col] = colorVoxels(Pi,imgColor,imgWidth,imgHeight,xCount,yCount,zCount,xMin,xMax,yMin,yMax,zMin,zMax,gridRes,voxels)
%Assign a color to the occipied voxels in the grid
%   Project each occiped pixel into image space, assign the color to that voxel    

    %containers
    X = [];
    Y = [];
    Z = [];
    col = [];
    
    %call hold on for plotting
    hold  on
    
    %a loop for voxels
    for i = 1:xCount
        for j = 1:yCount
            for k = 1:zCount

                %if cell is occupied
                if voxels(i,j,k) == 1

                    %get the voxel centroid
                    x = i * gridRes + xMin - gridRes / 2;
                    y = j * gridRes + yMin - gridRes / 2;
                    z = k * gridRes + zMin - gridRes / 2;

                    %package the point
                    point = [x, y, z, 1]';

                    %multiply the point by P
                    point = Pi * point;

                    %normalize
                    point = point / point(3);

                    %round off the point to be an integer
                    point = round(point);

                    %if the point is inside the image space check the color
                    if point(1) < imgWidth && point(1) > 0 && point(2) < imgHeight && point(2) > 0

                        %get the x,y and z
                        X = [ X; i * gridRes + xMin - gridRes / 2];
                        Y = [ Y; j * gridRes + yMin - gridRes / 2];
                        Z = [ Z; k * gridRes + zMin - gridRes / 2];
                        col = [col; impixel(imgColor, point(2), point(1)) ];

                        %plot
                        scatter3(x,y,z,[],impixel(imgColor, point(1), point(2)) / 255);
                        
                    end
                end
            end
        end
    end
    
    %label the axis and make them equal
    xlabel('x-axis') 
    ylabel('y-axis') 
    zlabel('z-axis') 
    axis equal
end


