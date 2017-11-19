#include "musee.h"

int main(int argc, char const *argv[])
{
	int capacite, file, id_m, id_s, x=0;
	int *adr;
	key_t clef_m = ftok ("/etc/passwd", 'M');
	if (clef_m == -1)
		raler ("ftok memoire");

	key_t clef_s = ftok ("/etc/passwd", 'S');
	if (clef_s == -1)
		raler ("ftok semaphore");

	if (argc < 2 || argc > 4)
	{
		raler ("usage: ./directeur [ouvrir | fermer | supprimer | creer (capacité) (file)]");
		return 0;
	}

	if (argc == 2)
	{		
		if (strcmp (argv[1], "ouvrir")==0)
		{
			id_m=shmget (clef_m, 0, 0);
			if (id_m==-1)
				raler("Acces a la memoire");

			adr = shmat (id_m, NULL, 0);
			if (adr == (void *) -1)
				raler ("shmat");

			id_s=semget (clef_s, 0, 0);
			if (id_s==-1)
				raler("Acces au semaphore");

			if (semctl (id_s, 2, GETVAL) != 0)
			{
				raler("Ouverture impossible");
			}

			adr [0] = 1; 			 //1=ouvert
			V(id_s, 4);

			if (shmdt (adr) == -1)
				raler("shmdt");
		}

		else if (strcmp (argv[1], "fermer")==0)
		{
			id_m=shmget (clef_m, 0, 0);
			if (id_m==-1)
				raler("Acces a la memoire");

			adr = shmat (id_m, NULL, 0);
			if (adr == (void *) -1)
				raler ("shmat");

			adr [0] = 2; 			 //2=fermeture imminente

			if (shmdt (adr) == -1)
				raler("shmdt");


			id_s=semget (clef_s, 0, 0);
			if (id_s==-1)
				raler("Acces au semaphore");

			V(id_s, 3);
		}

		else if (strcmp (argv[1], "supprimer")==0)
		{
			//SUPPRESSION DU SEGMENT DE MEMOIRE PARTAGE
			id_m=shmget (clef_m, 0, 0);
			if (id_m==-1)
				raler("Acces a la memoire");
			if (shmctl (id_m, IPC_RMID, NULL) == -1)
				raler("shmctl suppression");
			
			//SUPPRESSION DU GROUPE DE SEMAPHORES
			id_s=semget (clef_s, 0, 0);
			if (id_s==-1)
				raler("Acces au semaphore");

			if(semctl (id_s, 0, IPC_RMID, NULL)==-1)
				raler ("semctl suppression");
		}

		else
			raler ("usage: ./directeur [ouvrir | fermer | supprimer | creer (capacité) (file)]");
	}
	else if (argc == 4)
	{
		if (strcmp (argv[1], "creer")==0)
		{
			capacite = atoi(argv[2]);
			file = atoi(argv[3]);
			if (capacite < 1 || file < 0)
			{
				raler ("usage: ./directeur creer (capacité > 1) (file > 0)");
			}

			//CREATION DU SEGMENT DE MEMOIRE PARTAGE
			id_m=shmget (clef_m, 0, 0);
			if (id_m!=-1)
				raler("Segment existant");
			id_m=shmget (clef_m, 5*4, IPC_CREAT | 0666);
			if (id_m==-1)
				raler("Creation de la memoire");

			adr = shmat (id_m, NULL, 0);
			if (adr == (void *) -1)
				raler ("shmat");

			adr [0] = 0; 		//0=ferme	1=ouvert
			adr [1] = 0;
			adr [2] = capacite;
			adr [3] = 0;
			adr [4] = file;

			if (shmdt (adr) == -1)
				raler("shmdt");

			//CREATION DU GROUPE DE SEMAPHORES
			id_s=semget (clef_s, 5, IPC_CREAT | 0666);
			if (id_s==-1)
				raler("Creation du semaphore");

			x+= semctl (id_s, 0, SETVAL, 0);
			x+= semctl (id_s, 1, SETVAL, file);
			x+= semctl (id_s, 2, SETVAL, 1);
			x+= semctl (id_s, 3, SETVAL, 0);
			x+= semctl (id_s, 4, SETVAL, 0);

			if (x < 0) //teste si au moins un des setval a donne une erreur
				raler ("semctl");
		}
	}

	else 
		raler ("usage: ./directeur [ouvrir | fermer | supprimer | creer (capacité) (file)]");

	return 0;
}
