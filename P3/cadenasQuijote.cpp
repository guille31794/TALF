/*
  Program that implemets a finite automate that accepts a text like entry
  parameter and show by screen every single valid string from the text, that is
  accepted by the utomate.
  To be valid, a word has to contain maximum 2 A's, 1 D and 1 L, and can contain
  whatever other number of H's, I's, G's or O's, in whatever order precised.
*/

#include "headers.hpp"

int main()
{
  char* text = readQuijote();
  validString(text);
  return 0;
}
