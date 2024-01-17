%{
#include <stdio.h>
void print_op(char op);
%}

%token NUMBER
%token LPAREN RPAREN
%token EOL

%left '+' '-'
%left '*' '/'

%%
expr : expr '+' expr { print_op('+'); }
     | expr '-' expr { print_op('-'); }
     | expr '*' expr { print_op('*'); }
     | expr '/' expr { print_op('/'); }
     | '(' expr ')'  {  }
     | NUMBER        {
                           printf("%d ", $1); 
                       }
     ;

%%

int main(void) {
  printf("Введите выражение:\n");
  yyparse();
  return 0;
}

void yyerror(char *s) {
  fprintf(stderr, "Ошибка: %s\n", s);
}

void print_op(char op) {
  printf("%c ", op);
}

