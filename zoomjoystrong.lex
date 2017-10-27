%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.tab.c"
	
	int c;
%}

%option noyywrap

%%

END			{
				c = yytext[0]; 
                                yylval.a = c - '0';
                                return(END);
			}

;			{
				c = yytext[0];
				return(END_STATEMENT);
			}

POINT			{ 
				c = yytext[0];
				return(POINT);
			}

LINE			{
				c = yytext[0];
				return(LINE);
			}

CIRCLE			{
				c = yytext[0];
				return(CIRCLE);
			}

RECTANGLE		{
				c = yytext[0];  
                                return(RECTANGLE);
			}

SET_COLOR		{
				c = yytext[0];  
                                return(SET_COLOR);
			}

[0-9]			{
				c = yytext[0];
				yylval.a = c - '0';
				return(INT);
			}

[0-9]*\.[0-9]+		{
				c = yytext[0]; 
                                yylval.a = c - '0';
                                return(FLOAT);	
			}
%%
