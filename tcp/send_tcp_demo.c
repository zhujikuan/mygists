#include  <unistd.h>
#include  <sys/types.h>       /* basic system data types */
#include  <sys/socket.h>      /* basic socket definitions */
#include  <netinet/in.h>      /* sockaddr_in{} and other Internet defns */
#include  <arpa/inet.h>       /* inet(3) functions */
#include <netdb.h> /*gethostbyname function */

#include <stdlib.h>
#include <errno.h>
#include <stdio.h>
#include <string.h>



//#define SEND_UDC(i) write(connfd,peer0_##i##,sizeof(peer0_##i##));


int main(int argc, char **argv)
{
    char * servInetAddr = "1.1.2.1";
    int servPort = 46578;
    char buf[1024];
    int connfd;
	int i;
    struct sockaddr_in servaddr;

    if (argc == 2) {
        servInetAddr = argv[1];
    }
    if (argc == 3) {
        servInetAddr = argv[1];
        servPort = atoi(argv[2]);
    }
    if (argc > 3) {
        printf("usage: echoclient <IPaddress> <Port>\n");
        return -1;
    }

    connfd = socket(AF_INET, SOCK_STREAM, 0);

    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(servPort);
    inet_pton(AF_INET, servInetAddr, &servaddr.sin_addr);

    if (connect(connfd, (struct sockaddr *) &servaddr, sizeof(servaddr)) < 0) {
        perror("connect error");
        return -1;
    }
    printf("welcome to echoclient\n");
	/*for(i=0;i<=3;++i){
		SEND_UDC(i);
	}
 */
	write(connfd,peer0_0,sizeof(peer0_0));
	write(connfd,peer0_1,sizeof(peer0_1));
	write(connfd,peer0_2,sizeof(peer0_2));
	write(connfd,peer0_3,sizeof(peer0_3));
	//sleep(3);
    close(connfd);
    printf("exit\n");
    exit(0);
}
