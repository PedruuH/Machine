% plota a fun��o a ser otimizada.
% neste caso, a  fun��o de Rastrigin

function PlotR()

[X,Y] = meshgrid(-5.12:0.03:5.12,-5.12:0.03:5.12);
N = size(X,1);

for i = 1:N
    for j = 1:N
        z = [X(i,j),Y(i,j)];
        Z(i,j) = Rastrigin(z);
    end
end

figure(1);
mesh(X,Y,Z);
title('Fun��o de  Rastrigin  em 2 dimens�es');

axis([-5.5 5.5 -5.5 5.5 0 80]);

end