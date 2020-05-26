#CC 103411: MINI JAVA#

###PROJECT MEMBERS###
StdID | Name
------------ | -------------
**61265** | **Abdul Ahad Nasir** 
61552 | Faizan Khan

## Project Description ##
It is a Mini java compiler,it contain lex file which define its token,after this yacc will parse it from left to right. 

##Sample Language Used ##
package grammar;
import java.io.*;
%%
%{
static String capitalize( String s ) {
return Character.toUpperCase( s.charAt( 0 ) ) + s.substring( 1 );
}
%}

###Lexical Specification###
- Keywords: abstract , continue , for , new, switch , assert 
           if ,boolean , do , goto , private , this.
- Identifiers (x, y, average, etc.)
- Reserved or keywords (if, else, while, etc.)
- Integer constants (42, 0xFF, 0177 etc.)
- Floating point constants (5.6, 3.6e8, etc.)
- String constants ("hello there\n", etc.)
- Character constants ('a', 'b', etc.)
- Special symbols (( ) : := + - etc.)

###Grammar###
Goal::=MainClass ( ClassDeclaration )* <EOF>
MainClass::="class" Identifier "{" "public" "static" "void" "main" "(" "String" "[" "]" Identifier ")" "{" 
Statement "}" "}"
ClassDeclaration ::="class" Identifier ( "extends" Identifier )? "{" ( VarDeclaration )* ( MethodDeclaration )* 
"}"
VarDeclaration::=Type Identifier ";"
MethodDeclaration::="public" Type Identifier "(" ( Type Identifier ( "," Type Identifier )* )? ")" "{" ( 
VarDeclaration )* ( Statement )* "return" Expression ";" "}"
Type::="int" "[" "]"
|"boolean"
|"int"
|Identifier
Statement::="{" ( Statement )* "}"
|"if" "(" Expression ")" Statement "else" Statement
|"while" "(" Expression ")" Statement
|"System.out.println" "(" Expression ")" ";"
|Identifier "=" Expression ";"
|Identifier "[" Expression "]" "=" Expression ";"
Expression::=Expression ( "&&" | "<" | "+" | "-" | "*" ) Expression
|Expression "[" Expression "]"
|Expression "." "length"
|Expression "." Identifier "(" ( Expression ( "," Expression )* )? ")"
|<INTEGER_LITERAL>
|"true"
|"false"
|Identifier
|"this"
|"new" "int" "[" Expression "]"
|"new" Identifier "(" ")"
|"!" Expression
|"(" Expression ")"



##Problems Faced##
While reserching found older version of Yacc and lex, which gives some errors while compiling.

###Problem 1: Precedence in lex ###
The precendence of token was not as per defined rules so it accepts different token in different class. We rearrange them and then it works perfect.

###Problem 2:version differnce###
Code we found was in different version, so it gives warnings and errors.Errors are removed but some warnings are there which are not a big deal.

##References##
- https://github.com/MarcosSpessatto/Lexical-Analyzer-Java/tree/master/src/lexical_analyzer
- www.javatpoint.com
- www.jflex.de
- www.javaworld.com
