#include <stdio.h>


static void preintercept(int *test){
  *test = 42;
  return;
}

static int postintercept(int *test){
  *test = 48;
  return *test + 2;
}

int main( int argc, const char* argv[] ){
  int test = 1;
  printf("wert: %i",test);
  preintercept(&test);
  printf("wert: %i",test);
  int a = postintercept(&test);
  printf("%i",a);
  printf("wert: %i",test);
}
