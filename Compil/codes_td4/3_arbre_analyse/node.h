typedef struct node {
  char* name;
  struct node* child1;
  struct node* child2;
  struct node* child3;
} node ;

#define YYSTYPE struct node*

node* node_new(char*, node*, node*, node*);
void  node_print(node*, int);
