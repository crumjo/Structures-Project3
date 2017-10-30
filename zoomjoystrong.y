/*****************************************************************
 Bison file that defines the grammer of zoomjoystrong the next
 greatest painting tool for the computer.
 
 @author Joshua Crum & Patton Finley
 @version 30 October 2017
 *****************************************************************/
%{
    #include <stdio.h>
    #include "zoomjoystrong.h"
	
    int yylex();
    
	/** String to tell people the range of the screen */
    char* msg = "Out of range. Enter a y within 0 "
    "and 768 and an x within 0 and 1024.\n";
        
	/** Function to catch yyerrors and handle them. */
    void yyerror(const char *s);
    
    void draw_point(int x, int y);
    void draw_line(int x1, int y1, int x2, int y2);
    void draw_circle(int x, int y, int r);
    void draw_rectangle(int x, int y, int w, int h);
    void set_draw_color(int r, int g, int b);
    void end_draw();
    
	/** char yytext */
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

program:	        statement_list end;

statement_list:		statement
              |     statement statement_list
              ;

statement:      point;
         |      line;
         |      circle;
         |      rectangle;
         |      set_color;
         ;

point:      POINT INT INT END_STATEMENT                 { draw_point($2, $3); }
														
line:       LINE INT INT INT INT END_STATEMENT          { draw_line($2, $3, $4, $5); }

circle:     CIRCLE INT INT INT END_STATEMENT            { draw_circle($2, $3, $4); }

rectangle:  RECTANGLE INT INT INT INT END_STATEMENT     { draw_rectangle($2, $3, $4, $5); }

set_color:  SET_COLOR INT INT INT END_STATEMENT         { set_draw_color($2, $3, $4); }

end:    END END_STATEMENT                               { end_draw(); }

%%

/*****************************************************************
 Main method that starts the paint app zoomjoystrong.
 
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
 error.
 
 @param char const *s char array that is located at x
 *****************************************************************/
void yyerror (char const *s)
{
	fprintf (stderr, "TOKEN: %s\n", yytext);
	fprintf (stderr, "%s\n", s);
}


/*****************************************************************
 
 @param
 *****************************************************************/
void draw_point(int x, int y)
{
    //checks to see if its a valid location
    //prints error if it is out of range
    if (x > WIDTH || y > HEIGHT) {
        printf("%s", msg);
    } else {
        //prints the point
        point(x, y);
    }

}


/*****************************************************************
 
 *****************************************************************/
void draw_line(int x1, int y1, int x2, int y2)
{
    //checks to see if the line is within range
    if (x1 > WIDTH || y1 > HEIGHT || x2 > WIDTH ||
    y2 > HEIGHT) {
        //prints error message if not in bounds
        printf("%s", msg);
    } else {
        //prints the line
        line(x1, y1, x2, y2);
    }

}


/*****************************************************************
 
 *****************************************************************/
void draw_circle(int x, int y, int r)
{
    //checks to see if the circle is within valid range
    if (x > WIDTH || y > HEIGHT) {
        //prints error message if not in bound
        printf("%s", msg);
    } else {
        //prints the circle
        circle(x, y, r);
    }
}


/*****************************************************************
 
 *****************************************************************/
void draw_rectangle(int x, int y, int w, int h)
{
    //checks to see if the rectangle is within valed range
    if (x > WIDTH || y > HEIGHT) {
        //prints error message if not in bound
        printf("%s", msg);
    } else {
        //prints the rectangle
        rectangle(x, y, w, h);
    }
}


/*****************************************************************
 
 *****************************************************************/
void set_draw_color(int r, int g, int b)
{
    //checks if the color is a valid color
    if (r > 255 || g > 255 || b > 255) {
        //prints an error if the color is outside of the rgb range
        printf("Enter a value between 0 and 255.\n");
    } else {
        //changes the color
        set_color(r, g, b);
    }
}


/*****************************************************************
 
 *****************************************************************/
void end_draw()
{
    finish();
    exit(0);
}

