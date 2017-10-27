%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.tab.c"
	
	int c;
%}

%option noyywrap

%%

end			{ return(END); }

;			{ return(END_STATEMENT); }

point			{ return(POINT); }

line			{ return(LINE); }

circle			{ return(CIRCLE); }

rectangle		{ return(RECTANGLE); }

set_color		{ return(SET_COLOR); }

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
