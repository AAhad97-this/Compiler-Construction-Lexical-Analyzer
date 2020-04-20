# Compiler-Construction-Lexical-Analyzer
Constructing it with javascript
         SAMPLE EXAMPLE 1:
• class IfStatement {
• public static void main(String[] args) {
• int number = 10;
• if (number > 0) {
• System.out.println("Number is positive.");
• } • System.out.println("This statement is always executed.");
• } }
“code for sum”
      SAMPLE EXAMPLE 2:
• public class Pattern {
• public static void main(String[] args) {
• int rows = 5;
• for(int i = 1; i <= rows; ++i) {
• for(int j = 1; j <= i; ++j) {
• System.out.print("* ");
• } • System.out.println();
• } • } • }
“Code for 
pattern 
print”
      LEXICAL SPECIFICATION
• Keywords: abstract , continue , for , new, switch , assert 
if ,boolean , do , goto , private , this.
• Identifiers (x, y, average, etc.)
• Reserved or keywords (if, else, while, etc.)
• Integer constants (42, 0xFF, 0177 etc.)
• Floating point constants (5.6, 3.6e8, etc.)
• String constants ("hello there\n", etc.)
• Character constants ('a', 'b', etc.)
• Special symbols (( ) : := + - etc.)
       EXAMPLE 1
package grammar;
import java.io.*;
%%
%{
static String capitalize( String s ) {
return Character.toUpperCase( s.charAt( 0 ) ) + s.substring( 1 );
}
%}
      EXAMPLE 2
package grammar;
import java.io.*;
import java_cup.runtime.*;
%%
%public
%type Symbol
%char
%{
public Symbol token( int tokenType ) {
System.err.println( "Obtain token " + sym.terminal_name( tokenType )
+ " \"" + yytext() + "\"" );
return new Symbol( tokenType, yychar,
yychar + yytext().length(), yytext() );
}
%}
        CONTEXT FREE GRAMMAR(CFG)
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
• Identifier::=Letters[Letters+Digits]
• Digits::=[0-9]
• Letters::=[a-z|A-Z]
