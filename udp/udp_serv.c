#include<stdio.h>

#include <sys/types.h>          /* See NOTES */
#include <sys/socket.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <memory.h>

#define SER_PORT 23333

void echo_ser(int sock){
	char recvbuf[1024] = {0};
	struct sockaddr_in peer_addr;
	socklen_t peer_len;
	int n;

	while (1){
		peer_len = sizeof(peer_addr);
		memset(recvbuf,0,sizeof(recvbuf));
		n = recvfrom(sock,recvbuf,sizeof(recvbuf),0,(struct sockaddr*)&peer_addr,&peer_len);
		if(n<=0){
			
			printf("recerror\n");		
			return;
		}
		printf("接收数据：%s\n",recvbuf);
		//sendto(sock,recvbuf,n,0,(struct sockaddr*)&peer_addr,peer_len);
		//printf("会送：%s\n",recvbuf);
	}
	close(sock);
}
int main(){
	int fd = socket(AF_INET,SOCK_DGRAM,0);
	if(fd<0){
		printf("create socket error\n");
		return 0;
	}
	struct sockaddr_in servaddr;
	memset(&servaddr,0,sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(SER_PORT);
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	printf("begin to listen:%d\n",SER_PORT);
	if(bind(fd,(struct sockaddr*)&servaddr,sizeof(struct sockaddr))==-1){
		printf("bind error%d\n");
		return 0;

	}
	
	echo_ser(fd);
	return 0;
}