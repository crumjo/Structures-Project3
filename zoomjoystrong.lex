%{
	#include <stdio.h>
	#include <stdlib.h>
%}

%option noyywrap

%%

%%

int main(int argc, char** argv)
{
	yylex();
	return 0;	
}
