function [retour] = functionBase(valeurP, vectP)
    retour = [0;0]
    disp(retour)
    [m, k] = max(valeurP, 'r')
    valeurP(k,1) = -1000
    disp("k :")
    disp(k)
    [m2, k2] = max(valeurP, 'r')
    valeurP(k2,1) = -1000
    retour(1,1) = vectP(k,1)
    retour(2,1) = vectP(k2,1)
endfunction
