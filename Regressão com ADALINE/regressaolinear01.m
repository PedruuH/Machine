% exemplo de regress�o linear com ADALINE
clear all;
clc;
hold on;
xlabel('entrada');
ylabel('saida');
%dados de entrada
target =[1.5 2 6 7 10 12 15 8 10 20 20 25 30 25 40 35 40 30 40 40 50 40 50 60 50];


x=[3 5 10 10 20 20 20 30 40 50 60 70 70 80 100 100 100 120 120 140 150 180 180 200 200];

       

a=0.26924496421207783;
b=4.069870425466952;
y=a*x+b;

plot(x,y);
plot(x,target);





