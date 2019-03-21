function [ image_filtered ] = filtering_algorithm(a, image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m n] = size(image);
image_filtered=zeros(m,n,'uint8');
N=3
l=(N-1)/2 
b=(N-1)/2+1
[m n] = size(image);
image = [ [image;zeros(l,n)] zeros(m+l,l)];
[m n] = size(image);
image = [ zeros(m+l,l) [zeros(l,n);image] ];

image=double(image)
for i=b:(m-b+1)
    for j=b:(n-b+1)
        f=a(1,1)*image(i-1,j-1)+a(1,2)*image(i-1,j)+a(1,3)*image(i-1,j+1)+...
            a(2,1)*image(i,j-1)+a(2,2)*image(i,j)+a(2,3)*image(i,j+1)+...
            a(3,1)*image(i+1,j-1)+a(3,2)*image(i+1,j)+a(3,3)*image(i+1,j+1)
        image_filtered(i,j)=f;
        
    end
end
end

