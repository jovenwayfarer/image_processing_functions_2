function [ image_filtered_sobel,theta] = sobel_filter( image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[h, w] = size(image);
image_filtered_sobel = zeros(h,w,'uint8');
image=double(image);
Gx = [1 +2 +1; 0 0 0; -1 -2 -1]; Gy = Gx';
%theta=zeros(h,w,'double');
for i=2:h-1;
    for j=2:w-1;
        fx=Gx(1,1)*image(i-1,j-1)+Gx(1,2)*image(i-1,j)+Gx(1,3)*image(i-1,j+1)+...
            Gx(2,1)*image(i,j-1)+Gx(2,2)*image(i,j)+Gx(2,3)*image(i,j+1)+...
            Gx(3,1)*image(i+1,j-1)+Gx(3,2)*image(i+1,j)+Gx(3,3)*image(i+1,j+1);
        
        fy=Gy(1,1)*image(i-1,j-1)+Gy(1,2)*image(i-1,j)+Gy(1,3)*image(i-1,j+1)+...
            Gy(2,1)*image(i,j-1)+Gy(2,2)*image(i,j)+Gy(2,3)*image(i,j+1)+...
            Gy(3,1)*image(i+1,j-1)+Gy(3,2)*image(i+1,j)+Gy(3,3)*image(i+1,j+1) ;
        
        value=sqrt(double(fx*fx)+double(fy*fy));
        image_filtered_sobel(i,j)=value;
        %theta(i,j)=atan(fy/fx);
        
    end
end
%%image_filtered_sobel=image_filtered_sobel(1+1:end-1,1+1:end-1)
end

