function plotVoxels(xCount,yCount,zCount,xMin,yMin,zMin,gridRes,voxels)
%Plot the voxels if they are occupied

    X = [];
    Y = [];
    Z = [];

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

                    %get the x,y and z
                    X = [ X; x];
                    Y = [ Y; y];
                    Z = [ Z; z];
                    
                end
            end
        end
    end
    
    scatter3(X,Y,Z,5,Z);
    xlim([-2.5,2.5]);
    ylim([-3,3]);
    zlim([0,2.5]);
    view([-12 36])
    
    
    
    %axis equal
    
end

