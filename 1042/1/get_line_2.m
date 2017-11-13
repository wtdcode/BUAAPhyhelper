function [theta, u_a, u_b, r] = get_line_2 (x, y)
    theta = zeros(2,1);
    
    k = size(x,1);
    
    x2m = mean(x.^2);
    y2m = mean(y.^2);
    mx2 = mean(x).^2;
    my2 = mean(y).^2;
    mxy = mean(x.*y);
    mxmy = mean(x).*mean(y);

    theta(1) = (mxmy-mxy)/(mx2-x2m);
    theta(2) = mean(y) - theta(1)*mean(x);
    
    r = (mxy - mxmy)/sqrt((x2m-mx2).*(y2m-my2));

    Sy = sqrt(sum((y - [x ones(k,1)]*theta).^2)/(k-2));

    u_a = Sy.*sqrt(x2m/(k.*(x2m - mx2)));

    u_b = Sy.*sqrt(1/(k.*(x2m - mx2)));
endfunction
