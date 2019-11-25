from random import uniform
x=[[1,1,1,1,1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1],
   [1,-1,-1,-1,1,-1,1,-1,1,-1,-1,-1,1,-1,-1,-1,1,-1,1,-1,1,-1,-1,-1,1]]

t=[1,-1]

alfa=0.1;
bold=uniform(-0.5, 0.5);
wold=[uniform(-0.5, 0.5),uniform(-0.5, 0.5)]
wnew=wold;
bnew=bold;
flag=0;
errtotal=0
errant=0
y_in=0
y=0

while (errtotal-errant)>0.0000001:
    flag+=1
    errant=errtotal;
    for k in x:
        for p in range(0,2):
            for i in range(0,len(k)):
                y_in=k[i]*wold[p]+bold
                y=y_in;                
                errtotal+=0.5*(t[p] - y)*(t[p] - y);
                
                wold[p]+= alfa*(t[p]-y)*k[i]; 
                bold+=alfa*(t[p]-y);
                

print(wold)
print(bold)
print(wnew)
print(bnew)



    
def neu(x):
    y=0
    y_in=0
    for k in x:
        for p in range(0,1):
            for i in range(0,len(k)):
                y_in=k[i]*wold[p]+bold
                y=y_in;
            if y>=0:
                print(1)
            else:
                print(-1)


neu(x)
