/*****************************************************************
 Bison file that defines the grammer of zoomjoystrong the next
 greatest painting tool for the computer
 
 @author Joshua Crum & Patton Finley
 @version October 2017
 *****************************************************************/
%{
	//includes stdio.h for statements from c langauge
    #include <stdio.h>
	//incudles the zoomjoystrong methods
    #include "zoomjoystrong.h"
	
	/** Name */
    int yylex();
	/** char array to tell people the range of the screen */
    char* msg = "Point out of range. Enter a " + 
		"height within 0 and 768 and a width within 0 and 1024.\n";
	/** function to catch yyerrors and handle them */
    void yyerror(const char *s);
	/** char yytext */
    extern char* yytext;
%}


%start program

//union to define int and float varaibles
%union {
    int d;
    float f;
}
//defines tokens used in zoomjoystrong.h 
%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INT
%token FLOAT

//defines int from the union above
%type<d> INT

%%
//defines the start of the program
program:	        statement_list END END_STATEMENT;
//defines what is valid for input
statement_list:		statement
              |     statement statement_list
              ;

//defines what a statement could be
statement:      INT
         |      FLOAT
         |		point
         |		line
         |		circle
         |		rectangle
         |		set_color
         |      END_STATEMENT
         ;

//defines the point method to be called
point:      POINT INT INT                               {
															//checks to see if its a valid location
															//prints error if it is out of range
                                                            if ($2 > WIDTH || $3 > HEIGHT) {
                                                                printf("%s", msg);
                                                            } else {
																//prints the point
                                                                point($2, $3);
                                                            }
                                                        }
														
//defines the line method to be called
line:       LINE INT INT INT INT                        {
															//checks to see if the line is within range
                                                            if ($2 > WIDTH || $3 > HEIGHT || $4 > WIDTH || $5 > HEIGHT) {
																//prints error message if not in bounds
                                                                printf("%s", msg);
                                                            } else {
																//prints the line 
                                                                line($2, $3, $4, $5);
                                                            }
                                                        }
//defines the circle method to be called
circle:     CIRCLE INT INT INT                          {	//checks to see if the circle is within valid range
                                                            if ($2 > WIDTH || $3 > HEIGHT) {
																//prints error message if not in bound
                                                                printf("%s", msg);
                                                            } else {
																//prints the circle
                                                                circle($2, $3, $4);
                                                            }
                                                        }
//defines the rectangle method to be called
rectangle:  RECTANGLE INT INT INT INT                   {
															//checks to see if the rectangle is within valed range
                                                            if ($2 > WIDTH || $3 > HEIGHT) {
																//prints error message if not in bound
                                                                printf("%s", msg);
                                                            } else {
																//prints the rectangle
                                                                rectangle($2, $3, $4, $5);
                                                            }
                                                        }
//defines the set color method
set_color:  SET_COLOR INT INT INT                       {	//checks if the color is a valid color
                                                            if ($2 > 255 || $3 > 255 || $4 > 255) {
																//prints an error if the color is outside of the color wheel
                                                                printf("Enter a value between 0 and 255.\n");
                                                            } else {
																//changes the color
                                                                set_color($2, $3, $4);
                                                            }
                                                        }

%%

/*****************************************************************
 main method that starts the paint app zoomjoystrong
 
 @param int argc
 @param char** argv
 *****************************************************************/
int main(int argc, char** argv)
{
	//launches zoomjoystrong
	setup();
	return(yyparse());
}

/*****************************************************************
 yyerror that takes in a char location and prints that there was an
 error
 
 @param char const *s char array that is located at x
 *****************************************************************/
void yyerror (char const *s)
{
	fprintf (stderr, "TOKEN: %s\n", yytext);
	fprintf (stderr, "%s\n", s);
}

