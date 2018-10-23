#include "headers.hpp"

void validString(char* text)
{
  char* compareString;

  compareString = strtok(text, " ,.-_\"\'\n\t\r\0");
  while (compareString != NULL)
  {
    if(isOK(compareString))
      cout << compareString << endl;
    compareString = strtok(NULL, " ,.-_\"\'\n\t\r\0");
  }
}
