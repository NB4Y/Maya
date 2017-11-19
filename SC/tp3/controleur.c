#include "musee.h"


int main(int argc, char const *argv[])
{
	key_t clef_m, clef_s;
	int id_m, id_s;
	int *adr;
	if (argc != 1)
		{
			printf("%s inutile.\n", argv [1]);
			raler ("usage: ./controleur");
		}

	clef_m = ftok ("/etc/passwd", 'M');
	if (clef_m == -1)
		raler ("ftok memoire");

	clef_s = ftok ("/etc/passwd", 'S');
	if (clef_s == -1)
		raler ("ftok semaphore");

	id_s = semget (clef_s, 0, 0);
	if (id_s == -1)
		raler ("semget");

	id_m=shmget (clef_m, 0, 0);
	if (id_m==-1)
		raler("Acces a la memoire");

	adr = shmat (id_m, NULL, 0);
	if (adr == (void *) -1)
		raler ("shmat");

	P(id_s, 1);
	etat ("Controleur arrivé.", 1);

	if (semctl (id_s, 0, SETVAL, 0)==-1)
		raler ("semctl");

	while (adr[0]==0)
	{
		etat ("Controleur attend l'ouverture.", 2);
		P(id_s, 3);
	}

	
	while (adr[0]!=2)
	{
		if (adr[1]<adr[2] && adr[3]>0)
		{
			etat ("Controleur laisse entrer visiteur.", 3);
			V(id_s, 0);
		}
		P(id_s, 2);
	}
	
	if (semctl (id_s, 3, SETVAL, 0)==-1) //on commence à considérer les visiteurs
		raler ("semctl");				 //sortants à partir de maintenant

	etat ("Controleur attend la sortie des derniers visiteurs.", 2);

	while (adr[1]>0)
	{
		P(id_s, 3);
	}

	V(id_s, 1);
	etat ("Controleur parti.", 1);
	
	adr = shmat (id_m, NULL, 0);
	if (adr == (void *) -1)
		raler ("shmat");

	adr[0]=0;

	if (shmdt (adr) == -1)
		raler("shmdt");

	return 0;
}
