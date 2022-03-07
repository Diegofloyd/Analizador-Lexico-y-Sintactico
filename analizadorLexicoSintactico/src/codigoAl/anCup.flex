package codigoAl;
import java_cup.runtime.*;
%%
%class anCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r, \n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }

    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
main {return new Symbol(sym.Main, yychar, yyline, yytext());}
int {return new Symbol(sym.Int, yychar, yyline, yytext());}
if {return new Symbol(sym.If, yychar, yyline, yytext());}
else {return new Symbol(sym.Else, yychar, yyline, yytext());}
for {return new Symbol(sym.For, yychar, yyline, yytext());}
do {return new Symbol(sym.Do, yychar, yyline, yytext());}
null {return new Symbol(sym.Null, yychar, yyline, yytext());}
while {return new Symbol(sym.While, yychar, yyline, yytext());}

"(" {return new Symbol(sym.parentesisIzquierdo, yychar, yyline, yytext());}
")" {return new Symbol(sym.parentesisDerecho, yychar, yyline, yytext());}
"," {return new Symbol(sym.coma, yychar, yyline, yytext());}
"." {return new Symbol(sym.punto, yychar, yyline, yytext());}
";" {return new Symbol(sym.puntoyComa, yychar, yyline, yytext());}
":" {return new Symbol(sym.dosPuntos, yychar, yyline, yytext());}
"[" {return new Symbol(sym.corcheteIzquierdo, yychar, yyline, yytext());}
"]" {return new Symbol(sym.corcheteDerecho, yychar, yyline, yytext());}
"{" {return new Symbol(sym.llaveIzquierda, yychar, yyline, yytext());}
"}" {return new Symbol(sym.llaveDerecha, yychar, yyline, yytext());}

"<" {return new Symbol(sym.menorQue, yychar, yyline, yytext());}
">" {return new Symbol(sym.mayorQue, yychar, yyline, yytext());}
"!=" {return new Symbol(sym.diferenteIgualque, yychar, yyline, yytext());}
"<=" {return new Symbol(sym.menoroIgualque, yychar, yyline, yytext());}
">=" {return new Symbol(sym.mayoroIgualque, yychar, yyline, yytext());}
"=" {return new Symbol(sym.igual, yychar, yyline, yytext());}
"/" {return new Symbol(sym.entre, yychar, yyline, yytext());}
"+" {return new Symbol(sym.mas, yychar, yyline, yytext());}
"-" {return new Symbol(sym.menos, yychar, yyline, yytext());}
"*" {return new Symbol(sym.multiplo, yychar, yyline, yytext());}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}

{L}({L}|{D})* {return new Symbol(sym.identificador, yychar, yyline, yytext());} 
("(-"{D}+")")|{D}+ {return new Symbol(sym.numero, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
