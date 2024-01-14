%{
#include <stdio.h>
#include "t2.tab.c"
%}

%%
"+"     {return PLUS; }     
"-"     {return MINUS; }    
[0-9]+  {yylval = atoi(yytext); return NUMBER;}  /*обрабатываем yytext с помощью функции atoi(), и помещаем результат в yylval */
"\n"    {return END;}  
.       {printf("Неизвестныф символ %c\n", *yytext);} 
%%
