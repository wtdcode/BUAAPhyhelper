clc;
clear;
format long;

load('const');
R0 = const(1);
m1 = const(2);
m = const(3);
R = const(4);
V = const(5);

load('down');
down(:,2) = RtoT(down(:,2));

load('up');
up(:,2) = RtoT(up(:,2));
k = size(up,1);

c0 = 4.18;
c1 = 0.389;
c2m2 = 64.38;

Theta = RtoT(R0);

K_y = log(down(:,2)-Theta);
K_x = down(:,1);

K_line = get_line([K_x ones(size(K_x,1),1)],K_y);

K = -K_line(1)

[u_a1, u_b1, r1] = get_uab(K_x, K_y, K_line);

u_K = -u_b1;

figure(1);

plot(K_x, K_y, '-m');

up_x = up(:,1);
up_y = up(:,2);

up_line = get_line([up_x ones(k,1)],up_y);

b2 = up_line(1);

a2 = up_line(2);

figure(2);

plot(up_x, up_y, '-m');

Cm = c0*m + c1*m1 + c2m2;

J = V.*V/(R*Cm*(b2+K*(a2-Theta)))

[u_a2, u_b2, r2] = get_uab(up_x, up_y, up_line);



r2

u_J = (J/(b2 + K.*(a2-Theta))).*sqrt(u_b2.^2 + ((a2-Theta).^2).*(u_K.^2) + (K.^2)*(u_a2).^2)