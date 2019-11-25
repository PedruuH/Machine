% Implementação em MatLab do algoritmo da Evolução Diferencial	
% para otimização(minimização) de função

    clear all; % apaga tudo que existe no workspace
	clc;       % limpa janela de comando

	% Inicialização dos parâmetros
	N=5; 		% número de variáveis da função a ser otimizada
	M=50; 		% tamanho da população
	F=0.5; 		% fator de mutação
	CR=0.9; 		% taxa de cruzamento
	I_max=100; 	% número máximo de iteração
    Run=1;      % número de execuções do algoritmo
	%X_max=[5.12,5.12]; % limites superiores das variáveis
	%X_min=[-5.12,-5.12];% limites inferiores das variáveis
    
    X_max=ones(1,N) * 5.12; % limites superiores das variáveis
	X_min=ones(1,N) * -5.12;
    
    Func=@Rastrigin; %define handle para a função de Rastrigin

	% 2.Execução do algoritmo (executa Run vezes)
    for r=1:Run
        iter=0;
        % 1.gera uma matrix MxN (população inicial de M vetores de dimensão N)
        for m=1:M
            for n=1:N
                X(m,n)=X_min(n)+rand()*(X_max(n)-X_min(n));
            end
        end		
        
        % ---- inicia a geração dos indivíduos da nova população
        for i=1:I_max  % conta número de gerações
            iter=iter+1;
            for m=1:M % para cada indivíduo(target vector)
                % realiza mutação
				[V]=rand1(X,M,F,m);
                % verifica se os valores estão fora dos limites
                for n=1:N
                    if V(1,n)>X_max(1,n)
                        V(1,n)=X_max(1,n);
                    end
                    if V(1,n)<X_min(1,n)
                        V(1,n)=X_min(1,n);
                    end
                end

                % realiza o cruzamento.
                % o trial vector U(1,n) é obtido a partir do cruzamento 
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

                % realiza Seleção
                % o vetor com melhor fitness vai para a próxima geração.
                % na seleção é usado o critério guloso.
                if Func(U(1,:)) < Func(X(m,:)) %minimização
                    escolhido=U(1,:);
                    else
                    escolhido=X(m,:);
                end
                % o resultado da seleção vai para a matriz Xnovo (nova população)
                Xnovo(m,:)=escolhido;
                
                % calcula o  fitness de cada indivíduo da geração atual
                % e coloca o resultado na matriz Y. 
                Y(m,1)=Func(X(m,:));
                
            end % fim do laço do cálculo de cada indivíduo que vai para a próxima geração
            
            X=Xnovo; % nova população se torna a população atual da nova geração
            
            % Seleciona o menor valor de fitness( minimização) da população
            % para plotar o melhor indivíduo da geração.
            [y,ind1]=sort(Y,1); %ordena Y em ordem crescente
			Y_min=y(1,1);
            [Ymin,ind] = min(Y);
            
            % plota o gráfico de desempenho
            figure(2);
            plot(iter,Ymin,'r.');
            xlabel('Iteração');
            ylabel('Fitness');
			title(sprintf('Iteração=%d, Fitness=%9.9f',i,Ymin));
            grid on;
            hold on;
			
        end % fim do laço de I_max iterações
	    
		hold off;
        PlotR();
        hold on;
        scatter3(X(ind,1),X(ind,2),Ymin,'fill','ro');
        xlabel('x1');
        ylabel('x2');
        zlabel('f(x1,x2)');
        
    end % executa Run=1 vez
    
    
    