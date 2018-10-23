
#include <iostream>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <stdexcept>

using namespace std;

//Reads the .txt file and copy it in an array of char*
char* readQuijote();
//Shows every valid string in contained in memory
void validString(char*);
//Check wether is ok the readed string and allow to show it by std out
bool isOK(char*);
