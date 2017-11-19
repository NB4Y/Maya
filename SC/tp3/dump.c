#include "musee.h"


int main(int argc, char const *argv[])
{
	int etat_musee, capacite, file_max, capacite_max, file, etat_controleur, id;
	int *adr;
	key_t clef_m = ftok ("/etc/passwd", 'M');
	if (clef_m == -1)
		raler ("ftok memoire");

	key_t clef_s = ftok ("/etc/passwd", 'S');
	if (clef_s == -1)
		raler ("ftok semaphore");

	if (argc != 1)
	{
		printf("%s inutile.\n", argv [1]);
		raler ("usage: ./dump");
	}

	//récupération des variables...
	//...pour le segment de mémoire
	id=shmget (clef_m, 0, 0);
	if (id==-1)
		raler("Acces a la memoire");

	adr = shmat (id, NULL, 0);
	if (adr == (void *) -1)
		raler ("shmat");

	etat_musee = adr [0];
	capacite = adr [1];
	capacite_max = adr [2];
	file = adr [3];
	file_max = adr [4];

	if (shmdt (adr) == -1)
		raler("shmdt");

	//...pour les sémaphores

	id = semget (clef_s, 0, 0);
	if (id == -1)
		raler ("semget");

	etat_controleur = semctl (id , 1, GETVAL);

	//Le musée est ouvert/fermé
	printf("Le musée est ");
	if (etat_musee==1)
		printf("ouvert.\n");
	else
		printf("fermé.\n");
	
	//Le controleur est présent/absent
	printf("Le controleur est ");
	if(etat_controleur == 0)
		printf("présent.\n");
	else
		printf("absent.\n");

	//Il y a x visiteurs sur un maximum de x
	printf("Dans le musée, il y a %d visiteurs sur un maximum de %d.\n", capacite, capacite_max);
	
	//La file d'attente contient x visiteurs sur un maximum de x
	printf("La file d'attente contient %d visiteurs sur un maximum de %d.\n", file, file_max);

	return 0;
}
