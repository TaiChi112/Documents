#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>

typedef struct
{
    char *text;
    int len;
    int shift;
    int mode; // 0 = encrypt, 1 = decrypt
} ThreadData;

void *caesar_cipher(void *arg)
{
    ThreadData *data = (ThreadData *)arg;
    char *text = data->text;
    int len = data->len;
    int shift = data->shift;
    int mode = data->mode;
    int i;

    for (i = 0; i < len; i++)
    {
        char c = text[i];

        if (c >= 'a' && c <= 'z')
        {
            if (mode == 0)
                text[i] = ((c - 'a' + shift) % 26) + 'a';
            else
                text[i] = ((c - 'a' - shift + 26) % 26) + 'a';
        }
        else if (c >= 'A' && c <= 'Z')
        {
            if (mode == 0)
                text[i] = ((c - 'A' + shift) % 26) + 'A';
            else
                text[i] = ((c - 'A' - shift + 26) % 26) + 'A';
        }
    }

    free(data);
    return NULL;
}

int main()
{
    char original_text[] = "HELLO WORLD";
    char *encrypted_text = (char *)malloc(strlen(original_text) + 1);
    strcpy(encrypted_text, original_text);

    int shift_value = 3;
    size_t text_len = strlen(original_text);

    int num_treads = 4;
    pthread_t threads[num_treads];
    ThreadData *thread_data[num_treads];

    int chunk_size = text_len / num_treads;
    for (int i = 0; i < num_treads; i++)
    {
        thread_data[i] = (ThreadData *)malloc(sizeof(ThreadData));
        thread_data[i]->text = encrypted_text + (i * chunk_size);
        thread_data[i]->len = (i == num_treads - 1) ? text_len - (i * chunk_size) : chunk_size;
        thread_data[i]->shift = shift_value;
        thread_data[i]->mode = 0;

        pthread_create(&threads[i], NULL, caesar_cipher, (void *)thread_data[i]);
    }

    for (int i = 0; i < num_treads; i++)
    {
        pthread_join(threads[i], NULL);
    }

    printf("Original: %s\n", original_text);
    printf("Encrypted: %s\n", encrypted_text);

    for (int i = 0; i < num_treads; i++)
    {
        thread_data[i] = (ThreadData *)malloc(sizeof(ThreadData));
        thread_data[i]->text = encrypted_text + (i * chunk_size);
        thread_data[i]->len = (i == num_treads - 1) ? text_len - (i * chunk_size) : chunk_size;
        thread_data[i]->shift = shift_value;
        thread_data[i]->mode = 1;

        pthread_create(&threads[i], NULL, caesar_cipher, (void *)thread_data[i]);
    }

    for (int i = 0; i < num_treads; i++)
    {
        pthread_join(threads[i], NULL);
    }

    printf("Decrypted: %s\n", encrypted_text);
    free(encrypted_text);

    return 0;
}