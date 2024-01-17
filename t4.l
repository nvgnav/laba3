%{
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%

[0-9]+ { yylval.number = atoi(yytext); return NUMBER; } 
[-+*/(){}] { return yytext[0]; }
"\n" { return END; }
[ \t] { } /* Игнорирует пробелы и символы табуляции */
. { printf("Неопознанный символ %c\n", *yytext); } 
%%

