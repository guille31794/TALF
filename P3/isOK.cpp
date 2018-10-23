#include "headers.hpp"

bool isOK(char* word)
{
  bool ok = true;
  int i = 0, counterA = 0, counterD = 0, counterL = 0;
  string toCompare = "hidalgoHIDALGO";

  while(word[i] != '\0' && ok)
  {
    int pos = toCompare.find(word[i]);

    if(pos != toCompare.npos)
      if(word[i] == 'a' || word[i] == 'A')
        ++counterA;
      else if(word[i] == 'D' || word[i] == 'd')
        ++counterD;
      else if(word[i] == 'L' || word[i] == 'l')
      ++counterL;
    else
      ok = false;

    if(counterA > 2 || counterD > 1 || counterL > 1)
      ok = false;

    ++i;
  }
  return ok;
}
