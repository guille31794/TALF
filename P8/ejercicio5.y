%{
  #include <iostream>
  #include <string>
  #include <map>
  using namespace std;
  map<string,int> variables;
  int yyerror(const char* msj);
  int yylex(void);
%}
%error-verbose
%union{
	string* nombre;
	int entero;
}
%token <nombre> IDENTIFICADOR <entero> CONSTENTERA
%token OPAS NL
%type <entero> expresion termino
%start instrucciones
%%
instrucciones : instrucciones instruccion {cout <<
  "instrucciones -> instrucciones instruccion\n"}
  |instruccion {cout << "instrucciones -> instruccion\n"}
  ;
instruccion : IDENTIFICADOR OPAS expresion NL {cout <<
	"instruccion -> IDENTIFICADOR(" << *$1 << ") := expresion(" << $3 <<
	") NL\n"; variables[*$1]=$3}
	;
expresion : termino {cout << "expresion -> termino(" << $1 << ")\n"; $$=$1}
	  	|expresion '+' termino {cout << "expresion -> expresion(" << $1 <<
		") + termino(" << $3 << ")\n"; $$ = $1+$3;}
		|expresion '-' termino {cout << "expresion -> expresion(" << $1 <<
		") - termino(" << $3 << ")\n"; $$ = $1+$3;}
		|expresion '*' termino {cout << "expresion -> expresion(" << $1 <<
		") * termino(" << $3 << ")\n"; $$ = $1*$3;}
		|expresion '/' termino {cout << "expresion -> expresion(" << $1 <<
		") / termino(" << $3 << ")\n"; $$ = $1*$3;}
		;
termino : IDENTIFICADOR {cout << "termino -> IDENTIFICADOR(" << *$1 << "\n";
$$ = variables[*$1];}
	|CONSTENTERA {cout << "termino -> CONSTENTERA\n"; $$ = $1;}
	|'(' expresion ')' {cout << "termino -> ( expresion(" << $2 << ") )\n";
	$$ = $2;}
	;
%%
int main()
{
	cout << "Teclee las expresiones\n";
	yyparse();
	cout << "Fin del programa\n";
	return EXIT_SUCCESS;
}

int yyerror(const char* msj)	{cerr << msj << endl; return 1;}
