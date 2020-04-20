%{
#include <stdio.h>

%}

Digit [0-9]
Alphabets [a-zA-Z]

%%

"+"|"-"|"*"|"/" printf("Arithmatic Operator: %s\n",yytext);

{Digit}+ printf("integer: %s\n",yytext);   

{Digit}+"."{Digit}* printf("Float: %s\n",yytext);  

"class"|"public"|"private"|"static"|"new"|"void"|"int"|"if"|"else"|"while"|"do"|"break"|"continue"|"double"|"float"|"return"|"for"|"main" printf("Keyword: %s\n",yytext);

"true"|"false"  printf("bool: %s\n",yytext);

[a-zA-Z][a-zA-Z0-9"_"]* printf("an Identifier: %s\n",yytext);

\".\" printf("an String: %s\n",yytext);

"<="|">="|"++"|"!="|"=="|"<"|">"|"--"|"&&"|"||" printf("RelationalOperator: %s\n",yytext);

"="  printf("AssignmentOperator: %s\n",yytext);

"("|")"|"{"|"}"|"["|"]"|","|"."|"..."|"@" printf("Delimeter: %s\n",yytext);

#|@|$|^|%|^|& printf("Special Characters: %s\n",yytext);

";" printf("Semicol: %s\n",yytext);

"//"  printf("Single line comment %s\n",yytext);

.   printf("Unrecognized %s\n",yytext);

%%

