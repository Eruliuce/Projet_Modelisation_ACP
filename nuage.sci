function nuage(Coord,i,j);								
//projection des individus dans le plan i-j
    xset("font",4,3);
    deltax=(max(Coord(:,i))-min(Coord(:,i)))/20;
    xmin=min(Coord(:,i))-deltax;
    xmax=max(Coord(:,i))+deltax;
    deltay=(max(Coord(:,j))-min(Coord(:,j)))/20;
    ymin=min(Coord(:,j))-deltay;
    ymax=max(Coord(:,j))+deltay;
  //  isoview(xmin,ymin,xmax,ymax);
    titre="Projection sur le plan "+string(i)+"-"+string(j)
  // afficher les individus
    plot2d(Coord(:,i),Coord(:,j),-3,"031",rect=[xmin,ymin,xmax,ymax]);	
    n = size(Coord,"r");  
    for l=1:n,
        xstring(Coord(l,i),Coord(l,j),string(l));
    end;
        xtitle(titre);
endfunction;
