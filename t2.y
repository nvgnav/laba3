%{
    #include<stdio.h>
    int yyerror(char *s);
    int yylex();
%}
/* список токенов */
%token NUMBER 
%token END
%token PLUS MINUS 

%%
statement: exp END {printf("Ответ: %d\n",$1);}
 exp: NUMBER         {$$ = $1; }
    | exp PLUS NUMBER {$$ = $1 + $3; }
    | exp MINUS NUMBER {$$ = $1 - $3; }
    ;

%%
int main()
{
    printf("Введите выражение: ");
    yyparse();
    return 0;
}
int yyerror(char *s){
    fprintf(stderr, "Ошибка: %s\n", s);
    return 1;
}
