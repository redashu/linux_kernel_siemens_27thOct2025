CFS (Completely Fair Scheduler) — default scheduler for normal processes.

RR (Round Robin) and FIFO (First In First Out) — real-time scheduling policies.

## 🔹 1. Concept Overview

### a) Scheduling Classes

Linux divides schedulers into classes, each handling different types of processes:

| Class | Policy | Type | Typical Use |
|-------|--------|------|-------------|
| CFS | SCHED_OTHER | Normal | Default for all user tasks |
| Real-Time | SCHED_RR, SCHED_FIFO | High Priority | Real-time apps, low-latency services |
| Idle | SCHED_IDLE | Lowest Priority | Background tasks |
| Deadline | SCHED_DEADLINE | Deterministic RT | Very specific workloads |

### b) Scheduler Priority Range

| Policy | Priority Range | Preemptive? | Description |
|--------|----------------|-------------|-------------|
| SCHED_OTHER (CFS) | 0 only | Yes | Uses niceness value (-20 to +19) |
| SCHED_RR | 1-99 | Yes | Each process gets fixed quantum time slice |
| SCHED_FIFO | 1-99 | Yes | Process runs until it blocks or voluntarily yields |

### c) Niceness (for CFS)

- Lower nice value ⇒ higher priority.
- Range: -20 (highest) → +19 (lowest).
- Default is 0.

## 🔹 2. LAB 1 — Working with CFS (Default Scheduler)

**Objective:**
Observe and manipulate process priorities under CFS.

**Steps:**

1. Run two CPU-intensive tasks:
    ```bash
    dd if=/dev/zero of=/dev/null &
    dd if=/dev/zero of=/dev/null &
    ```

2. Check priorities:
    ```bash
    ps -eo pid,ni,pri,cmd | grep dd
    ```

3. Change niceness dynamically:
    ```bash
    renice -n -10 -p <PID>
    ```

4. Observe CPU share difference:
    ```bash
    top -p <PID1>,<PID2>
    ```

The lower niceness process (-10) will get more CPU time.

**🧠 Concept:**
CFS calculates each task's "virtual runtime" — the lower the vruntime, the higher its CPU share. Niceness modifies vruntime increment speed.

## 🔹 3. LAB 2 — Real-Time Scheduling (SCHED_RR, SCHED_FIFO)

**Objective:**
Compare behavior between RR and FIFO scheduling.

### Step 1 — Create CPU stress processes
```bash
stress --cpu 1 --timeout 60 &
```

### Step 2 — Change scheduler policy

Check current:
```bash
chrt -p <PID>
```

Change to Round-Robin (RR):
```bash
sudo chrt -r -p 50 <PID>
```

Or FIFO:
```bash
sudo chrt -f -p 70 <PID>
```

### Step 3 — Observe effect

Run:
```bash
ps -eo pid,policy,rtprio,ni,cmd | grep stress
```

And then:
```bash
top -p <PID>
```

**🧠 Concept:**
- **SCHED_FIFO**: runs until it yields (strict priority).
- **SCHED_RR**: similar but each process of same RT priority gets time slice (~100 ms).

Try running two RR tasks with same priority — they'll share CPU time equally.
Two FIFO tasks? The first one starves the second until it blocks.

## 🔹 4. LAB 3 — Taskset and CPU Affinity (Advanced)

**Objective:**
Observe how process pinning affects performance.

```bash
stress --cpu 2 --timeout 60 &
taskset -cp 0 <PID>
```

Now watch top — CPU0 will get pinned load while CPU1 stays idle.

**🧠 Concept:**
CPU affinity restricts which cores a process can run on, useful for NUMA tuning and container resource isolation.

## 🔹 5. LAB 4 — Combine Everything (Showstopper Demo)

**Scenario:**
You simulate three types of workloads and control them like a kernel scheduler:

| Task | Type | Scheduler | CPU Affinity | Expected Behavior |
|------|------|-----------|--------------|-------------------|
| stress --cpu 1 | Normal | CFS (nice +10) | CPU0 | Slow |
| stress --cpu 1 | High Priority | FIFO (prio 70) | CPU0 | Always preempts others |
| stress --cpu 1 | Normal | CFS (nice -10) | CPU1 | Fast but isolated |

You can visualize CPU distribution using:
```bash
htop
```

Then press `f` → show priority and CPU affinity columns.