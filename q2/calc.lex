%{
/**** The beginnings of a calculator. ****/
#include <stdlib.h>
#include <stdio.h>
struct tokenInfo
{
  char *name;
  double  value;
  int lineNumber;
};
typedef struct tokenInfo tokenInfo;
struct tokenInfo2
{
  tokenInfo ti;
};  
struct tokenInfo2 yylval;
%}

%%

[a-zA-Z_][a-zA-Z0-9_\-]*   {
	   yylval.ti.value = 0;
	   yylval.ti.name =  (char *) strdup(yytext);
	   printf("VARIABLE: %s LINES: %d\n", yylval.ti.name, yylval.ti.lineNumber);
        }

[0-9]+  {  
           yylval.ti.value = atoi(yytext);
	   yylval.ti.name = NULL;
           printf("INTEGER: %0.0f\n", yylval.ti.value);
        }

:=    printf("ASSIGNMENT\n");
\+     printf("PLUS\n");
\-     printf("MINUS\n");
\*     printf("MULTIPLY\n");
\/     printf("DIVIDE\n");

\n      {
           printf("NEWLINE\n");
           yylval.ti.lineNumber += 1;
        }

[ \t]   ;

.       {
        printf("Invalid character\n");
        exit(1);
        }

%%

int yywrap() {
 return 1;
}

int main(int argc, char **argv ) {
  ++argv, --argc;  /* skip over program name */
  if ( argc > 0 )
    yyin = fopen( argv[0], "r" );
  else
    yyin = stdin;
  
  yylex();
}
