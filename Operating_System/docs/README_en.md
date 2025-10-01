# Operating System Study Guide & WSL Troubleshooting

## Table of Contents
- [WSL Common Issues & Solutions](#wsl-common-issues--solutions)
- [WSL Benefits & Drawbacks](#wsl-benefits--drawbacks)
- [Operating System Study Topics](#operating-system-study-topics)

## WSL Common Issues & Solutions

### Installation Issues

#### 1. **WSL Feature Not Enabled**
**Problem:** Windows Subsystem for Linux feature is not installed
**Solution:**
```sh
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

#### 2. **Virtualization Disabled in BIOS**
**Problem:** Hardware virtualization is not enabled
**Solution:** 
- Enter BIOS/UEFI settings
- Enable Intel VT-x or AMD-V
- Enable Hyper-V if available

#### 3. **WSL Kernel Update Required**
**Problem:** Outdated WSL kernel causing installation failures
**Solution:**
```sh
wsl --update
wsl --set-default-version 2
```

### Runtime Issues

#### 4. **WSL Service Not Available (HCS_E_SERVICE_NOT_AVAILABLE)**
**Problem:** Virtual Machine Platform not properly configured
**Solution:**
```sh
bcdedit /set hypervisorlaunchtype auto
```
Enable "Virtual Machine Platform" and "Windows Hypervisor Platform" in Windows Features

#### 5. **WSL Stops Working After Windows Update**
**Problem:** Windows update breaks WSL configuration
**Solution:**
```sh
wsl --shutdown
wsl --update
# If still broken, restart WSL service:
net stop LxssManager
net start LxssManager
```

#### 6. **Distribution Won't Start**
**Problem:** Corrupted WSL distribution or configuration
**Solution:**
```sh
wsl --terminate <DistroName>
wsl --unregister <DistroName>
wsl --install -d <DistroName>
```

#### 7. **File Permission Issues**
**Problem:** Cannot access Windows files from WSL or vice versa
**Solution:**
- Use `/mnt/c/` to access Windows drives
- Set proper umask in WSL: `echo "umask 022" >> ~/.bashrc`

#### 8. **Network Connectivity Issues**
**Problem:** WSL cannot connect to internet or Windows network
**Solution:**
```sh
# Reset WSL network
wsl --shutdown
# Restart WSL and test connectivity
```

#### 9. **Memory/Performance Issues**
**Problem:** WSL consuming too much memory or running slowly
**Solution:**
Create `.wslconfig` file in `%USERPROFILE%`:
```ini
[wsl2]
memory=4GB
processors=2
swap=2GB
```

#### 10. **Docker Integration Problems**
**Problem:** Docker Desktop not working with WSL
**Solution:**
- Enable WSL integration in Docker Desktop settings
- Ensure WSL 2 backend is selected

### Recovery & Backup

#### 11. **Complete WSL Reset**
**Problem:** WSL completely broken, need fresh start
**Solution:**
```sh
wsl --shutdown
wsl --unregister <DistroName>
wsl --uninstall
wsl --install --no-distribution
wsl --install -d <DistroName>
```

#### 12. **Backup & Restore WSL**
**Problem:** Need to backup/migrate WSL installation
**Solution:**
```sh
# Backup
wsl --export <Distro> D:\backup\<Distro>.tar
# Restore
wsl --import <NewName> D:\WSL\New <Distro>.tar --version 2
```

## WSL Benefits & Drawbacks

### ✅ Benefits
- **Native Linux Environment:** Run Linux commands natively on Windows
- **Cross-Platform Development:** Develop for both Windows and Linux simultaneously
- **Package Management:** Access to apt, yum, pacman, etc.
- **Container Support:** Docker and Kubernetes integration
- **Performance:** Better than traditional VMs for development tasks
- **File System Access:** Easy access to Windows files from Linux
- **IDE Integration:** Works with VS Code, IntelliJ, etc.
- **Cost-Effective:** No need for separate Linux machine or VM licenses

### ❌ Drawbacks
- **Windows Dependency:** Requires Windows 10/11 Pro or Enterprise
- **Resource Usage:** Consumes additional system resources
- **Compatibility Issues:** Some Linux applications may not work perfectly
- **File Permission Complexity:** Windows/Linux permission mapping can be confusing
- **Network Limitations:** Some networking features may be limited
- **GUI Applications:** Limited support for Linux GUI applications (improving with WSLg)
- **Hardware Access:** Limited direct hardware access compared to native Linux
- **Learning Curve:** Requires understanding both Windows and Linux systems

## WSL
The error code 
**Wsl/Service/CreateInstance/CreateVm/HCS/HCS_E_SERVICE_NOT_AVAILABLE** indicates that a required Windows feature for running WSL 2 virtual machines is not installed or properly configured. This often relates to the underlying virtualization components that WSL 2 relies on.

**Common causes and solutions**:
- **Virtual Machine Platform or Windows Hypervisor Platform not enabled**:

**WSL 2 requires these features to be enabled.**
- Open the Start menu, search for "Turn Windows features on or off" and open it.
- Ensure that "Virtual Machine Platform" and "Windows Hypervisor Platform" are checked.
- Click "OK" and restart your computer if prompted.
- Hardware virtualization not enabled in BIOS/UEFI:

Your computer's BIOS or UEFI settings must have hardware virtualization (e.g., Intel VT-x or AMD-V) enabled for WSL 2 to function.

- Access your computer's BIOS/UEFI settings during startup (usually by pressing a key like Del, F2, F10, or F12).
- Locate and enable the virtualization technology setting. The exact name varies by manufacturer.
- Save changes and exit BIOS/UEFI.

**Corrupted WSL installation or configuration.**
If the above steps do not resolve the issue, a reinstallation or reset of WSL might be necessary. Open PowerShell as Administrator and Run the following commands.

```sh
wsl --shutdown
wsl --unregister <YourDistroName> # Replace with your WSL distribution name, e.g., Ubuntu
wsl --uninstall
wsl --install --no-distribution
wsl --set-default-version 2
```

- Restart your computer.
- Then, install your desired distribution:

```sh
wsl --install -d <YourDistroName> # e.g., wsl --install -d Ubuntu
```

**Conflicting virtualization software.**
Other virtualization software (like VMware Workstation or VirtualBox) can sometimes conflict with WSL 2's use of Hyper-V.
- Consider temporarily disabling or uninstalling other virtualization software if you suspect a conflict.
- Ensure that Hyper-V is set to launch automatically if you are using it:

```sh
bcdedit /set hypervisorlaunchtype auto
```

Then, restart your computer. Core Isolation - Memory Integrity.

In some cases, disabling Core Isolation's Memory Integrity feature in Windows Security has resolved this error.
- Open Windows Security > Device Security > Core Isolation details.
- Turn off "Memory integrity" if it is enabled.
- Restart your computer.

After attempting these solutions, try running your WSL distribution again.

## Operating System Study Topics

### Prerequisites Knowledge
- [ ] Computer Architecture Basics
- [ ] Assembly Language Fundamentals
- [ ] C/C++ Programming
- [ ] Data Structures & Algorithms
- [ ] Computer Networks Basics
- [ ] Mathematics (Discrete Math, Statistics)

### Core Operating System Concepts

#### 1. **Foundations**
- [ ] Operating System Definition & Purpose
- [ ] System Calls & APIs
- [ ] Kernel vs User Mode
- [ ] Interrupts & System Calls
- [ ] Bootstrap & Boot Process

#### 2. **Process Management**
- [ ] Process vs Thread vs Program
- [ ] Process States & Lifecycle
- [ ] Process Control Block (PCB)
- [ ] Context Switching
- [ ] Process Creation & Termination
- [ ] Inter-Process Communication (IPC)
- [ ] Pipes, Message Queues, Shared Memory
- [ ] Signals & Event Handling

#### 3. **CPU Scheduling**
- [ ] Scheduling Algorithms (FCFS, SJF, RR, Priority)
- [ ] Preemptive vs Non-preemptive
- [ ] Multilevel Queue Scheduling
- [ ] CPU Burst & I/O Burst
- [ ] Scheduling Metrics (Turnaround, Waiting, Response Time)

#### 4. **Synchronization & Concurrency**
- [ ] Race Conditions
- [ ] Critical Section Problem
- [ ] Mutual Exclusion
- [ ] Semaphores & Mutexes
- [ ] Monitors & Condition Variables
- [ ] Deadlock Detection & Prevention
- [ ] Banker's Algorithm
- [ ] Producer-Consumer Problem
- [ ] Readers-Writers Problem
- [ ] Dining Philosophers Problem

#### 5. **Memory Management**
- [ ] Memory Hierarchy
- [ ] Logical vs Physical Address
- [ ] Memory Allocation Strategies
- [ ] Fragmentation (Internal/External)
- [ ] Paging & Page Tables
- [ ] Segmentation
- [ ] Virtual Memory
- [ ] Demand Paging
- [ ] Page Replacement Algorithms (FIFO, LRU, Optimal)
- [ ] Thrashing
- [ ] Working Set Model

#### 6. **File Systems**
- [ ] File System Interface
- [ ] Directory Structure
- [ ] File Allocation Methods (Contiguous, Linked, Indexed)
- [ ] Free Space Management
- [ ] File System Implementation
- [ ] Journaling File Systems
- [ ] RAID Systems
- [ ] File System Performance
- [ ] Network File Systems (NFS, SMB)

#### 7. **I/O & Device Management**
- [ ] I/O Hardware Architecture
- [ ] Polling vs Interrupts vs DMA
- [ ] Device Drivers
- [ ] I/O Scheduling
- [ ] Buffering & Caching
- [ ] Spooling
- [ ] Device Categories (Block, Character, Network)

#### 8. **Security & Protection**
- [ ] Authentication & Authorization
- [ ] Access Control Lists (ACL)
- [ ] Capability-based Security
- [ ] Security Threats & Attacks
- [ ] Cryptography Basics
- [ ] Secure Boot
- [ ] Sandboxing & Isolation

### Advanced Topics

#### 9. **Virtualization**
- [ ] Virtual Machine Types (Type 1, Type 2)
- [ ] Hypervisors (VMware, Hyper-V, KVM)
- [ ] Container Technology (Docker, LXC)
- [ ] Paravirtualization
- [ ] Hardware Virtualization Support

#### 10. **Distributed Systems**
- [ ] Distributed System Challenges
- [ ] Consistency Models
- [ ] Consensus Algorithms (Raft, Paxos)
- [ ] Distributed File Systems
- [ ] Load Balancing
- [ ] Fault Tolerance

#### 11. **Real-Time Systems**
- [ ] Real-Time Constraints
- [ ] Hard vs Soft Real-Time
- [ ] Rate Monotonic Scheduling
- [ ] Earliest Deadline First (EDF)
- [ ] Priority Inversion

#### 12. **Modern OS Features**
- [ ] Multicore & SMP Systems
- [ ] NUMA Architecture
- [ ] Power Management
- [ ] Mobile OS Considerations
- [ ] Cloud Computing Integration

### Key Terminology & Keywords
- **Process Management:** PCB, Context Switch, Fork, Exec, Wait, Exit
- **Memory:** Virtual Address Space, TLB, MMU, Page Fault, Swapping
- **File Systems:** Inode, Superblock, Metadata, Journaling, FSCK
- **Synchronization:** Mutex, Semaphore, Spinlock, Atomic Operations
- **Scheduling:** Quantum, Preemption, Starvation, Aging
- **Security:** Privilege Escalation, Buffer Overflow, Rootkit, Malware
- **Networking:** Socket, Protocol Stack, Network Interface, Firewall
- **Performance:** Throughput, Latency, Cache Hit Ratio, Load Average

### Practical Skills
- [ ] Shell Scripting (Bash, PowerShell)
- [ ] System Administration
- [ ] Performance Monitoring & Analysis
- [ ] Debugging System Issues
- [ ] Log Analysis
- [ ] Network Configuration
- [ ] Security Hardening
- [ ] Backup & Recovery

### Popular Operating Systems to Study
- [ ] **Linux:** Ubuntu, CentOS, Arch, Kernel Architecture
- [ ] **Windows:** Windows 10/11, Server, PowerShell, Registry
- [ ] **macOS:** Darwin Kernel, BSD Components
- [ ] **Mobile:** Android (Linux-based), iOS
- [ ] **Embedded:** FreeRTOS, QNX, VxWorks
- [ ] **Research:** Minix, xv6, Plan 9