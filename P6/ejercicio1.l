%{
#include <iostream>
using namespace std;
%}

%option noyywrap
%%
%%
int main()
{
  yylex();
}
