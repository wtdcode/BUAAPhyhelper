%%%%%%%%%%%%%%%%
% Name : RtoT
% Description : convert (R)esistance to (T)emperature while using magic meter.
% Input : Resistance(kOmega). A number or matrix.
% Output : Temperature.
%%%%%%%%%%%%%%%%
function [t] = RtoT (r)
    r = r*1000;
    R0 = 1000;
    A = 3.90802e-3;
    B = -5.80195e-7;
    t = (-A + sqrt(A.^2 - 4.*B.*(1-r/R0)))/(2.*B);
endfunction
