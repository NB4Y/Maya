%{
  #include <stdio.h>
  #include <stdlib.h>
  #include "node.h"
  int yylex();
  void yyerror(char*);
%}

%token ID NUMBER
%left '+'
%left '*'

%%

axiom:
  expr '\n'       { node_print($1, 0); }
  ;

expr:
    expr '+' expr { $$ = node_new("expr", $1, $2, $3); }
  | expr '*' expr { $$ = node_new("expr", $1, $2, $3); }
  | '(' expr ')'  { $$ = node_new("expr", $1, $2, $3); }
  | ID            { $$ = node_new("expr", $1, NULL, NULL); }
  | NUMBER        { $$ = node_new("expr", $1, NULL, NULL); }
  ;

%%

int main() {
  printf("Entrez une expression :\n");
  return yyparse();
}
