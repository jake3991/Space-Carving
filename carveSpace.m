function [voxels] = carveSpace(Pi,imgBinary,imgWidth,imgHeight,xCount,yCount,zCount,xMin,xMax,yMin,yMax,zMin,zMax,gridRes,voxels)
%Carves space from 3D voxels 
%   Using P matrix projects each voxel into image space, if the voxel
%   Falls on the mask it is occupied, if it falls in the negative space it
%   is empty

    %a loop for voxels
    for i = 1:xCount
        for j = 1:yCount
            for k = 1:zCount

                %get the voxel centroid
                x = i * gridRes + xMin - gridRes / 2;
                y = j * gridRes + yMin - gridRes / 2;
                z = k * gridRes + zMin - gridRes / 2;

                %package the voxel centroid
                point = [x, y, z, 1]';

                %project the voxel into image space
                point = Pi * point;

                %normalize
                point = point / point(3);

                %round off the point to be an integer to query image
                point = round(point);

                %if the point is inside the image space check the color
                if point(1) < imgWidth && point(1) > 0 && point(2) < imgHeight && point(2) > 0

                    %if black set the voxel to unocciped
                    if imgBinary(point(2), point(1)) == 0

                        %set to un occipied
                        voxels(i,j,k) = 0;
                        
                    end
                    
                %if the point was outside the image space, it's unocciped
                else
                    
                    %set to un occipied
                    voxels(i,j,k) = 0;
                end
            end
        end
    end
end

