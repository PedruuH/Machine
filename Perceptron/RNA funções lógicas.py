print("X1")
x1=[int(input()),int(input()),int(input()),int(input())]
print("X2")
x2=[int(input()),int(input()),int(input()),int(input())]
print("Y")
y=[int(input()),int(input()),int(input()),int(input())]
print("X1:" ,x1)
print("X2:",x2)
print("Y: ",y)
def parametros(x1,x2,y):
    i=0; db=0; w1=0; w2=0; k=0; b=0;
    while i<len(x1):
        dw1=x1[i]*y[i]
        dw2=x2[i]*y[i]
        b=b+y[i]
        
        print("\ndw1: "+str(dw1)+"  dw2: "+str(dw2))
        while k<len(x1):
            w1=w1+dw1;
            w2=w2+dw2;
            k+=1
            print("w1: "+str(w1)+"  w2: "+str(w2))
            print("B: ",b)
            break
        i+=1
    t=[w1,w2,b]
    return t

def neuronio(x1,x2,w1,w2,limi,b):
    p=0
    print("expected y")
    while p<len(x1):
        if (w1*x1[p]+w2*x2[p]+b)>=limi:
            print("1")
        else:
            print("-1")
        p+=1

e= parametros(x1,x2,y)
print("\nW1 W2 e B\n" + str(e))
neuronio(x1,x2,e[0],e[1],0,e[2])

