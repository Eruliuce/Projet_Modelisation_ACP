function CercleCorrel(caraCentreReduit)
    t=0:0.00001:2*%pi;
    plot(0.5 * cos(t), 0.5 * sin(t));
    plot(cos(t), sin(t));
    [n1, n2] = size(caraCentreReduit);
    for i=1:n2;
        plot(caraCentreReduit(1,i), caraCentreReduit(2,i), ".r");
    end
endfunction

function [tableauCR] = tableauCentreReduit(tableau)
    tableauC = tableauCentre(tableau)
    tableauCR = tableauReduit(tableauC)
endfunction


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


function qualite = QualiteRepresentationIndividu(Base,Z, comp1, comp2)     
    nbIndividu = size(Z,"r");
    nbAxe = size(Base,"c");
    Q2 = zeros(nbIndividu,2);
    for i = 1 : nbIndividu
          scal = ((Z(i,:)')'*(Base(:,comp1)));
          norme = norm(Z(i,:));
          Q2(i,1) = (scal*scal/(norme*norme));
          scal = ((Z(i,:)')'*(Base(:,comp2)));
          norme = norm(Z(i,:));
          Q2(i,2) = (scal*scal/(norme*norme));
    end
endfunction

function [vap, vep]=valsP(A)
    [vep, diagevals]=spec(A)
    vap=diag(diagevals)
endfunction

function nuagePoints(MatCoord,i,j);
    xset("font",4,3);
    x = (max(MatCoord(:, i)) - min(MatCoord(:, i))) / 20;
    xmin = min(MatCoord(:, i)) - x;
    xmax = max(MatCoord(:, i)) + x;
    y = (max(MatCoord(:, j)) - min(MatCoord(:, j))) / 20;
    ymin = min(MatCoord(:, j)) - y;
    ymax = max(MatCoord(:, j)) + y;
    plot2d(MatCoord(:, i),MatCoord(:, j), -3, "031", rect = [xmin,ymin,xmax,ymax]);	
    n = size(MatCoord, "r");  
    for l = 1:n,
        xstring(Coord(l, i), MatCoord(l, j), string(l));
    end;
endfunction;


function execProjet()
    [fd,SST,Sheetnames,Sheetpos] = xls_open('Voitures.xls')
    [m,TextInd] = xls_read(fd,Sheetpos(1))
    mclose(fd)
    tabCR = tableauCentreReduit(m);
    matCor = matriceCorrelation(tabCR);
    [valeursP, vecteursP] = valsP(matCor);
    basePlan = functionBase(valeursP, vecteursP);
    //qualite = QualiteRepresentationInd0(basePlan, ???
    [composante1, composante2] = composantePrincipale(vecteursP(:,1), vecteursP(:,2), tabCR);
    CercleCorrel(tabCR);
    //nuagePoints(?,?,?)
endfunction
