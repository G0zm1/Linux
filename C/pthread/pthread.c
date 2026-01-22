#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

pthread_mutex_t print_mutex;

void* thread_function(void* arg) {
    char* name = (char*) arg;
    int counter = 1;

    while (1) {
        pthread_mutex_lock(&print_mutex);

        printf("%s %d\n", name, counter);
        fflush(stdout);

        pthread_mutex_unlock(&print_mutex);

        counter++;
        sleep(1);
    }

    return NULL;
}

int main() {
    pthread_t t1, t2;

    pthread_mutex_init(&print_mutex, NULL);

    pthread_create(&t1, NULL, thread_function, "Thread-1");
    pthread_create(&t2, NULL, thread_function, "Thread-2");

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    pthread_mutex_destroy(&print_mutex);

    return 0;
}
