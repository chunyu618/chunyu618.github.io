%{
#include<stdio.h>
#include<string.h>

int wordCount = 0;

#define FALSE 1
#define TRUE 2
#define ERROR 100
%}

/* regular expression definition */
WS [ \t]+

true "true"
false "false"

/* because flex will find and match the token with those regex from top to bottom, we can define error token here as 'anything' */
error .

%%

{false} {wordCount++; return FALSE;}
{true} {wordCount++; return TRUE;}
{WS} {}
{error} {printf("[ERROR] Read undefined string %s\n", yytext); exit(1); }

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
