#include <stdio.h>

static void delay_loop(unsigned long loops)
  {
    int a = 0;
    int b = a+a;
          asm volatile(
                  "       test %0,%0      \n"
                  "       jz 3f           \n"
                  "       jmp 1f          \n"
  
                  ".align 16              \n"
                  "1:     jmp 2f          \n"
  
                  ".align 16              \n"
                  "2:     dec %0          \n"
                  "       jnz 2b          \n"
                  "3:     dec %0          \n"
  
                  : /* we don't need output */
                  :"a" (loops)
          );
	  b=b-a;
 }


int main( int argc, const char* argv[] ){
  delay_loop(42);
}
