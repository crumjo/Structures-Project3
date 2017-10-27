%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.tab.h"
	
	int c;
%}

%option noyywrap

%%

end			    { return(END); }

;			    { return(END_STATEMENT); }

point			{ return(POINT); }

line			{ return(LINE); }

circle			{ return(CIRCLE); }

rectangle		{ return(RECTANGLE); }

set_color		{ return(SET_COLOR); }

[0-9]+			{
				    yylval.d = atoi(yytext);
				    return(INT);
			    }

[0-9]*\.[0-9]+	{
				    c = yytext[0]; 
                    yylval.d = c - '0';
                    return(FLOAT);	
                }
                
[ \t ]          ;
\n		;

%%
