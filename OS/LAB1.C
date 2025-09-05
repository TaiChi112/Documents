#include <stdio.h>
int main(){
    asm {
        mov ah, 0x2      
        mov dl, 'a'     
        int 21h
    }
   return 0;
};