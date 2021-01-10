%{
#include<stdio.h>
#include<string.h>

int wordCount = 0;

#define FALSE 1
#define TRUE 2
%}

/* regular expression definition */
true "true"
false "false"

%%

{false} {wordCount++; return FALSE;}
{true} {wordCount++; return TRUE;}

%%

int main(int argc, char **argv){
    argc--; 
    argv++;
    if (argc > 0)
        yyin = fopen(argv[0], "r");
    else
        yyin = stdin;
    while(yylex() > 0){
        printf("word count %d is %s\n", wordCount, yytext);
        yyless(0);
        //printf("\n");
    }
}

int yywrap(){
    return 1;
}
