% c�lculo da fun��o de Rastrigin

function y = Rastrigin (X)
	
	A = 10;
	n = 2; % duas vari�veis, X(1) e X(2)
	m = 0;
    
	for i = 1:n
		m = m + X(i)^2 - A*cos(2*pi*X(i));
	end
	
	y = 10*n + m;	
	
end