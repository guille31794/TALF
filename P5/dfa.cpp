/**
* Software that implements dfa permorfed in practice 5
*/

#include <iostream>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <stdexcept>

using namespace std;

//Reads the .txt file and copy it in an array of char*
char* readStrings()
{
  ifstream f;
  char* text = new char();
  int length;

  f.open("test.txt");

  // Calculate length of file (input stream)
  if(f)
  {
    f.seekg(0, f.end);
    length = f.tellg();
    f.seekg(0, f.beg);
    //Copy the text file into a string
    f.read(text, length);
  } else
    throw runtime_error("Can't read the file");

  f.close();
  return text;
}

//Check wether is ok the readed string and allow to show it by std out
bool isOK(char* word)
{
  bool ok = true;
  int i = 0, counter0 = 0, counter1 = 0;

  while(word[i] != '\0' && ok)
  {
    if(word[i] == '0' || word[i] == '1')
    {
      if(i < strlen(word))
      {
        if(word[i] == '0')
        {
          counter1 = 0;
          ++counter0;
          if(word[i+1] != word[i] && counter0 < 2)
            ok = false;
          else if(counter0 > 2)
            ok = false;
        }
        else
        {
          counter0 = 0;
          ++counter1;
          if(word[i+1] == word[i] && counter1 >= 2)
            ok = false;
        }
      }
    }

    ++i;
  }

  return ok;
}

//Shows every valid string contained in memory
void validString(char* text)
{
  char* compareString;

  compareString = strtok(text, " \n\t\r\0");
  while (compareString != NULL)
  {
    if(isOK(compareString))
      cout << compareString << endl;
    compareString = strtok(NULL, " \n\t\r\0");
  }
}


int main(int argc, char const *argv[])
{
  char* text = readStrings();
  validString(text);
  return 0;
}
