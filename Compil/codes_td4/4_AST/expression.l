%{
  #include <stdlib.h>
  #include <string.h>
  #include "ast.h"
  #include "y.tab.h"
%}

identifier [a-zA-Z_]+[0-9a-zA-Z_]*
number     [1-9][0-9]*

%%

{identifier} { yylval.string = strdup(yytext); return ID; }
{number}     { yylval.value = atoi(yytext); return NUMBER; }
[()+*]       { return yytext[0]; }          
[\n]         { return yytext[0]; }
.            { printf("Caractere inconnu: %s", yytext); }

%%
