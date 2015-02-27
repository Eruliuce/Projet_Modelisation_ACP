function fonctionACP(tableau)
    tableauCR = tableauReduit(tableauCentre(tableau))
endfunction
mode(0);
function [retour] = tableauCentre(tableau)
    [nbIndiv,nbCarac] = size(tableau)
    moyenneColonnes = mean(tableau,1)
    for tabIndLig = 1:nbIndiv
        for tabIndCol = 1:nbCarac
            tableau(tabIndLig,tabIndCol) = tableau(tabIndLig,tabIndCol) - moyenneColonnes(tabIndCol)
        end
    end
    retour = tableau
endfunction

function [retour] = tableauReduit(tableau)
    [nbIndiv,nbCarac] = size(tableau)
    for tabIndCol = 1:nbCarac
        tabEcartTypes(tabIndCol)=(1/sqrt(nbIndiv))*norm(tableau(:,tabIndCol))
    end
    retour = tableau
    for tabIndCol = 1:nbCarac
            retour(:,tabIndCol) = tableau(:,tabIndCol) /tabEcartTypes(tabIndCol)
    end
endfunction

function [composante1,composante2] = composantePrincipale(vecteurPropre1, vecteurPropre2, tableauCR)
    [nbIndiv,nbCarac] = size(tableauCR)
    
    composante1 = tableauCR*vecteurPropre1
    composante2 = tableauCR*vecteurPropre2
endfunction

function[vap,vep]=valsP(matCorrel)
    [vep,diagevals]=spec(matCorrel)
    vap=diag(diagevals)
endfunction

function [retour] = matriceCorrelation(tableau)
    [nbIndiv, nbCarac] = size(tableau);
    for tabIndColA = 1:nbCarac
        for tabIndColB = 1:nbCarac
            disp(tableau(:, tabIndColA))
            matCorr(tabIndColA, tabIndColB) =  tableau(:, tabIndColA)'*tableau(:, tabIndColB)
            matCorr(tabIndColA, tabIndColB) = (1/nbIndiv)*(matCorr(tabIndColA, tabIndColB))
        end
    end
    retour = matCorr
endfunction
