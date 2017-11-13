clc;
clear;

format long;

const = load('const');
Rn = const(1);
R = load('R');
D = load('D');

D = D(1:end-1,:) - D(end);

d = mean(D)/1000;

Raver =(R(:,2) + R(:,3))./2

Rx = Raver.*Rn./R(:,4)

x = R(:,1)/100;

y = Rx;

[theta,u_a,u_b,r] = get_line_2(x,y);

b = theta(1)

tho = pi*(d.^2)*b./4

u_b

k = size(D,1);

u_a_D = sqrt(sum((d-D/1000).^2)/(k*(k-1)))

% 这里默认用的是1/50mm分度的游标卡尺
u_b_D =  0.00002 / sqrt(3) 

u_D = sqrt(u_a_D*u_a_D + u_b_D*u_b_D)

u_tho_div_by_tho = sqrt( (2*u_D/d).^2 + ((u_b)/b).^2)

u_tho = u_tho_div_by_tho*tho

