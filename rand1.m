% seleciona os vetores aleatoriamente

function [V]=rand1(X,M,F,m)

	R=randperm(M); % gera vetor R com a permuta��o(aleat�ria)  dos inteiros de 1 a M.
    % para ED com uma diferen�a, s�o necess�rios 3 vetores al�m do target vector.
	j=R(1);
	k=R(2);
	p=R(3);
        
    % vetor target n�o pode ser igual a qualquer dos
    % vetores usados nas diferen�as.
	if j==m
	   j=R(6);
	elseif k==m
	   k=R(6);
	elseif p==m
	   p=R(6);	   
    end
    
    % aplica��o da muta��o com  uma diferen�a de vetores.
    % o vetor X(j,:)� perturbado com  uma diferen�a ponderada de vetores.
	V=X(j,:)+F*(X(k,:)-X(p,:));
    
    