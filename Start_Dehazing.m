clear;
path='Data\';
imagefilesin = dir(strcat(path,'*.png'));   
nfiles = length(imagefilesin);  

for l=1:1:nfiles
currentinfilename = imagefilesin(l).name
I=(imread(strcat(path,currentinfilename)));
[r,t]=Bounding_function(I,4);
figure, 
imshow(r);
imwrite(r,strcat('Results\',currentinfilename));
end