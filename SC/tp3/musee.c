#include "musee.h"

void raler (char *msg)
{
	if (errno!=0)
		perror (msg);
	else
	{
		fprintf(stderr, "%s\n", msg);
		fflush(NULL);
	}
	exit (1);
}

void etat(char *msg, int lvl)
{
	int x= atoi (getenv ("DEBUG_MUSEE"));
	if (x>0)
	{
		//printf("%d\n", x);
		if (x >= lvl)
		{
			fprintf(stdout, "%s\n", msg);
			fflush(NULL);
		}
	}
}

void P (int id, int num)
{
	struct sembuf s[1] = { {num, -1, 0} };
	if (semop (id, s, 1) == -1)
		raler ("semop");
}

void V (int id, int num)
{
	struct sembuf s[1] = { {num, 1, 0} };
	if ( semop (id, s, 1) == -1)
		raler ("semop");
}

