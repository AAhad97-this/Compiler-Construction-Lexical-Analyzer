%{
#include <stdio.h>

%}

Digit [0-9]
Alphabets [a-zA-Z]

%%

"+"|"-"|"*"|"/" {return(ArithmaticOperator);}

{Digit}+ {return(INT);}   

{Digit}+"."{Digit}* {return(FLOAT);}  

"class"|"public"|"private"|"static"|"new"|"void"|"int"|"if"|"else"|"while"|"do"|"break"|"continue"|"double"|"float"|"return"|"for"|"main" {return(keyword);}

"int"|"float"|"char"|"string" {return(type);}

"true"|"false"  {return(boolean);}

[a-zA-Z][a-zA-Z0-9"_"]* {return(ID);}

\".*\" {return(String);}

"<="|">="|"++"|"!="|"=="|"<"|">"|"--"|"&&"|"||" {return(RelationalOperator);}

"="  {return(AssignmentOperator);}

#|@|$|^|%|^|& {return(SpecialCharacters);}

";" {return(semi);}

"//"  {return(SingleLineCommments);}

.   {return(Unrecognized);}

%%

