%{
#define YYSTYPE float
#include <stdio.h>
%}

%token NUMERO
%token ADICAO SUBTRACAO MULTIPLICACAO DIVISAO
%token ESQUERDA DIREITA
%token FIM

%left SUBTRACAO ADICAO
%left DIVISAO MULTIPLICACAO

%define parse.error verbose

%%

Entrada: /* vazio */;
Entrada: Entrada Informacao;

Informacao: FIM;
Informacao: Expressao FIM {
    printf("Resultado: %f\n\n", $1);
};

Expressao: NUMERO { $$ = $1; };
Expressao: Expressao ADICAO Expressao { $$ = $1 + $3; };
Expressao: Expressao SUBTRACAO Expressao { $$ = $1 - $3; };
Expressao: Expressao MULTIPLICACAO Expressao { $$ = $1 * $3; };
Expressao: Expressao DIVISAO Expressao { $$ = $1 / $3; };
Expressao: ESQUERDA Expressao DIREITA { $$ = $2; };

%%

int yyerror(char const *s) {
    printf("%s\n", s);
    return 0;
}

int main() {

    yyparse();
    printf("Erros encontrados!\n");

    return 0;
}