#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>

int main() {
  pid_t pid = fork();

  if (pid < 0) {
    perror("\nFork war nicht erfolgreich.");
    return 0;
  }

  if (pid == 0) {
    for (int i = 1; i <= 2000; i++) {
      if (i % 2 != 0) {
        printf("Das sind die ungeraden Zahlen vom Kindprozess (PID %d): %d\n", getpid(), i);
      }
    }
    exit(0);
  }

  else {

    for (int i = 1; i <= 2000; i++) {
      if (i % 2 == 0) {
        printf("Das sind die geraden Zahlen vom Vaterprozess (PID %d): %d\n", getpid(), i);
      }
    }
    wait(NULL);
  }
  return 0;
}
