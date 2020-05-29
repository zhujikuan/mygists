#include<stdio.h>

#include <sys/types.h>          /* See NOTES */
#include <sys/socket.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <memory.h>

#define SER_PORT 23333
void echo_cli(int sock){
	struct sockaddr_in servaddr;
	memset(&servaddr,0,sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(SER_PORT);
	servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");
	int ret;
	char sendbuf[1024] = {0};

	while (fgets(sendbuf,sizeof(sendbuf),stdin)!=NULL){
		ret = sendto(sock,sendbuf,strlen(sendbuf),0,(const struct sockaddr *)&servaddr,sizeof(servaddr));
		printf("发送了:%s",sendbuf);
	}
	close(sock);
}

int main(){
	int fd = socket(AF_INET,SOCK_DGRAM,0);
	if(fd<0){
		printf("create socket error\n");
		return 0;
	}
	echo_cli(fd);
	return 0;
}
