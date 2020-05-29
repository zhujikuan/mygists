//copy form unp
/**
* 判断大端小端
* num = 0x12345678
* 大端：&num[0] == 12 
* 小端：&num[0] == 78
* 大端小端表示多字节值的哪一端存储在该值的起始地址
* 高字节位--->>数字的高位-->>大的这边-->>放在内存的起始地址-->>大端序
*/
#include<stdio.h>
#include<stdlib.h>
int
main(int argc, char **argv)
{
	union {
	  short  s;
      char   c[sizeof(short)];
    } un;

	un.s = 0x0102;
	printf("the byteorder of this mathine is: ");
	if (sizeof(short) == 2) {
		if (un.c[0] == 1 && un.c[1] == 2)
			printf("big-endian\n");
		else if (un.c[0] == 2 && un.c[1] == 1)
			printf("little-endian\n");
		else
			printf("unknown\n");
	} else
		printf("sizeof(short) = %d\n", sizeof(short));

	exit(0);
}
