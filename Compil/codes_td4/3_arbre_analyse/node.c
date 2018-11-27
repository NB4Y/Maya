#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "node.h"

node* node_new(char* name, node* n1, node* n2, node* n3) {
  node* n = malloc(sizeof(node));
  n->name = strdup(name);
  n->child1 = n1;
  n->child2 = n2;
  n->child3 = n3;
  return n;
}

void  node_print(node* n, int indent) {
  for (int i = 0; i < indent; i++)
    printf("\t");
  printf("%s\n", n->name);
  if (n->child1)
    node_print(n->child1, indent + 1);
  if (n->child2)
    node_print(n->child2, indent + 1);
  if (n->child3)
    node_print(n->child3, indent + 1);
}
