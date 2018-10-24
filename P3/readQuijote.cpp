#include "headers.hpp"

char* readQuijote()
{
  ifstream f;
  char* text = new char();
  int length;

  f.open("ElQuijote.txt");

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
