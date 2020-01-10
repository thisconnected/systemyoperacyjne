#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

void *printMessage(void *message)
{
  
  char * string = (char*)message;
  for(int i = 0; i<5; i++)
    {
      printf("hello im %s\n",string);
    }
  pthread_exit(NULL);
}

int main (int argc, char *argv[])
{
  pthread_t thread1,thread2;
  const char *message1 = "thread1";
  const char *message2 = "thread2";
  int iret1, iret2;

  iret1 = pthread_create(&thread1, NULL, printMessage, (void *)message1);
  if (iret1){
    fprintf(stderr,"ERROR; return code from pthread_create() is %d\n", iret1);
    exit(EXIT_FAILURE);
  }
  iret2 = pthread_create(&thread2, NULL, printMessage, (void *)message2);
  if (iret2){
    fprintf(stderr,"ERROR; return code from pthread_create() is %d\n", iret2);
    exit(EXIT_FAILURE);
  }

  printf("pthread_create() for %s returns: %d\n",message1,iret1);
  printf("pthread_create() for %s returns: %d\n",message2,iret2);
  
  
  pthread_join(thread1, NULL);
  pthread_join(thread2, NULL);
  
  pthread_exit(NULL);
}
