clear;
clc;

format long

X = load('data');
const = load('const');
f1 = const(1);
f2 = const(2);
t = const(3);

f = (f1+f2)/2

lambda = (1/(10*10))*sum(X(:,2)-X(:,1))

c = f*lambda 

c0 = 331.45.*sqrt(1+t/273.15)

yita = (c - c0)/c0

u_a_lambda = sqrt(sum(((X(:,2)-X(:,1))/10-lambda).^2)/(10*9))

u_b1_lambda = 0.005/sqrt(3)

u_b2_lambda = 0.1/(10*sqrt(3))

u_lambda = sqrt(u_a_lambda.^2 + u_b1_lambda.^2 + u_b2_lambda.^2)

delta_f = abs(f1-f2)/2

u_f = delta_f/sqrt(3)

u_c_div_by_c = sqrt( (u_lambda/lambda).^2 + (u_f/f).^2)

u_c = u_c_div_by_c*c