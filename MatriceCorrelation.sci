function [retour] = matriceCorrelation(tableau)
    [nbIndiv, nbCarac] = size(tableau);
    for tabIndColA = 1:nbCarac
        for tabIndColB = 1:nbCarac
            disp(tableau(:, tabIndColA))
            matCorr(tabIndColA, tabIndColB) =  tableau(:, tabIndColA)'*tableau(:, tabIndColB);
            matCorr(tabIndColA, tabIndColB) = (1/nbIndiv)*(matCorr(tabIndColA, tabIndColB))
        end 
    end
    retour = matCorr
endfunction
