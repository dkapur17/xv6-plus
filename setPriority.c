#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    int new_priority, old_priority, pid;
    if(argc != 3)
    {
        printf(2, "Usage: setPriority <new_priority> <pid>\n");
        exit();
    }

    new_priority = atoi(argv[1]);
    pid = atoi(argv[2]);

    if(new_priority < 0 || new_priority > 100)
    {
        printf(2, "Priority value can only range from 0-100\n");
        exit();
    }

    old_priority = set_priority(new_priority, pid);
    if(old_priority == -1)
    {
        printf(2, "No process with pid %d exists\n", pid);
        exit();
    }
    
    printf(1, "Priority of process with pid %d was updated successfully from %d to %d\n", pid, old_priority, new_priority);
    exit();
}