/*
  Programa que implementa un automata celular finito que acepta cadenas de
  entrada y las saca por pantalla sin son validas.
  Para que sean validas tienen que cumplir que lleven H, I, D (1 sola maximo),
  L (1 sola maximo), A (2 maximo), G, O
*/

#include "headers.hpp"

int main()
{
  char* text = readQuijote();
  validString(text);
  return 0;
}
