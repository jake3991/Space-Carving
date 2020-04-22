function [imgsBinary,imgsColor] = readImagePaths()
%Reads in the image paths from the dataset

    %read in the binary images
    imgsBinary = [];
    imgsBinary = [imgsBinary; 'silh_cam00_00023_0000008550.pbm'];
    imgsBinary = [imgsBinary; 'silh_cam01_00023_0000008550.pbm'];
    imgsBinary = [imgsBinary; 'silh_cam02_00023_0000008550.pbm'];
    imgsBinary = [imgsBinary; 'silh_cam03_00023_0000008550.pbm'];
    imgsBinary = [imgsBinary; 'silh_cam04_00023_0000008550.pbm'];
    imgsBinary = [imgsBinary; 'silh_cam05_00023_0000008550.pbm'];
    imgsBinary = [imgsBinary; 'silh_cam06_00023_0000008550.pbm'];
    imgsBinary = [imgsBinary; 'silh_cam07_00023_0000008550.pbm'];

    %read in color images
    imgsColor = [];
    imgsColor = [imgsColor; 'cam00_00023_0000008550.png'];
    imgsColor = [imgsColor; 'cam01_00023_0000008550.png'];
    imgsColor = [imgsColor; 'cam02_00023_0000008550.png'];
    imgsColor = [imgsColor; 'cam03_00023_0000008550.png'];
    imgsColor = [imgsColor; 'cam04_00023_0000008550.png'];
    imgsColor = [imgsColor; 'cam05_00023_0000008550.png'];
    imgsColor = [imgsColor; 'cam06_00023_0000008550.png'];
    imgsColor = [imgsColor; 'cam07_00023_0000008550.png'];
end

