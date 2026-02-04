#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>

// Function to handle specific signals
void signal_handler(int sig) {
    if (sig == SIGTERM) {
        printf("\nParent: Received SIGTERM signal. Exiting gracefully...\n");
        exit(0);
    } else if (sig == SIGINT) {
        printf("\nParent: Received SIGINT (Ctrl+C). Handling signal and exiting...\n");
        exit(0);
    }
}

int main() {
    // Register the handler for SIGTERM and SIGINT
    signal(SIGTERM, signal_handler);
    signal(SIGINT, signal_handler);

    pid_t pid = fork();

    if (pid == 0) {
        // First Child: Sends SIGTERM after 5 seconds
        sleep(5);
        printf("Child 1: Sending SIGTERM to Parent...\n");
        kill(getppid(), SIGTERM);
        exit(0);
    } else {
        // Parent runs indefinitely until a signal is received
        printf("Parent (PID: %d) is running and waiting for signals...\n", getpid());
        
        // Second Child: Sends SIGINT after 10 seconds (as a backup)
        if (fork() == 0) {
            sleep(10);
            printf("Child 2: Sending SIGINT to Parent...\n");
            kill(getppid(), SIGINT);
            exit(0);
        }

        while(1) {
            pause(); // Wait for signals
        }
    }

    return 0;
}
