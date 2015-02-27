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
