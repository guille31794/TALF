%{
  #include <iostream>
  #include <map>
  #include <string>
  #include <cstring>
  using namespace std;
  map<string,int> tabla;
%}

%option noyywrap
letra [a-zA-Z]|"á"|"é"|"í"|"ó"|"ú"|"Á"|"É"|"Í"|"Ó"|"Ú"|"ñ"|"Ñ"|"Ü"
%%
[\n\t\r]+   ;
{letra}+    {
              string s = yytext;
              transform(s.begin(), s.end(), s.begin(), ::tolower);
              tabla[s]++;
            }
.           {}
%%
int main()
{
  yylex();
  for(map<string,int>::iterator i = tabla.begin(); i != tabla.end(); ++i)
  {
    cout << i->first << " = " << i->second << endl;
  }
}
