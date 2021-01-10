<style>
    body{
    	font-size: 15pt;
    }
    h2{
        font-size: 28pt;
        font-weight: bold;
    }
    h3{
        font-size: 24pt;
        font-weight: bold;
    }
</style>

## Lexer --using flex to build a scanner

### Format

```c
declarations
%%
translation rules
%%
auxiliary procedures
```

#### declaration

```
%{
/* include libraries */
#include<stdio.h>
#include<string.h>

/* define and initialize variables */
int wordCount = 0;

/* definition of functions */
void     insertID();
void 	 printSymTab();

/* associate tokens with some integer to distinguish tokens by the associated number */
/* start the number from 1 */
#define TRUE 1
#define FALSE 2
#define ERROR 100
%}

/* define regular expression of tokens */
letter [A-Za-z]
digit [0-9]
WS [ \t]+

true "true"
false "false"

/* because flex will find and match the token with those regex from top to bottom, we can define error token here as 'anything' */
error .
%%
```

#### translation rules

```c
%%
/* action when matching a token */
{true} {wordCount++; return TRUE;}
{false} {wordCount++; return FALSE;}
{WS} {/* do nothing */}
{error} {printf("[ERROR] Read undefined string %s\n", yytext); exit(1);}
%%
```

#### auxiliary procedures

```c
int main(int argc, char **argv){
    argc--; 
    argv++;
    if (argc > 0)
        yyin = fopen(argv[0], "r");
    else
        yyin = stdin;
    while(yylex() > 0){
        printf("word count %d is %s\n", wordCount, yytext);
    }
}

int yywrap(){
    return 1;
}
```

### Some Useful Lex Variables

- yyin

    Input file for scanner, `stdin` if not specified.

- yyout

    Output file for scanner, `stdout` if not specified.

- yytext

    matching token. It will change every time when scanner matchs next token.

- yyleng

    length of the matched token.

- yylineno

    line number.

### Some Useful Lex Functions
- yylex()
    
    Try to match next token, and store the result in `yytext`

- yywrap()

    It will be called when scanner reaches EOF. If the return value of yywrap() is 1, scanner will stop. It can be used to parse multiple files and return 1 when reaching EOF of last file.

- yyless(int n)

    Send yytext[n:-1] back to file.

### Compiler and Execute

Suppose we have a scanner file `lexer.l`
```shell
flex lexer.l
gcc lex.yy.c -o lexer
./lexer inputFile
```

### Source Code

[lexel.l](https://github.com/chunyu618/chunyu618.github.io/blob/main/note/tools/compiler/lexer/lexer.l)

### Reference

[編譯原理-如何使用flex和yacc工具構造一個高級計算器](https://www.itread01.com/content/1496987892.html)
