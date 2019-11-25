% Implementa��o em MatLab do algoritmo da Evolu��o Diferencial	
% para otimiza��o(minimiza��o) de fun��o

    clear all; % apaga tudo que existe no workspace
	clc;       % limpa janela de comando

	% Inicializa��o dos par�metros
	N=5; 		% n�mero de vari�veis da fun��o a ser otimizada
	M=50; 		% tamanho da popula��o
	F=0.5; 		% fator de muta��o
	CR=0.9; 		% taxa de cruzamento
	I_max=100; 	% n�mero m�ximo de itera��o
    Run=1;      % n�mero de execu��es do algoritmo
	%X_max=[5.12,5.12]; % limites superiores das vari�veis
	%X_min=[-5.12,-5.12];% limites inferiores das vari�veis
    
    X_max=ones(1,N) * 5.12; % limites superiores das vari�veis
	X_min=ones(1,N) * -5.12;
    
    Func=@Rastrigin; %define handle para a fun��o de Rastrigin

	% 2.Execu��o do algoritmo (executa Run vezes)
    for r=1:Run
        iter=0;
        % 1.gera uma matrix MxN (popula��o inicial de M vetores de dimens�o N)
        for m=1:M
            for n=1:N
                X(m,n)=X_min(n)+rand()*(X_max(n)-X_min(n));
            end
        end		
        
        % ---- inicia a gera��o dos indiv�duos da nova popula��o
        for i=1:I_max  % conta n�mero de gera��es
            iter=iter+1;
            for m=1:M % para cada indiv�duo(target vector)
                % realiza muta��o
				[V]=rand1(X,M,F,m);
                % verifica se os valores est�o fora dos limites
                for n=1:N
                    if V(1,n)>X_max(1,n)
                        V(1,n)=X_max(1,n);
                    end
                    if V(1,n)<X_min(1,n)
                        V(1,n)=X_min(1,n);
                    end
                end

                % realiza o cruzamento.
                % o trial vector U(1,n) � obtido a partir do cruzamento 
                % do target vector X(m,n) e do vetor mutado V(1,n),
                % elemento a elemento.
                
                % sorteio do elemento de V(1,n) que vai direto para U(1,n)
                jrand=floor(rand()*N+1); 
                
                % gera o trial vector U(1,n)
                for n=1:N
                    R1=rand();
                    if (R1<CR || n==jrand) % pega elemento de V
                        U(1,n)=V(1,n);
                    else
                        U(1,n)=X(m,n); % pega elemento de X
                    end
                end

                % realiza Sele��o
                % o vetor com melhor fitness vai para a pr�xima gera��o.
                % na sele��o � usado o crit�rio guloso.
                if Func(U(1,:)) < Func(X(m,:)) %minimiza��o
                    escolhido=U(1,:);
                    else
                    escolhido=X(m,:);
                end
                % o resultado da sele��o vai para a matriz Xnovo (nova popula��o)
                Xnovo(m,:)=escolhido;
                
                % calcula o  fitness de cada indiv�duo da gera��o atual
                % e coloca o resultado na matriz Y. 
                Y(m,1)=Func(X(m,:));
                
            end % fim do la�o do c�lculo de cada indiv�duo que vai para a pr�xima gera��o
            
            X=Xnovo; % nova popula��o se torna a popula��o atual da nova gera��o
            
            % Seleciona o menor valor de fitness( minimiza��o) da popula��o
            % para plotar o melhor indiv�duo da gera��o.
            [y,ind1]=sort(Y,1); %ordena Y em ordem crescente
			Y_min=y(1,1);
            [Ymin,ind] = min(Y);
            
            % plota o gr�fico de desempenho
            figure(2);
            plot(iter,Ymin,'r.');
            xlabel('Itera��o');
            ylabel('Fitness');
			title(sprintf('Itera��o=%d, Fitness=%9.9f',i,Ymin));
            grid on;
            hold on;
			
        end % fim do la�o de I_max itera��es
	    
		hold off;
        PlotR();
        hold on;
        scatter3(X(ind,1),X(ind,2),Ymin,'fill','ro');
        xlabel('x1');
        ylabel('x2');
        zlabel('f(x1,x2)');
        
    end % executa Run=1 vez
    
    
    