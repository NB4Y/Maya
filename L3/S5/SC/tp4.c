#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <pthread.h>

typedef struct monsem
{
	int cpt;
	int nbReveils;
	pthread_cond_t c;
	pthread_mutex_t m;
} monsem_t;

void raler (char *msg)
{
	if (errno!=0)
		perror (msg);
	exit (1);
}

int monsem_init (monsem_t* var, int x)
{
	var-> cpt= x;
	var-> nbReveils=0;

	if (pthread_cond_init (&var->c, NULL)<0)
		raler("cond_init");

	if (pthread_mutex_init (&var->m, NULL)<0)
		raler("mutex_init");

	return 0;

}

int monsem_P (monsem_t* var)
{
	pthread_mutex_lock  (&var->m) ;
	var->cpt--;
	if (var->cpt < 0)
		while (var->nbReveils<=0)
			pthread_cond_wait  (&var->c, &var->m) ;
		var->nbReveils--;
	pthread_mutex_unlock  (&var->m) ;
}

int monsem_V (monsem_t* var)
{
	var->cpt++;
	pthread_mutex_lock  (&var->m) ;
	pthread_mutex_unlock  (&var->m) ;
	if (var->cpt < 0)
	{
		pthread_cond_signal  (&var->c) ;
		var-> nbReveils++;
	}
}



int main(int argc, char const *argv[])
{
	
	return 0;
}