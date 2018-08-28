clc
clear all
a=imread('image_0001.jpg');%image path
% imshow(a);

b=rgb2hsv(a);
c=b(:,:,3);
d=c;
for i=1:720
    for j=1:1280
            d(i,j)=1;    
    end
end
for i=180:540
    for j=320:960
        if c(i,j)<0.11
            d(i,j)=0;
        end
    end
end
% figure
% imshow(d)

%×Ô¼ºÐ´µÄÂË²¨4ÁÙÓò
% for i=2:719
%     for j=2:1279
%         d(i,j)=(d(i,j-1)+d(i-1,j)+d(i+1,j)+d(i,j+1))/4;
%     end
% end
%×Ô¼ºÐ´µÄÂË²¨8ÁÙÓò
for i=2:719
    for j=2:1279
        d(i,j)=(d(i,j-1)+d(i-1,j)+d(i+1,j)+d(i,j+1)+d(i-1,j-1)+d(i+1,j-1)+d(i-1,j+1)+d(i+1,j+1))/8;
    end
end
for i=1:720
    for j=1:1280
        if d(i,j)>0.65
            d(i,j)=0;
        else
            d(i,j)=1;
        end
    end
end
% figure 
% imshow(d)


 
img_reg = regionprops(d,  'area', 'boundingbox');  
areas = [img_reg.Area];  
rects = cat(1,  img_reg.BoundingBox);  
figure 
imshow(a);  
for i = 1:size(rects, 1)  
    rectangle('position', rects(i, :), 'EdgeColor', 'r');  
end  