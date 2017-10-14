function [ area ] = cal_area (line_up, line_down, from, to)
    f = @(x)[x 1]*(line_up-line_down);
    area = quadv(f,from,to);
endfunction
