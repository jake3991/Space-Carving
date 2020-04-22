clear all 
close all

%read in the P matrices from the dancer dataset
P = readP();

%read in the images from the dataset
[imgsBinary, imgsColor] = readImagePaths();

%Voxel grid limits
xMin = -2.5;
xMax = 2.5;
yMin = -3;
yMax = 3;
zMin = 0;
zMax = 2.5;

%set the grid resolution
gridRes = 0.1;

%get the number of cells
xCount = (xMax - xMin) / gridRes;
yCount = (yMax - yMin) / gridRes;
zCount = (zMax - zMin) / gridRes;

%generate a voxel grid of ones, occupied cells
voxels = ones(xCount, yCount, zCount);

%set image width and height
imgHeight = 581;
imgWidth = 780;

%uncomment to generate GIF
%figure(1)
%plotVoxels(xCount,yCount,zCount,xMin,yMin,zMin,gridRes,voxels);

%loop over all cameras
for cam = 1:8
    
    %get the binary image
    img = imread(imgsBinary(cam,:));
        
    %get the cameras P matrix
    Pi = P(:,:,cam);
    
    %carve the space from the voxel grid
    voxels = carveSpace(Pi,img,imgWidth,imgHeight,xCount,yCount,zCount,xMin,xMax,yMin,yMax,zMin,zMax,gridRes,voxels);
    
    %uncomment to generate GIF
    %figure(cam + 1)
    %plotVoxels(xCount,yCount,zCount,xMin,yMin,zMin,gridRes,voxels);
    
end

%loop over all cameras
for cam = 1:8
    
    %get the binary image
    img = imread(imgsBinary(cam,:));
    
    %get the color image
    imgColor = imread(imgsColor(cam,:));
    
    %get the cameras P matrix
    Pi = P(:,:,cam);
    
    %get the color for each voxel
    [voxels] = findSurface(xCount,yCount,zCount,xMin,xMax,yMin,yMax,zMin,zMax,gridRes,voxels);

end

%loop over all cameras
for cam = 1:8
    
    %get the binary image
    img = imread(imgsBinary(cam,:));
    
    %get the color image
    imgColor = imread(imgsColor(cam,:));
    
    %get the cameras P matrix
    Pi = P(:,:,cam);
    
    %get the color for each voxel
    [X,Y,Z,col] = colorVoxels(Pi,imgColor,imgWidth,imgHeight,xCount,yCount,zCount,xMin,xMax,yMin,yMax,zMin,zMax,gridRes,voxels);

end

%concatenate a point cloud
%points = [X,Y,Z];

%use matlab to package the cloud
%cloud = pointCloud(single(points),'Color',col/255);

%show the point cloud
%pcshow(cloud,'MarkerSize',50);

%pcwrite(cloud,'result.ply');



