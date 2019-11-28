%{
#define YYSTYPE float
#include "calc.tab.h"
%}

DIGITO [0-9]
INTEIRO {DIGITO}+
REAL {INTEIRO}("."{INTEIRO})?

%%

{REAL} { yylval=atof(yytext); return NUMERO; }

"+" return ADICAO;
"-" return SUBTRACAO;
"*" return MULTIPLICACAO;
"/" return DIVISAO;

"(" return ESQUERDA;
")" return DIREITA;

"\n" return FIM;
