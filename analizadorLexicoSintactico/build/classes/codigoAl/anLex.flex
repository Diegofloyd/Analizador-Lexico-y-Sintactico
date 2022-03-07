package codigoAl;
import static codigoAl.Tokens.*;
%%
%class anLex
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexema;
%}
%%
main {lexema=yytext(); return Main;}
int {lexema=yytext(); return Int;}
if {lexema=yytext(); return If;}
else {lexema=yytext(); return Else;}
for {lexema=yytext(); return For;}
do {lexema=yytext(); return Do;}
null {lexema=yytext(); return Null;}
while {lexema=yytext(); return While;}

"(" {lexema=yytext(); return parentesisIzquierdo;}
")" {lexema=yytext(); return parentesisDerecho;}
"," {lexema=yytext(); return coma;}
"." {lexema=yytext(); return punto;}
";" {lexema=yytext(); return puntoyComa;}
":" {lexema=yytext(); return dosPuntos;}
"[" {lexema=yytext(); return corcheteIzquierdo;}
"]" {lexema=yytext(); return corcheteDerecho;}
"{" {lexema=yytext(); return llaveIzquierda;}
"}" {lexema=yytext(); return llaveDerecha;}
"\n" {lexema=yytext(); return saltoLinea;}

"<" {lexema=yytext(); return menorQue;}
">" {lexema=yytext(); return mayorQue;}
"!=" {lexema=yytext(); return diferenteIgualque;}
"<=" {lexema=yytext(); return menoroIgualque;}
">=" {lexema=yytext(); return mayoroIgualque;}
"=" {lexema=yytext(); return igual;}
"/" {lexema=yytext(); return entre;}
"+" {lexema=yytext(); return mas;}
"-" {lexema=yytext(); return menos;}
"*" {lexema=yytext(); return multiplo;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}

{L}({L}|{D})* {lexema=yytext(); return identificador;} 
("(-"{D}+")")|{D}+ {lexema=yytext(); return numero;}
 . {return ERROR;}
