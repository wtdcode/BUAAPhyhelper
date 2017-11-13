function [u_a, u_b, r] = get_line_2 (x, y, line)
    
    k = size(x,1);
    
    x2m = mean(x.^2);
    y2m = mean(y.^2);
    mx2 = mean(x).^2;
    my2 = mean(y).^2;
    mxy = mean(x.*y);
    mxmy = mean(x).*mean(y);

    r = (mxy - mxmy)/sqrt((x2m-mx2).*(y2m-my2));

    Sy = sqrt(sum((y - [x ones(k,1)]*line).^2)/(k-2));

    u_a = Sy.*sqrt(x2m/(k.*(x2m - mx2)));

    u_b = Sy.*sqrt(1/(k.*(x2m - mx2)));
endfunction
