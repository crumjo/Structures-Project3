%{
    #include <stdio.h>
    int yylex();
    void yyerror(const char *s);
%}

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

program:          START statement_list END;
statement_list:     statement
                |   statement statement_list
                ;
statement:      INT     { printf("Here is an INT."); }

%%

int main(int argc, char** argv)
{
    yyparse();
    return 0;
}

void yyerror (char const *s) {
    fprintf (stderr, "%s\n", s);
}
