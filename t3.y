%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void); 
int yyerror(char *s); 
%}

%union { /* для передачи значений чисел из лексического в синтаксический анализатор*/
double number;
}

%token <number> NUMBER 
%token END

%left '+' '-' 
%left '*' '/' 

%%

comman:
| comman exp END { printf("\n"); } /*правило для нетерминала comman, определяет последовательность выражений*/

exp: term
| exp '+' term { printf("+ "); }
| exp '-' term { printf("- "); }

term: factor
| term '*' factor { printf("* "); }
| term '/' factor { printf("/ "); }

factor: NUMBER { printf("%.2f ", $1); }
| '(' exp ')' {}

%%

int main(void) {
printf("Введите выражение:\n");
yyparse();
return 0;
}

int yyerror(char *s){
fprintf(stderr, "Ошибка: %s\n", s);
return 1;
}
