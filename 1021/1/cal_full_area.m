function [ area ] = cal_full_area (line_up, x, y)
    area = 0;
    for i=1:size(x,1)-1
        area += cal_area( line_up,
                        get_line([x(i),1; x(i+1),1], [y(i); y(i+1)]),
                        x(i),
                        x(i+1)
                        );
    end
endfunction
