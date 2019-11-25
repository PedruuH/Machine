X=[1,1,1,1,1,
   -1,-1,1,-1,-1,
   -1,-1,1,-1,-1,
   -1,-1,1,-1,-1,
   -1,-1,1,-1,-1],[1,-1,-1,-1,1,
    -1,1,-1,1,-1,
    -1,-1,1,-1,-1,
    -1,1,-1,1,-1,
    1,-1,-1,-1,1];
   
erro=1; w=[0,0]; b=0; teta=0; tx_aprend=0.1; y=[0,0]; soma=0; t=[1,-1]; ciclos=0

while erro==1:
    ciclos+=1
    for i in range(0,2):
        for j in range(0,len(X[0])):
            soma+=X[i][j]*w[i]
    soma+=b
    if soma>=teta:
        y[i]=1
    else:
        y[i]=-1     

    if y==t:
        print("reconheceu o padrão")
        erro=0
    else:
        for i in range(0,2):
            for j in range(0,len(X[0])):
                w[i]=w[i]+tx_aprend*X[i][j]*t[i]
                b=b+tx_aprend*t[i]
        erro=1




print("foram gastos",ciclos,"cliclos")
