%{
#include<stdio.h>
int flag=0;
void yyerror();
int yylex();
%}

%token NUMBER;
%left '+''-'
%left '*''/''%'
%left '('')'

%%
ArithmeticExpression: E{
  printf("Result:%d\n",$$);
  return 0;
};

E: E'+'E {$$=$1+$3;}
| E'-'E {$$=$1-$3;}
| E'*'E {$$=$1*$3;}
| E'/'E {$$=$1/$3;}
| E'%'E {$$=$1%$3;}
| '('E')' {$$=$2;}
| NUMBER {$$=$1;}
;
%%
void main(){
  printf("Enter:");
  yyparse();
  if(flag==0){
    printf("Valid");
  }
}

void yyerror(){
  printf("Invalid");
  flag=1;
}