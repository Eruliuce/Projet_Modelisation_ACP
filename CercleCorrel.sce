function CercleCorrel(caraCentreReduit)
    t=0:0.00001:2*%pi;
    plot(0.5 * cos(t), 0.5 * sin(t));
    plot(cos(t), sin(t));
    [n1, n2] = size(caraCentreReduit);
    for i=1:n2;
        plot(caraCentreReduit(1,i), caraCentreReduit(2,i), ".r");
    end
endfunction

