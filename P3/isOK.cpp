#include "headers.hpp"

bool isOK(char* word)
{
  bool ok = true;
  int i = 0, counterA = 0, counterD = 0, counterL = 0;
  string toCompare = "hidalgoHIDALGO";


  int pos = toCompare.find(word);

  if(pos != toCompare.npos)
    while(word[i] != '\0' && ok)
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
      if(counterA > 2 || counterD > 1 || counterL > 1)
        ok = false;
      ++i;
      }
  else
    ok = false;

  return ok;
}
