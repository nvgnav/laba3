%{
#include <stdio.h>
#include "t3.tab.c"

%}

%option noyywrap

%%

[0-9]+(\.[0-9]+)? { yylval.number = atof(yytext); return NUMBER; } 
[-+*/(){}] { return yytext[0]; }
"\n" { return END; }
[ \t] { } /*игнорирует пробелы и символы табуляции*/
. {printf("Mystery character %c\n", *yytext);} 
%%

