%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "ast.h"
  int yylex();
  void yyerror(char*);
%}

%union {
  char* string;
  int value;
  struct ast* ast;
}

%token <string> ID
%token <value> NUMBER
%type <ast> expr

%left '+'
%left '*'

%%

axiom:
  expr '\n'       { ast_print($1, 0); }
  ;

expr:
    expr '+' expr { $$ = ast_new_operation("+", $1, $3); }
  | expr '*' expr { $$ = ast_new_operation("*", $1, $3); }
  | '(' expr ')'  { $$ = $2; }
  | ID            { $$ = ast_new_id($1); }
  | NUMBER        { $$ = ast_new_number($1); }
  ;

%%

int main() {
  printf("Entrez une expression :\n");
  return yyparse();
}
