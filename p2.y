%{
  #include<stdio.h>
  #include<ctype.h>
  #include<stdlib.h>
  #include<math.h>
  void yyerror();
  int yylex();
%}

%token digit;

%%
S:E {printf("\n\n");}
;

E:E'+'T {printf("+");}
| E'-'T {printf("-");}
| T 
;

T: T'*'F {printf("*");}
| T'/'F {printf("/");}
| F
;

F: F'^'G {printf("^");}
| G
;

G: '('E')'
| digit {printf("%d",$1);}
;
%%
void main(){
  printf("Enter expression:");
  yyparse();
}

void yyerror(){
  printf("Error");
}