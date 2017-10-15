function [ theta ] = get_line (x, y)
    theta = pinv((x'*x))*x'*y;
endfunction
