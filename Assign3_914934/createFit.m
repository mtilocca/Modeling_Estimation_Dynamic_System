function [fitresult, gof] = createFit(x, y, u)
    fitting = fittype('poly22');
    [xd, yd, zd] = prepareSurfaceData( x, y, u);
    m = [xd, yd];
    [fitresult, gof] = fit(m, zd,fitting, 'Normalize', 'on');
    
    figure(1);
    f = plot(fitresult, m, zd);
    legend(f, 'u vs y, x', 'Interpreter', 'none') ;
    grid on;
    xlabel('x', 'Interpreter', 'none');
    ylabel('y', 'Interpreter', 'none');
    zlabel('u', 'Interpreter', 'none');
    

end
