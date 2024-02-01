/*{
S -> cAd
A -> ab|a  
}*/

#include <stdio.h>
#include <string.h>

int S();
int A();

char input[100];
int currIndex=0;

int match(char curr){
  if(input[currIndex] == curr){
    currIndex++;
    return 1;
  }
  return 0;
}

int S(){
  if(match('c')){
    if(A()){
      if(match('d')){
        return 1;
      }
    }
  }
  return 0;
}

int A(){
  int temp = currIndex;
  if(match('a')){
    if(match('b')){
      return 1;
    }
  }
  currIndex = temp;

  if (match('a')){
    return 1;
  }
  return 0;
}

int main(){
  printf("Enter string:");
  scanf("%s",&input);

  currIndex =0;

  if(S() && currIndex == strlen(input)){
    printf("Successful");
  }else{
    printf("Failed");
  }
}