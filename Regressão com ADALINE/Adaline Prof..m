%Implementação do Adaline para a funcao logica OU bipolar
%
clear all;
%inicialização dos pesos
bold=rand-0.5;;
wold=rand(1,2)-0.5;
wnew=wold;
bnew=bold;

%inicialização da taxa de aprendizagem alfa(tem que ser de valor pequeno)
alfa=0.1;

% matriz de padroes de entrada
x=[  -1  -1   
     -1   1 
      1  -1 
      1   1 ];
%vetor de saida
t=[-1 
    1 
    1 
    1]; 

ciclo=0;
hold on;
%para o trabalho desta semana, substituir a condição de parada
% como sendo a diferença entre o erro quadrático total do ciclo atual e 
% o erro do ciclo anterior.
% (erqtotalnovo-erqtotalanterior)<0.0000001

% inicio do treinamento
while ciclo<50 %enquanto condição de parada não for satisfeita
    ciclo=ciclo+1;
    
    erqtotal=0; % armazena erro quadratico total em cada ciclo
    
    %entrada dos padrões de treinamento
    for padrao=1:4
        % valor liquido de entrada do neuronio
        y_in=x(padrao,:)*wold'+bold;
        %função de ativação linear
        y=y_in;
        %cálculo do erro quadratico total
        erqtotal= erqtotal+ 0.5*(t(padrao)-y)^2;
        %atualização dos pesos
        wnew= wold + alfa*(t(padrao)-y)*x(padrao,:); 
        bnew=bold+alfa*(t(padrao)-y);
        bold=bnew;
        wold=wnew ;           
    end 
    plot(ciclo, erqtotal,'r*');
end
bnew
wnew
ciclo

%teste da rede treinada
for padrao=1:4
        % valor liquido de entrada do neuronio
        y_in=x(padrao,:)*wold'+bold;
        %função de ativação linear
        if y_in>=0
            y=1;
        else
            y=-1;
        end
        fprintf('Saida para o padrão de entrada %2d : %2d.\n', padrao, y);
        
end