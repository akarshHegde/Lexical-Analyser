%{
#include<stdio.h>
#include<stdlib.h>
int flag=0;
%}
digit [0-9]*
letter [a-zA-Z]*
%%  
(digit)+("E"("+"|"-")?(digit)+)?	{if(flag==1) {;} else fprintf(yyout,"%sINTEGER LITERAL\n",yytext);}
 
(digit)+"."(digit)+("E"("+"|"-")?(digit)+)? {if(flag==1) {;} else fprintf(yyout,"%s\tFLOAT LITERAL\n",yytext);}  

("/*")	{flag=1;}
("*/")	{flag=0;}

"main"|"if"|"else"|"int"|"char"|"scanf"|"if"|"fprintf"|"printf"|"switch"|"return"|"struct"|"do"|"while"|"void"|"for"|"float"|"include" {if(flag==1) {;} else fprintf(yyout,"%s\tKEYWORD\n",yytext);}  

"\a"|"\\n"|"\\b"|"\t"|"\\t"|"\b"|"\\a" {if(flag==1) {;} else fprintf(yyout,"%s\tESCAPE SEQUENCES\n",yytext);}

{letter}({letter}|{digit})* {if(flag==1) {;} else fprintf(yyout,"%s\tIDENTIFIER\n",yytext);}

"&&"	{if(flag==1) {;} else fprintf(yyout,"%s\tLOGICAL AND operator\n",yytext);}
"<"	{if(flag==1) {;} else fprintf(yyout,"%s\tGREATER THAN operator\n",yytext);}
">"	{if(flag==1) {;} else fprintf(yyout,"%s\tLESS THAN operator\n",yytext);}
"<="	{if(flag==1) {;} else fprintf(yyout,"%s\tLESS THAN OR EQUAL TO operator\n",yytext);}
">="	{if(flag==1) {;} else fprintf(yyout,"%s\tGREATER THAN OR EQUALTO operator\n",yytext);}
"="	{if(flag==1) {;} else fprintf(yyout,"%s\tEQUAL TO operator\n",yytext);}
"+"	{if(flag==1) {;} else fprintf(yyout,"%s\tADDITION operator\n",yytext);}
"-"	{if(flag==1) {;} else fprintf(yyout,"%s\tSUBTRACTION operator\n",yytext);}
"*"	{if(flag==1) {;} else fprintf(yyout,"%s\tMULTIPLICATION operator\n",yytext);}
"/"	{if(flag==1) {;} else fprintf(yyout,"%s\tDIVIDE operator\n",yytext);}
"\%"	{if(flag==1) {;} else fprintf(yyout,"%s\tMODULUS operator\n",yytext);}
"&"	{if(flag==1) {;} else fprintf(yyout,"%s\t BITWISE operator\n",yytext);}
"\|\|"	{if(flag==1) {;} else fprintf(yyout,"%s\tLOGICAL OR operator\n",yytext);}
"\|"	{if(flag==1) {;} else fprintf(yyout,"%s\tBITWISE OR operator\n",yytext);}

"{"	{if(flag==1) {;} else fprintf(yyout,"%s\tOPEN_CURLY BRACKET\n",yytext);}
"}"	{if(flag==1) {;} else fprintf(yyout,"%s\tCLOSE_CURLY BRACKET\n",yytext);}
"["	{if(flag==1) {;} else fprintf(yyout,"%s\tOPEN_SQUARE BRACKET\n",yytext);}
"]"	{if(flag==1) {;} else fprintf(yyout,"%s\tCLOSE_SQUARE BRACKET\n",yytext);}
"("	{if(flag==1) {;} else fprintf(yyout,"%s\tOPEN BRACKET\n",yytext);}
")"	{if(flag==1) {;} else fprintf(yyout,"%s\tCLOSE BRACKET\n",yytext);}
"#"	{if(flag==1) {;} else fprintf(yyout,"%s\tHASH\n",yytext);}
"'"	{if(flag==1) {;} else fprintf(yyout,"%s\tQUOTE\n",yytext);}
"\""	{if(flag==1) {;} else fprintf(yyout,"%s\tDOUBLE QUOTE\n",yytext);}
"."	{if(flag==1) {;} else fprintf(yyout,"%s\tDOT\n",yytext);}
"\\"	{if(flag==1) {;} else fprintf(yyout,"%s\tBACK SLASH\n",yytext);}
";"	{if(flag==1) {;} else fprintf(yyout,"%s\tSEMI COLON\n",yytext);}
","	{if(flag==1) {;} else fprintf(yyout,"%s\tCOMMA\n",yytext);}


"%d"|"%s"|"%c"|"%f"|"%e" { if(flag==1) {;} else fprintf(yyout,"%s\tFORMAT SPECIFIER\n",yytext); }
(" "|"	"|""|"\n") {;}
 
%%  
int yywrap()  
{  
return 1;  
}  
int main(int argc,char *argv[])  
{  
if(argc!=2)
{
if(flag==1) {;} else fprintf(yyout,"<./a.out><input_program>\n");
exit(0);
}
yyin=fopen(argv[1],"r");
yyout=fopen("tokens.txt","w");
 if(yyin=='\0')
{
if(flag==1) {;} else fprintf(yyout,"Does not exist\n");
exit(0);
}yylex();  
fclose(yyin);  
return 0;  
}
