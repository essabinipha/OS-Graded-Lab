#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t p;
    
    for (int i = 0; i < 3; i++) {
        p = fork();

        if (p < 0) {
            perror("Fork failed");
            exit(1);
        }

        if (p == 0) {
            // Inside Child Process
            printf("Child Process (PID: %d) is running...\n", getpid());
            exit(0); // Child exits
        } else {
            // Inside Parent Process
            int status;
            // wait() blocks parent until child exits, preventing zombie state
            pid_t finished_child = wait(&status);
            printf("Parent cleaned up Child PID: %d\n", finished_child);
        }
    }

    printf("All children handled. No zombies created.\n");
    return 0;
}
