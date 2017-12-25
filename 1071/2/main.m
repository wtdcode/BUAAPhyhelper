clear;
clc;
format long;

raw = load('data');

k = size(raw,1);

alpha1 = dms2degrees([raw(:,[1,2]) zeros(k,1)]);

beta1 = dms2degrees([raw(:,[3,4]) zeros(k,1)]);

alpha2 = dms2degrees([raw(:,[5,6]) zeros(k,1)]);

beta2 = dms2degrees([raw(:,[7,8]) zeros(k,1)]);

theta = 0.5*(convert(alpha2-alpha1)+convert(beta2-beta1));

theta_dms = degrees2dms(theta)

theta_aver = mean(theta)

theta_aver_dms = degrees2dms(theta_aver)

A = 0.5.*theta_aver

A_dms = degrees2dms(0.5.*theta_aver)

u_a_theta = sqrt(sum((theta - theta_aver).^2)/(5*4))

u_b_theta = (1/60) / sqrt(3)

u_theta = sqrt(u_a_theta.^2 + u_b_theta.^2)

u_A = 0.5*u_theta

