#include <sys/shm.h>
#include <stdio.h>
#include <unistd.h>

void fonction (int )
{
	int i;
	for (i=0; i < 1000000;i++)
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
	int i, id = shmget(IPC_PRIVATE, size_of (long int), IPC_CREAT|0777);
	long int cpt=0;
	pid_t pid[4];
	for (i = 0; i < 4; ++i)
	{
		switch(pid[i]=fork())
		{
			case -1 : raler ("fork");

			case 0 : fonction ();

			default : 

		}
	}




	return 0;
}