%{
  #include <stdlib.h>
  #include "node.h"
  #include "y.tab.h"
%}

identifier [a-zA-Z_]+[0-9a-zA-Z_]*
number     [1-9][0-9]*

%%

{identifier} { yylval = node_new("ID",     NULL, NULL, NULL); return ID; }
{number}     { yylval = node_new("NUMBER", NULL, NULL, NULL); return NUMBER; }
[()+*]       { yylval = node_new(yytext,   NULL, NULL, NULL); return yytext[0]; }          
[\n]         { return yytext[0]; }
.            { printf("Caractere inconnu: %s", yytext); }

%%
