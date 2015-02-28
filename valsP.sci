function [vap, vep]=valsP(A)
    [vep, diagevals]=spec(A)
    vap=diag(diagevals)
endfunction
