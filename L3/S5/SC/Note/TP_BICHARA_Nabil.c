//TP noté de BICHARA Nabil
/*N'ayant pas réussi à suivre exactement la consigne,
mon tp fait un thread lecteur qui après avoir lu une ligne se ferme,
puis un thread dormant qui après avoir dormi se ferme, 
puis recommence avec un nouveau thread lecteur.
La boucle se ferme après 100 lectures ou après une lecture nulle ou de 0.
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <pthread.h>
#include <sys/ipc.h>
#include <unistd.h>

void raler (char *msg)
{
	if (errno!=0)
		perror (msg);
	exit (1);
}

void *lecteur (void* arg)
{
	int i = *(int*) arg ;
	int *x;
	char *entree1, *entree2= malloc (5*sizeof(char));
	printf ("Lecture n° %d \n", i) ;
	x= malloc(sizeof(int));
	entree1=fgets (entree2, 100, stdin);
	if (entree1==NULL)
		pthread_exit (NULL);
	*x=atoi(entree1);
	free (entree2);
	pthread_exit (x);
	return (NULL);
}

void *dormeur (void* arg)
{
	int i = *(int*) arg;
	printf ("Je dors %d secondes.\n", i);
	sleep (i);
	printf ("Je me réveille après %d secondes.\n", i);
	pthread_exit (NULL);
	return (NULL);
}

int main(void)
{
	pthread_t T_lecteur, T_dormeur[100];
	void *truc= NULL;
	int flag=1;
	int *y;
	y= malloc(sizeof(int));
	*y=1;
	while (flag)
	{
		if (pthread_create (&T_lecteur, NULL, lecteur, y)==-1)
			raler ("pthread_create");
		if (pthread_join (T_lecteur, &truc)==-1)
			raler ("pthread_join");
	
		if (pthread_create (&T_dormeur[(*y)-1], NULL, dormeur, truc)==-1)
			raler ("pthread_create");
		if (pthread_join (T_dormeur[(*y)-1], NULL)==-1)
			raler ("pthread_join");

		if(*(int*)truc==0)
			flag=0;
		else 
			free (truc);
		(*y)++;
	}
	free (y);
	return 0;
}