%{
  #include <stdio.h>
  #include <stdlib.h>

  void yyerror(char*);
  int yylex();
  void lex_free();
%}

%union {
  char* string;
  int value;
}

%token <string> IDENTIFIER
%token <value> NUMBER

%left '+'
%left '*'

%%

axiom:
    expression '\n'
    { 
      printf("Match :-) !\n");
      return 0;
    }
  ;

expression:
    expression '+' expression
    { 
      printf("expression -> expression + expression\n");
    }
  | expression '*' expression
    {
      printf("expression -> expression * expression\n");
    }
  | '(' expression ')'
    {
      printf("expression -> ( expression )\n");
    }
  | IDENTIFIER
    {
      printf("expression -> IDENTIFIER (%s)\n", $1);
    }
  | NUMBER
    {
      printf("expression -> NUMBER (%d)\n", $1);
    }
  ;

%%

void yyerror (char *s) {
    fprintf(stderr, "[Yacc] error: %s\n", s);
}

int main() {
  printf("Enter an arithmetic expression:\n");
  yyparse();
  printf("-----------------\nSymbol table:\n");
  printf("-----------------\nQuad list:\n");

  // Be clean.
  lex_free();

  return 0;
}
