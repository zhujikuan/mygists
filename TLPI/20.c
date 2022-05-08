#include <signal.h>

static void sigHandler(int sig) {
    static int count = 0;

    printf("recv sig:%d\n", sig);
    return;
    if (sig == SIGINT) {
        count++;
        printf("Caught SIGINT (%d)\n", count);
        return; /* Resume execution at point of interruption */
    }

    printf("Caught SIGQUIT - that's all folks!\n");
    exit(0);
}

int main(int argc, char* argv[]) {
    signal(SIGINT, sigHandler);
    signal(SIGQUIT, sigHandler);

    while (1) {
        sleep(1);
    }
    return 0;
}