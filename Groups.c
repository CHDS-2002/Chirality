#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#define GROUP_SIZE 8

// Таблица умножения для группы D4
const int multiplication_table[GROUP_SIZE][GROUP_SIZE] = {
  {0, 1, 2, 3, 4, 5, 6, 7},
  {1, 2, 3, 0, 5, 6, 7, 4},
  {2, 3, 0, 1, 6, 7, 4, 5},
  {3, 0, 1, 2, 7, 4, 5, 6},
  {4, 7, 6, 5, 0, 3, 2, 1},
  {5, 4, 7, 6, 1, 0, 3, 2},
  {6, 5, 4, 7, 2, 1, 0, 3},
  {7, 6, 5, 4, 3, 2, 1, 0}
};

// Структура для хранения элементов
struct args {
    int a;
    int b;
};

void* multiply_elements(void* arg) {
    struct args* args = (struct args*)arg;
    int result = multiplication_table[args->a][args->b];
    free(args);
    return (void*)(long)result;
}

int main() {
    // Массив для хранения идентификаторов потоков
    pthread_t threads[GROUP_SIZE * GROUP_SIZE];
    
    // Массив для хранения элементов группы D4
    int results[GROUP_SIZE * GROUP_SIZE];
    
    // Создание потоков
    for (int i = 0; i < GROUP_SIZE; ++i) {
        for (int j = 0; j < GROUP_SIZE; ++j) {
            struct args* args = (struct args*)malloc(sizeof(struct args));
            args->a = i;
            args->b = j;
            pthread_create(&threads[i * GROUP_SIZE + j], NULL, multiply_elements, (void*)args);
        }
    }
    
    // Запуск потоков
    for (int i = 0; i < GROUP_SIZE * GROUP_SIZE; ++i) {
        pthread_join(threads[i], &results[i]);
    }
    
    // Вывод элементов группы D4 на экран
    for (int i = 0; i < GROUP_SIZE; ++i) {
        for (int j = 0; j < GROUP_SIZE; ++j) {
            long result = (long)results[i * GROUP_SIZE + j];
            printf("%ld ", result);
        }
        printf("\n");
    }
    
    return 0;
}