function [ degree ] = convert( degree )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
    k = size(degree,1);
    for i =1:k
        if(abs(degree(i))>180)
            degree(i) = 360 - abs(degree(i));
        end
    end
end

