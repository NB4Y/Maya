#include <unistd.h>
#include "musee.h"


int main(int argc, char const *argv[])
{
	int Duree, id_s, id_m;
	int *adr;
	key_t clef_m, clef_s;
	if (argc != 2)
		raler ("usage: ./visiteur (duree de visite)");

	Duree = atoi(argv[1]);
	if (Duree < 0)
	{
		raler ("usage: ./visiteur (duree de visite > 0)");
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

	if (adr [3] >= adr [4])
		return 0;	//Si la file est trop longue, le visiteur renonce

	adr[3]++;		//Entre dans la file
	etat ("Visiteur arrivé dans la file.", 2);
	V (id_s, 2);	//Signale sa présence au controleur
	P(id_s, 0);		//Demande l'accès

	adr[3]--;
	etat ("Visiteur sorti de la file.", 2);
	adr[1]++;
	etat ("Visiteur entré dans le musée.", 1);
	Duree*=1000;
	usleep (Duree);
	adr[1]--;
	etat ("Visiteur sorti du musée.", 1);
	if (adr[0]==1)
		V (id_s, 2);	//Signale son départ au controleur
	else
		V (id_s, 3);	//Signale son départ au controleur

	if (shmdt (adr) == -1)
		raler("shmdt");

	return 0;
}
