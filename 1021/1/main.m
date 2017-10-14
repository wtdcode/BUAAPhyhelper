
format long;

precision = 0.5

step = 0.05

%%%%%% const %%%%%%
% R_{theta}(theta)
% T1
% m
% m1
% m2
% M
load("const");

Theta = RtoT(const(1));
T1 = const(2);
m = const(3)*1e-3;
m1 = const(4)*1e-3;
m2 = const(5)*1e-3;
M = const(6)*1e-3;
c0 = 4.18;
c1 = 0.389;
c2 = c1;

%%%%%% experiment data %%%%%%
% r T
load("down");
load("melt");
load("up");

down(:,2) = RtoT(down(:,2));
melt(:,2) = RtoT(melt(:,2));
up(:,2) = RtoT(up(:,2));

melt = [down(end,:);melt;up(1,:)];

K_y = log(down(:,2)-Theta);
K_x = down(:,1);

K_line = get_line([K_x ones(size(K_x,1),1)],K_y);

K = -K_line(1)

figure(1)

plot(K_x, K_y, '-m');

figure(2);

handle = plot(down(:,1), down(:,2), "-r", 
              melt(:,1), melt(:,2), "-b", 
              up(:,1), up(:,2), "-g");

down_line = get_line([down(:,1) ones(size(down,1),1)], down(:,2));
up_line = get_line([up(:,1) ones(size(up,1),1)], up(:,2));

for x=down(:,1)(end)+0.1:step:up(:,1)(1)-0.1
    x_l_i = find(melt(:,1)<=x); % x_left_index
    x_r_i = find(melt(:,1)>=x); % x_right_index
    current_line = get_line([melt(x_l_i(end),1),1; melt(x_r_i(1),1),1], [melt(x_l_i(end),2); melt(x_r_i(1),2)]);
    x_l = melt(x_l_i,1);
    y_l = melt(x_l_i,2);
    x_r = melt(x_r_i,1);
    y_r = melt(x_r_i,2);
    Sa = cal_full_area(down_line, x_l, y_l);
    Sa += cal_area(down_line, current_line, x_l(end), x);
    Sb = -cal_full_area(up_line, x_r, y_r);
    Sb += cal_area(current_line, up_line, x, x_r(1));
    if abs(Sa-Sb)<= precision
        hold on;
        T2 = [x 1]*down_line
        T3 = [x 1]*up_line
        plot([x,up(1,1)],[T3,up(1,2)], '--k',
             [down(1,1),x],[down(1,2), T2], '--k',
             [x x],[T3, T2], '--k',
             [0,up(end,1)], [Theta, Theta], '--c');
        L = (1./M)*(c0.*m+c1.*m1+c2.*m2).*(T2-T3)-c0.*T3+c1*T1
        break;
    end
end




    