%{
	#include <stdio.h>
	#include <stdlib.h>

%}

%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INT
%token FLOAT
%token END

%option noyywrap

%%

%%

int main(int argc, char** argv)
{
	yylex();
	return 0;	
}
