%{
	#include <iostream>
	#include <map>
	#include <string>
	#include <vector>
#define DEBUG
	using namespace std;

	map<string, vector<int>> tabla;
	map<string, vector<int>> tabla1;

	bool debug = true;
	bool comentario = false;
	int numLinea = 1;
%}

%option noyywrap

letra	[a-zA-Z]
numero [0-9]
var [a-zA-Z][a-zA-Z0-9]+

%%

"//".*."\n"	{
			numLinea++;
			if(debug)
				cout << "Comentario // " << yytext;
		}

"/\*"	{
			comentario = true;
			if(debug)
				cout << "Comentario /*-*/ " << yytext;
		}

"\*/"	{
			comentario = false;
			if(debug)
				cout << yytext << endl;
		}

[ \t\r]+	;

int|float|char|for|while|if|else|return	{	
				if(!comentario)
					tabla[string(yytext)].push_back(numLinea);
				else
					if(debug)
						cout << yytext;
				#ifdef DEBUG
					cout << "anotada palabra (" << yytext << ")\n";
				#endif
			}

{var}	{
							if(!comentario)
								tabla1[string(yytext)].push_back(numLinea);
							else
								if(debug)
									cout << yytext;
							#ifdef DEBUG
								cout << "anotada var (" << yytext << ")\n";
							#endif
						}
"\n"	numLinea++;
.			{
				if(debug && comentario)
				cout << yytext;
				#ifdef DEBUG
					cout << "filtrado caracter (" << yytext << ")\n";
				#endif
			}

%%

int main() {
	yylex();
	cout << "-------------\nEstadisticas del archivo de entrada\n-----------\n";
	cout << "-------------\nPalabras reservadas\n-----------\n";
	for(map<string,vector<int> >::iterator i = tabla.begin(); i != tabla.end(); i++) {
		cout << i->first << " = ";
		for(vector<int>::iterator j = (i->second).begin(); j != (i->second).end(); j++)
			cout << (*j) << " ";
		cout << endl;
	}
	cout << "-------------\nVariables\n-----------\n";
	for(map<string,vector<int> >::iterator i = tabla1.begin(); i != tabla1.end(); i++) {
		cout << i->first << " = ";
		for(vector<int>::iterator j = (i->second).begin(); j != (i->second).end(); j++)
			cout << (*j) << " ";
		cout << endl;
	}
	cout << "-----------\nFin de las Estadisticas del archivo de entrada\n-----------\n";
}
