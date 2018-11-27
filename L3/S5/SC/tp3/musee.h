#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <errno.h>

void raler (char *msg);
void etat(char *msg, int lvl);
void P (int id, int num);
void V (int id, int num);
