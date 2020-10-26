#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    if(argc < 2)
    {
        printf(2, "Usage: time <command> [arguments]\n");
        exit();
    }

    int status, wtime = 0, rtime = 0;
    int pid = fork();
    if(pid == 0)
    {
        exec(argv[1], argv);
        printf(2, "Unable to time %s\n", argv[1]);
        exit();
    }
    else
        status = waitx(&wtime, &rtime);

    printf(1, "%s timing stats:\nRun Time: %d\nWait Time: %d\nThe process exitted with status %d\n", argv[1], rtime, wtime, status);
    exit();
}
