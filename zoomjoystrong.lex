/*****************************************************************
flex file that defines the tokens 
 
 @author Joshua Crum & Patton Finley
 @version October 2017
 *****************************************************************/

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.tab.h"
	
	int c;
%}

// handles yywrap issues
%option noyywrap

%%

//defines the token that ends the program
end			    { return(END); }

//defines the token that ends the statement
;			    { return(END_STATEMENT); }

//defines the token that is used to draw a point
point			{ return(POINT); }

//defines the token that is used to draw a line
line			{ return(LINE); }

//defines the token that is used to draw a cirdle
circle			{ return(CIRCLE); }

//defines the token that is used to draw a rectangle
rectangle		{ return(RECTANGLE); }

//defines the token that is used to change the color
set_color		{ return(SET_COLOR); }

//defines that the int has to be 0-9 and can be longer then one digit long
[0-9]+			{
				    yylval.d = atoi(yytext);
				    return(INT);
			    }
//defines that the float can be as longer then one digit and 0 through 9
[0-9]*\.[0-9]+	{
				    c = yytext[0]; 
                    yylval.d = c - '0';
                    return(FLOAT);	
                }


[ \t ]          ;
\n		        ;
.               ;

%%
