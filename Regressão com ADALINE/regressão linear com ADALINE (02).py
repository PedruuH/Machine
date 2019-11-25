from random import uniform
import numpy as np
import matplotlib.pyplot as plt

t=[1.5,2.0,6.0,7.0,10.0,12.0,15.0,8.0,10,20,20,25,30,25,40,35,40,30,40,40,50,40,50,60,50]




x=[3,5,10,10,20,20,20,30,40,50,60,70,70,80,100,100,100,120,140,150,180,180,200,200]

alfa=0.00002;
b=uniform(-0.5,0.5);
w=uniform(-0.5,0.5)

flag=0;
errtotal=0
errant=0
y_in=0
y=0
B=4.967599658

while flag<140000:
    flag+=1
    errant=errtotal;
    for k in range(0,len(x)):
         y_in=x[k]*w + b
         y=y_in ;                
         errtotal+=0.5*(t[k] - y)*(t[k] - y);                
         w= w+ alfa*(t[k]-y)*x[k]; 
         b=b+alfa*(t[k]-y);
         
   

print(w)
print(b)
print(flag)



    #w 0.263780975
    #b 4.967599658




