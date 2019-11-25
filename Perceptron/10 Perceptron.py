X=[[-1,1,1,1,-1,1,-1,-1,-1,1,1,-1,-1,-1,1,1,-1,-1,-1,1,-1,1,1,1,-1],
   [-1,1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,-1,1,1,1,-1],
   [],
   [],
   [],
   [],
   [],
   [],
   [],
   []]

def neuronio0(x,teste):
    yl=0;w=0;b=0;limiar=1;y=0;erro=1;j=0;tx_aprend=0.1;t=1;ciclos=0
    while erro==1:
        ciclos+=1
        if teste==True:
            for i in range(0,len(x)):
                yl+=x[i]*w            
            yl+=b            
            if yl>=limiar:
               y=1
               erro=0
            else:
                erro=1

                for j in range(0,len(x)):
                        w=w+tx_aprend*x[i]*t
                        b=b+tx_aprend*t
                
                     
            for i in range(0,len(x)):
                yl+=x[i]*w            
            yl+=b            
            if yl>=limiar:
               print("y=1")
               erro==0
            else:
                erro==1
                

neuronio0(X[0],True)
