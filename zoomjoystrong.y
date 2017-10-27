%{
    #include <stdio.h>
    #include "zoomjoystrong.h"
    int yylex();
    void yyerror(const char *s);
%}

%start program

%union {
    int d;
    float f;
}

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INT
%token FLOAT

%type<d> INT

%%

program:	        statement_list END END_STATEMENT;
statement_list:		statement
              |     statement statement_list
              ;

statement:      INT
         |      FLOAT
         |		point
         |		line
         |		circle
         |		rectangle
         |		set_color
         |      END_STATEMENT
         ;

point:      POINT INT INT END_STATEMENT                { point($2, $3); }

line:       LINE INT INT INT INT END_STATEMENT         { line($2, $3, $4, $5); }

circle:     CIRCLE INT INT INT END_STATEMENT           { circle($2, $3, $4); }

rectangle:  RECTANGLE INT INT INT INT END_STATEMENT    { rectangle($2, $3, $4, $5); }

set_color:  SET_COLOR INT INT INT END_STATEMENT        { set_color($2, $3, $4); }

%%

int main(int argc, char** argv)
{
	return(yyparse());
}

void yyerror (char const *s)
{
	fprintf (stderr, "%s\n", s);
}
