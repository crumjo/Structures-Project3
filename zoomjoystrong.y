%{
    #include <stdio.h>
    #include "zoomjoystrong.h"
    int yylex();
    char* msg = "Point out of range. Enter a height within 0 and 768 and a width within 0 and 1024.\n";
    void yyerror(const char *s);
    extern char* yytext;
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

point:      POINT INT INT END_STATEMENT                 {
                                                            if ($2 > WIDTH || $3 > HEIGHT) {
                                                                printf("%s", msg);
                                                            } else {
                                                                point($2, $3);
                                                            }
                                                        }

line:       LINE INT INT INT INT END_STATEMENT          {
                                                            if ($2 > WIDTH || $3 > HEIGHT || $4 > WIDTH || $5 > HEIGHT) {
                                                                printf("%s", msg);
                                                            } else {
                                                                line($2, $3, $4, $5);
                                                            }
                                                        }

circle:     CIRCLE INT INT INT END_STATEMENT            {
                                                            if ($2 > WIDTH || $3 > HEIGHT) {
                                                                printf("%s", msg);
                                                            } else {
                                                                circle($2, $3, $4);
                                                            }
                                                        }

rectangle:  RECTANGLE INT INT INT INT END_STATEMENT     {
                                                            if ($2 > WIDTH || $3 > HEIGHT) {
                                                                printf("%s", msg);
                                                            } else {
                                                                rectangle($2, $3, $4, $5);
                                                            }
                                                        }

set_color:  SET_COLOR INT INT INT END_STATEMENT         {
                                                            if ($2 > 255 || $3 > 255 || $4 > 255) {
                                                                printf("Enter a value between 0 and 255.\n");
                                                            } else {
                                                                set_color($2, $3, $4);
                                                            }
                                                        }

%%

int main(int argc, char** argv)
{
	setup();
	return(yyparse());
}

void yyerror (char const *s)
{
	fprintf (stderr, "TOKEN: %s\n", yytext);
	fprintf (stderr, "%s\n", s);
}

