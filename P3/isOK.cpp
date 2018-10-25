#include "headers.hpp"

bool isOK(char* word)
{
  bool ok = true;
  int i = 0, counterA = 0, counterD = 0, counterL = 0;

  while(word[i] != '\0' && ok)
  {
    if(word[i] == 'a' || word[i] == 'A' || word[i] == 'd' || word[i] == 'D' ||
    word[i] == 'l' || word[i] == 'L' || word[i] == 'h' || word[i] == 'H' ||
    word[i] == 'i' || word[i] == 'I' || word[i] == 'g' || word[i] == 'G' ||
    word[i] == 'o' || word[i] == 'O')
    {
      if(word[i] == 'a' || word[i] == 'A')
        ++counterA;
      else
      {
        if(word[i] == 'D' || word[i] == 'd')
          ++counterD;
        else if(word[i] == 'L' || word[i] == 'l')
          ++counterL;
      }
    }
    else
      ok = false;

    if(counterA > 2 || counterD > 1 || counterL > 1)
      ok = false;

    ++i;
  }
  return ok;
}
