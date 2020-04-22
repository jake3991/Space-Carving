function [voxels] = findSurface(xCount,yCount,zCount,xMin,xMax,yMin,yMax,zMin,zMax,gridRes,voxels)
%Determine which voxels of the carved space are surface voxels
%   Loop over the occupied voxels and check its neighbors

    %a loop for voxels
    for i = 1:xCount
        for j = 1:yCount
            for k = 1:zCount
                
                %check the number of occiped neighbors at each voxel, if it
                %has 6 then it is not a surface pixel
                if voxels(i,j,k) == 1
                    
                    %count the number of neighbors
                    neighbors = 0;
                    
                    if k+1 < zCount
                        neighbors = neighbors + voxels(i,j,k+1);
                    end
                    
                    if k-1 > 0
                        neighbors = neighbors + voxels(i,j,k-1);
                    end
                    
                    if j+1 < yCount
                        neighbors = neighbors + voxels(i,j+1,k);
                    end
                    
                    if j-1 > 0
                        neighbors = neighbors + voxels(i,j-1,k);
                    end
                    
                    if i+1 < xCount
                        neighbors = neighbors + voxels(i+1,j,k);
                    end
                    
                    if i-1 > 0
                        neighbors = neighbors + voxels(i-1,j,k);
                    end
                    
                    %if the number of neighbors is 6 then turn this voxel
                    %off
                    if neighbors == 6
                        
                        %turn the voxel to unocciped
                        voxels(i,j,k) = 0;
                    end
                end
            end
        end
    end
        
end

