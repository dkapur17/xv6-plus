// init: The initial user-level program

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

char *argv[] = { "sh", 0 };

int
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
    #ifdef DEFAULT
    printf(1, "Scheduling Policy: Round Robin (DEFAULT)\n");
    #else
    #ifdef FCFS
    printf(1, "Scheduling Policy: First Come First Serve (FCFS)\n");
    #else
    #ifdef PBS
    printf(1, "Scheduling Policy: Priority Based Scheduling (PBS)\n");
    #else
    #ifdef MLFQ
    printf(1, "Scheduling Policy: Multi-Level Feedback Queue (MLFQ)\n");
    #endif
    #endif
    #endif
    #endif
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  }
}
