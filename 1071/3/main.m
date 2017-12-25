clear;
clc;
format long;

raw = load('data');

[A u_A] = calA();

k = size(raw,1);

alpha1 = dms2degrees([raw(:,[1,2]) zeros(k,1)]);

beta1 = dms2degrees([raw(:,[3,4]) zeros(k,1)]);

alpha2 = dms2degrees([raw(:,[5,6]) zeros(k,1)]);

beta2 = dms2degrees([raw(:,[7,8]) zeros(k,1)]);

dm = 0.5*(convert(alpha2-alpha1)+convert(beta2-beta1))

dm_dms = degrees2dms(dm)

dm_aver = mean(dm)

dm_aver_dms = degrees2dms(dm_aver)

n = sind((A+dm_aver)/2)/sind(A/2)

u_a_dm = sqrt(sum((dm - dm_aver).^2)/(5*4))

u_b_dm = (1/60) / sqrt(3)

u_dm = sqrt(u_a_dm.^2 + u_b_dm.^2)

u_n = sqrt( (u_dm * cosd((dm_aver+A)/2) / (2*sind(A/2))).^2 + (u_A * sind(dm_aver/2) / ((sind(A/2)).^2)).^2)


