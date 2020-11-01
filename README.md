# Assignment 5 - xv6 on Steroids

## Task 1

### The `waitx` syscall:

Made required changes to the following files to add the syscall:

1. `syscall.h`
2. `defs.h`
3. `user.h`
4. `sysproc.c`
5. `usys.S`
6. `syscall.c`

Added the required data members in the PBC in `proc.h`

Added the function definiton of `waitx` that will be used by user programs in `proc.c`

Updating `wtime` as the time spend by the process not running. So in `waitx`:
`*wtime = p->etime-p->ctime-p->rtime;`

The `rtime` of the process is incremented every clock tick that that process is on the CPU.

Implemented `time.c` and added required fields to `Makefile`.

### The `ps` user command:

First need to implement a syscall for this. Calling it `cps`, it is added the same way as `waitx` is added.

Implemented `ps.c` that simply calls the `cps` syscall and added required fields to the `Makefile`.

## Task 2

First began by modifying the `Makefile` to add the macro based scheduler choice.

### FCFS

Iterate over the `ptable` and save a pointer to the process with the minimum value in `ctime` and is `RUNNABLE`. Then run it as done in the default scheduler.

### PBS

First had to add the `priority` data member to the PCB in `proc.h`. Impelmented the `set_priority` syscall in the same way as `waitx`.

Implemented `setPriority.c` and added required fields in the `Makefile`.

Iterate over the `ptable` and save the minimum priority value. Then iterating over the `ptable` again, for each process, check if it is `RUNNABLE` and then for it, check if any lower prioriy has been added to the list. If not, run the process if its priority matches the minimum priority. If a lower priority has been added, stop the loop and find the minimum priority again and repeat.

### MLFQ

Add required data members in the PCB in `proc.h`.

Implemented a structure for a queue, that consists of an array of PCBs and a tail pointer. Created an array of 5 such queues and implemented some functions:

1. `initQueues()`, initializes the required values in the array of queues
2. `push(pcb, qno)`, pushes the given pcb into the queue whose number is qno.
3. `pop(pcb, qno)`, removes the given pcb from the queue whose number is qno and shifts the PBCs coming after it one step to the left.
4. `setDemoteFlag(pcb)`, sets the `demoteFlag` of the given PCB. This flag is used to determine if the process in question is to be moved to a lower queue or not.
5. `updateCurTicks(pcb)`, increments teh `curticks` of the given PCB. This is the number of ticks the process has got on the CPU in its current queue.

`initQueues` is called in `main.c` along with the other initialization methods.
`push` is all the places where `p->state = RUNNABLE` is set.
`pop` is added to the `wait` and `waitx` function definitons.
`setDemoteFlag` is called in `trap.c` if a process has been on the cpu for more ticks than the allowed number of ticks on its current queue.
`updateCurTicks` is also called in `trap.c` when a process is on the cpu and a timer interrupt occurs.

In the scheduler, we first iterate over all the processes and see which ones have aged more than the threshold. For those that are, they are popped from their current queue and pushed into the higher queue, if they are not already in the highest level queue.

We then iterate over the queues and find the first queue that has some processes in it. From this queue, we pick the first process, pop it from its queue and give it to the cpu to run it. We then check if its `demoteFlag` has been set, if so we send it to a queue one lower than its current queue, if it isn't already in the lowest queue. Othwise, we put it back into the queue that it was in originally.

##### How can a process game this approach?

So if a process relinquishes the CPU before its allowed time slice is over, it is added back at the end of the same queue. Otherwise, it is demoted to a lower priority queue, where it would take it potentially longer to execute. 

Processes can game this system in the following way: If a process knows what the maximum allowed time is for the highest priority queue, it will first get to that queue, run for a while, that is just shorter than the threshold time, and right before it can be forcefully preempted from the CPU (in which case it would be pushed to a lower queue), it voluntarily relinquishes the CPU and heads back to the end of the same queue. This way the process stays in the highest priority queue, even though its exection time may be significantly longer than the threshold time for that queue.