%{
    #include <stdio.h>
    int yylex();
    void yyerror(const char *s);
%}

%union { int a; }

%token START
%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INT
%token FLOAT

%%

program:		START statement_list END;
statement_list:		statement
	      |		statement statement_list
	      ;

statement:		INT;
         |		POINT
         |		LINE
         |		CIRCLE
         |		RECTANGLE
         |		SET_COLOR
         |		FLOAT
         ;

%%

int main(int argc, char** argv)
{
	return(yyparse());
}

void yyerror (char const *s)
{
	fprintf (stderr, "%s\n", s);
}
