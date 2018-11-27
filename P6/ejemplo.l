%{
#include <iostream>
using namespace std;
int num_lineas = 0; int num_caracteres = 0;
%}

%option noyywrap
%%
\n num_lineas++; num_caracteres++;
\EOF num_lineas++; num_caracteres++;
. num_caracteres++;
%%

int main()
{
  yylex();
  cout << "# de lineas = " << num_lineas << ", # de caracteres. = " <<
  num_caracteres << "\n" << endl;
} // fin de main()
