% implementação de uma SOM do exemplo 4.4 da Fausett.
% clusterizar 100 vetores dados em 50 clusters.
clear all;
close all;
clc;

% Vetores de entrada
% cada linha, um vetor.
figure(1)

nb_values = 0;
x = zeros(100,2);
hold on;
while nb_values < 100
    x1 = -0.5 + rand(1,1);
    x2 = -0.5 + rand(1,1);

    if (x1^2+x2^2) < 0.25 
        nb_values = nb_values + 1;
        x(nb_values,:) = [x1 x2];
        plot(x1,x2,'b*');
    end

end

x = x';

% em 50 clusters 
m = 100;

% taxa de aprendizagem alfa inicial
alfainicial = 0.5;
alfafinal = 0.01;

% taxa geométrica tg de decréscimo de alfa
%tg=0.95;
% alfa = tg* alfa

% raio  R da vizinhança
R = 1;

% pesos iniciais, exemplo :
% temos dois clusters, cada neurônio de saída corresponde a um cluster

% w=[ 0.2 0.8
%     0.6 0.4
%     0.5 0.7
%     0.9 0.3];

% inicialização aleatória dos pesos entre -1 e 1
w = -1 + 2 .* rand(2,m);
% plot clusters
pl = plot(w(1,:),w(2,:),'-xr');
pause(1)

% ---------  treinamento ------------
numerototaldeciclos = 1000;
sizex = size(x);
nbPadraoes = sizex(2);
alfa = alfainicial;
tg = exp((log(alfafinal/alfainicial)) / numerototaldeciclos);
% init D for speed
D = zeros(1, m);

for ciclo=1:numerototaldeciclos
    for padrao=1:nbPadraoes
        % cálculo da distância do padrão de entrada e cada vetor peso
        for unit = 1:m
            D(unit) = sum( ( x(:,padrao) - w(:,unit) ) .^2 );
        end
        vencedor = 1;
        for unit = 2:m
            if D(unit) < D(vencedor)
                vencedor = unit;
            end
        end
        
        %atualização dos pesos do neurônio vencedor
        %w(:,vencedor) = w(:,vencedor) + alfa * (x(:,padrao) - w(:,vencedor));
        if vencedor - R < 1
            startUnit = 1;
        else
            startUnit = vencedor - R;
        end
        if vencedor + R > m
            endUnit = m;
        else
            endUnit = vencedor + R;
        end
        for i=startUnit:endUnit
            w(:, i)= w(:, i) + alfa * (x(:,padrao) - w(:, i));
        end
         
        %pause;
    end

    % redução da taxa de aprendizagem
    alfa=tg*alfa;
    %alfa= alfainicial*exp(-((ciclo)/15));
    
    % plot alfa
    % =======================
%     figure(2);
%     hold on;
%     plot(ciclo,alfa, 'r+');
    % =======================
   
    % plot each 10 cycle
    % =======================
%     if rem(ciclo, 10) == 0
%         java.lang.Thread.sleep(100)
        % delete last curve
        delete(pl);
        figure(1);
        pl = plot(w(1,:),w(2,:),'-xr');
        drawnow;
%     end
    % =======================
end

fprintf('end of program\n');





