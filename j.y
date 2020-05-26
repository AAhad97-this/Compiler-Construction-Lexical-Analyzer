%{
#include <stdio.h>
#include <stdlib.h>


%}
%start program
%token INT FLOAT ArithmaticOperator RelationalOperator keyword boolean String ID AssignmentOperator semi  SpecialCharacters SingleLineCommments Unrecognized type




%%
program : Goal {printf("valid program ");};

Goal:MainClass '('class ')' semi 
|class
|VarDeclaration
|MethodDeclaration
|Statement
|Expression
;
MainClass:class  ID '{' 'public' 'static' 'void' 'main' '(' 'String' "[]" ID ')' '{' 
Statement '}' '}' ;

class:'class' ID '(' "extends" ID ")?" '{' '(' VarDeclaration ")* (" MethodDeclaration ")*" 
'}';

VarDeclaration:type ID semi
 ;

MethodDeclaration:"public" type ID '(' '(' type ID '('',' type ID ")*" ")?" ')' '{' '(' 
VarDeclaration ")* (" Statement ")*" "return" Expression semi "}" ;


Statement:'{' '(' Statement ')*' '}'
|"if" '(' Expression ')' Statement "else" Statement
|"while" '(' Expression ')' Statement
|"System.out.println" '(' Expression ')' semi
|ID AssignmentOperator Expression semi
|ID '[' Expression ']' AssignmentOperator Expression semi
;

Expression: Expression ArithmaticOperator   Expression
| Expression RelationalOperator  Expression
|Expression "[" Expression "]"
|Expression "." "length"
|Expression "." ID "(" "(" Expression "(" "," Expression ")*" ")?" ")"
|INT
|boolean
|ID
|FLOAT
|"this"
|"new" "int" '[' Expression ']'
|"new" ID '(' ')'
|'!' Expression
|'(' Expression ')'
;

%%
#include"lex.yy.c"

int main(int argc, char *argv[])
{
	
	
   if(!yyparse())
		printf("complete\n");
	else
		printf("failed\n");
    return 0;
}
         
yyerror(char *s) {
	printf("%d : %s %s\n", yylineno, s, yytext );
}         
