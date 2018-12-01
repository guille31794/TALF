  /*
    Correct commands to compile without warnings:
    flex ejercicio4.l
    g++ -x c++ -Wc++11-extensions lex.yy.c
  */
%{
  #include <iostream>
  #include <string>
  #include <cstring>
  #include <map>
  #include <vector>
  #include <utility>
  using namespace std;
  map<string, vector<int> > table;
  int lineNumber = 1;
%}
%option noyywrap
reserved "int"|"float"|"double"|"char"|"for"|"while"|"if"|"else"|"return"|"const"
identifier [a-zA-Z][a-zA-Z0-9]+
sharp "#"[a-z]+
bar "-"[a-zA-Z][a-zA-Z]*
function "("
%x comment
%%
\n ++lineNumber;
"//".+[^\n] //Line comment filter
[ \t\r]* //Blank spaces filter
"/*" BEGIN(comment);
<comment>[^*\n]*
<comment>"*"+[^*/\n]
<comment>\n ++lineNumber;
<comment>"*/" BEGIN(0);
.
{bar}
{sharp}
{reserved} {
      string s = yytext;
      map<string,vector<int> >::iterator it = table.find(s);
      if( it != table.end())
        it->second.push_back(lineNumber);
      else
        table.insert(make_pair(s, vector<int>(1, lineNumber)));
    }

"#define"|"const""int"|"float"{identifier} {
            string s = yytext;
            map<string,vector<int> >::iterator it = table.find(s);
            if( it != table.end())
              it->second.push_back(lineNumber);
            else
              table.insert(make_pair(s, vector<int>(1, lineNumber)));
        }

%%
int main()
{
  yylex();
  for(map<string,vector<int> >::iterator i = table.begin(); i != table.end();
  ++i)
  {
    cout << i->first << " ";
    for(vector<int>::iterator it = i->second.begin(); it != i->second.end();
    ++it)
      cout << *it << " ";
    cout << endl;
  }
  return 0;
}
