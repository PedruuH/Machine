#include <iostream>
using namespace std;
int main()
{
	int t[]={1,-1};
	long int X[][25]={{1,1,1,1,1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1,-1,-1,1,-1,-1},{1,-1,-1,-1,1,-1,1,-1,1,-1,-1,-1,1,-1,-1,-1,1,-1,1,-1,1,-1,-1,-1,1}};
	double b=0,w[]={0,0},alfa=0.1;
	double tam=sizeof(X)/4,flag=0,y_in=0,y=0,errtotal=0,errant=0;
	do{
		flag+=1;
		errant=errtotal;
		for(int i=0;i<tam;i++)
		{
			for(int j=0;j<2;j++)
			{
				y_in+=X[i][j]*w[j];
				y=y_in+b;
				errtotal+=0.5*(t[j]-y)*(t[j]-y);
				w[j]+=0.5*(t[j]-y)*X[i][j];
				b+=alfa*(t[j]-y);
			}
		}
	}while((errtotal-errant)<0.00000001);
	system("pause");

	return 0;
};