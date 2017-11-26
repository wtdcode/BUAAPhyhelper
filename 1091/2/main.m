clear;
clc;
format long;

D = load('in');

d_D = D(:,1) - D(:,2);

d_D2 = d_D.^2;

x = [11:1:20]';
y = d_D2;

% line = get_line([x ones(size(d_D,1),1)],y)

[line, u_a, u_a_b, r] = get_line_2(x,y)

lambda = 589.3e-6

R = line(1)/(4*lambda)

u_b_b = 0.005/sqrt(3)

u_b = sqrt(u_a_b*u_a_b+u_b_b*u_b_b)

u_R = u_b/(4*lambda)