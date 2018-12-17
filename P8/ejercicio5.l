%{
#include <iostream>
#include <string>
using namespace std;
#include "ejercicio5.tab.h"
%}

separador [ \t]
letra [a-zA-Z]
digito  [0-9]
%%
(separador)+  {}
(digito)+ {yylval.entero=atoi(yytext);  return CONSTENTERA;}
":="  {return OPAS;}
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
{letra}({letra}|{digito})*  {yylval.nombre = new string(yytext);
return IDENTIFICADOR;}
"(" {return '(';}
")" {return ')';}
\n  {return (NL);}
. ECHO;
%%
