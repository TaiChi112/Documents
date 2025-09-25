#include <stdio.h>
int main(){

   char far* greetings = "6505501038 COS3105$";

   asm {
		lds dx, greetings // ส่งข้อความไปยังจอภาพ
		mov ah, 0x9        // ใช้ฟังก์ชั่น 9
		int 21h
   }
   return 0;
}