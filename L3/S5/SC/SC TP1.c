#include <pthread.h>
#include <stdio.h>

void *fonction (void *arg)
{
	int x;
	for (x=0; x < 1000000;x++)
	{
		
	}
	return NULL;
}

void raler (char *msg)
{
	perror (msg);
	exit (1);
}

int main(int argc, char const *argv[])
{
	pthread_t tid [4];
	int i;
	long int cpt=0;


	return 0;
}