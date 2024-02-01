%{
#include<stdio.h>  
%}
d [0-9]+
%%
{d}*00 {printf("String ends in 00");}

{d}*222{d}* {printf("String has 222");}

({d})*1(({d}){9}) {printf("Valid");}

({d}){4} { 
  int digit1 = yytext[0] - '0';
  int digit2 = yytext[1] - '0';
  int digit3 = yytext[2] - '0';
  int digit4 = yytext[3] - '0';
  if (digit1 <= digit2 && digit2 <= digit3 && digit3 <= digit4) {
  printf("Ascending digits");
}else{
  printf("Non-ascending digits");
}
if(digit1+digit2+digit3+digit4==9){
  printf("\nSum=9");
}else{
  printf("\nSum!=9");
}
}
%%
int yywrap(){}
int main(){
  yylex();
  return 0;
}