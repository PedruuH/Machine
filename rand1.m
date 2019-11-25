% seleciona os vetores aleatoriamente

function [V]=rand1(X,M,F,m)

	R=randperm(M); % gera vetor R com a permutação(aleatória)  dos inteiros de 1 a M.
    % para ED com uma diferença, são necessários 3 vetores além do target vector.
	j=R(1);
	k=R(2);
	p=R(3);
        
    % vetor target não pode ser igual a qualquer dos
    % vetores usados nas diferenças.
	if j==m
	   j=R(6);
	elseif k==m
	   k=R(6);
	elseif p==m
	   p=R(6);	   
    end
    
    % aplicação da mutação com  uma diferença de vetores.
    % o vetor X(j,:)é perturbado com  uma diferença ponderada de vetores.
	V=X(j,:)+F*(X(k,:)-X(p,:));
    
    