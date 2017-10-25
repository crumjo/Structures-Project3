%{
	#include <stdio.h>
	#include <stdlib.h>
    #include "zoomjoystrong.tab.c"
%}

%option noyywrap

%%

"circle"                { printf("Here\n"); return(CIRCLE); }

%%
