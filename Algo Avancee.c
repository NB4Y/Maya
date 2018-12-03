int exp (int x, int n)
/*
n>1
y = x^n
*/
if (n==1)
	y=x;
else
	y= exp(x, n-1) + x;
return y;

int exp (int x, int n)
/*
n>1
y = x^n
*/
y=1;
for (int i = n; i > 0; i--)
	{
		y= y*x;
	}	
return y;

