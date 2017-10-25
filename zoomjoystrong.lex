%{
	#include <stdio.h>
	#include <stdlib.h>
    #include "zoomjoystrong.tab.c"
%}

%option noyywrap

%%

;          { yylval = atoi(yytext); return END_STATEMENT; }

%%

int main(int argc, char** argv)
{
	yylex();
	return 0;	
}
