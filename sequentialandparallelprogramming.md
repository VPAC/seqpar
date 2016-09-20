#Sequential and Parallel Programming with C and Fortran

by Lev Lafayette

ISBN-10: 0-9943373-1-0

ISBN-13: 978-0-9943373-1-3


Sequential and Parallel Programming with C and Fortran by Lev Lafayette, 2015

Published by the Victorian Partnership for Advanced Computing (trading as V3 Alliance) .

Cover art composed by Michael D'Silva, featuring several clusters operated by the Victorian Partnership for Advanced Computing.

Sequential and Parallel Programming with C and Fortran, is licensed under a Creative Commons Attribution 4.0 International License. 

All trademarks are property of their respective owners.


# Table of Contents

Foreward
Introduction	2
1.0 Current Trends in Computer Systems	5
1.1 Computer System Architectures	5
1.2 Processors, Cores, and Threads	8
1.3 Multithreaded Applications	9
1.4 Parallel Processing Performance	11
2.0 Sequential Programming with C and Fortran	16
2.1 Fortran and C Fundamentals	16
2.2 Program and Compilation	18
2.3 Variables and Constants	20
2.4 Data Types and Operations	23
2.5 Loops and Branches	26
2.6 Data Structures	30
2.7 Input and Output	33
3.0 Shared Memory Parallel Programming with OpenMP	35
3.1 Shared Memory Concepts and the OpenMP Implementation	35
3.2 Directives and Internal Control Variables	38
3.3 Core Constructs	42
3.4 Tasks and Synchronisation	47
3.5 Targets and Teams	50
4.0 Distributed Memory Programming with OpenMPI	52
4.1 Distributed Memory Concepts and the OpenMPI Implementation	52
4.2 MPI Program Structure and OpenMPI Wrappers	54
4.3 MPI's Basic Routines	59
4.4 MPI Datatypes	68
4.5 Extended Communications and Other Routines	71
4.6 Compiler Differences	77
4.7 Collective Communications	78
5.0 Profiling and Debugging	87
5.2 Memory Checking with Valgrind	90
5.3 Debugging with GDB	93
References	97


# Foreward

John L. Gustafson

It is finally time for a book like this one.

When parallel programming was just getting off the ground in the late 1960s, it started as a battle between starry-eyed academics who envisioned how fast and wonderful it could be, and cynical hard-nosed executives of computer companies who joked that “parallel computing is the wave of the future, and always will be.” 

The pivotal example of this was the 1967 debate between Dan Slotnick (who spearheaded the experimental 64-processor ILLIAC IV at the University of Illinois) and Gene Amdahl (architect of the IBM System 360 line of mainframes).  Amdahl’s argument against parallel processing was devastating and was quickly embraced by an industry that dreaded the idea that they might have to rewrite millions of lines of software, retrain an entire generation of programmers and hardware designers, and backpedal on decades of hard-won experience with the traditional serial computing model: One memory, one processor, one instruction at a time.

Yet, the ILLIAC IV was a successful machine. It was the fastest supercomputer in the world for an unusually long time.  Believers in parallel programming formed a cult-like community of true believers for whom “Amdahl’s law”, as William Ware described it, was a constant thorn in their side. 

By the early 1980s, Seymour Cray was pushing against the limits of the laws of physics to support the serial programming model with his vector mainframes, and he ultimately reached the point where it was clear Cray Research Inc. would have to expose the programmer to a modest amount of parallelism, like two or four processors coordinated to run a single job. A Cray Research company executive said, unaware of the irony of his statement, “We want to get into parallel processing, but we want to do it one step at a time.”

Universities were less conservative about parallel programming. After the ILLIAC, the University of Illinois showed how a shared memory computer with many processors (CEDAR) could be built and programmed with the help of a sophisticated compiler. Caltech showed that a distributed memory system could be built by interconnecting a desktop full of personal computer parts (the Cosmic Cube) and programmed by passing messages between each PC-like computing node.

Smaller companies became infected with the vision of the academics regarding parallel processing. They included FPS, Denelcor, Alliant, Thinking Machines, and nCUBE.  My own experiences at FPS and nCUBE led to a formulation of the counter-argument to Amdahl’s law that bears my name, but is really nothing more than the common-sense observation that problem sizes increase to match the computing power available, so the serial bottleneck actually shrinks instead of staying constant. That simple observation countered, at last, those who had been using Amdahl’s law to defend as scientific what really was an emotion-driven trepidation regarding parallel programming. In a very short time, IBM, Digital Equipment, Cray, and other giants in the computing industry announced plans for parallel computing products as contrasted with research projects. It was no longer the province of risky startup ventures; by 1990, parallel computing had become mainstream.

We are now in the “late adopters” stage of the technology adoption cycle laid out by Geoffrey A. Moore in his classic, Crossing the Chasm. The dust has settled on the field of parallel programming to the point that we now have community standards for parallel programming environments. Many independent software vendors ship software designed for massively parallel computer clusters in data centers. Universities routinely teach parallel programming as part of an undergraduate computer science curriculum. In a way, the war is over, and parallel programming won. But now comes Reconstruction, and that stage of the war is going very slowly. That is why this book is timely.

A technology director for the National Security Agency informed me that only about five percent of their army of programmers knows how to program in parallel. One reason that agency went after the Unified Parallel C model was that it seemed to raise, rather easily, the fraction of parallel-literate programmers to fifteen percent. A little effort went a long way, tripling their human resources for truly high-performance computing tasks.

Sequential and Parallel Programming with C and Fortran is exactly the right book to bring people up to speed with minimum discomfort, and with a choice of topics that will not soon go out of date. The MPI Standard presented in the book is the outgrowth of Caltech’s Cosmic Cube. Similarly, the OpenMP Standard explained here is the outgrowth of the CEDAR project of the University of Illinois. Those standards are here to stay, just as languages like Fortran and C are not likely to be completely displaced anytime soon; they absorbed new ideas throughout their history, incorporating them into revised standard definitions of their language.

The models for shared and distributed memory programming have similarly stabilized and rallied around OpenMP and MPI, so they, too, absorb new ideas as tweaks to a well-established standard. In other words, the thinking has finally converged in a part of computing technology that was once an extremely unsettled set of schools of thought that definitely did not work and play well together.

Lev Lafayette approaches the subject with just the right touch of Australian levity, increasing the readability of an admittedly dry topic.  He judiciously chooses the right amount of detail to cover the maximum amount of material in the smallest number of pages, imitating the classic Kernighan and Ritchie book that introduced the C language to a generation of programmers. Instead of listing the strict grammar rules, the author gives pointer about how you should write programs, the guidelines of style and clarity that are absent from a User’s Manual. If you only have time to read one book about parallel computing, this is it.


# Introduction

In many ways contemporary computing is an elaboration of mechanical automation and calculation, whose origins can date back at least to the Antikythera mechanism, from approximately 150 to 100 BCE, and was used for astronomical positions and calendaring. From there multiple chains of inquiry can be traced to the development of programmable automata, the feedback mechanism for sails on windmills, centrifugal governor originally for mills and steam engines, the Jacquard loom's logic board, and Charles Babbage's Analytical Engine. The honour of the first real programmer goes to Ada Lovelace, who theorised that the Analytical Engine could engage in logical computation of symbols as well as numbers and wrote the first program which calculated a sequence of Bernoulli numbers.

As the theoretical understanding of control theory was developed alongside relay logic and industrial electrification, telephony and switching fabrics underwent massive improvements in the twentieth century CE, which continues today.  In the field of programming, this correlates with the development of punched "Hollerith cards" to provide pre-programmed instructions to tabulating machines, The invention of von Neumann architecture which allowed instructions to be stored in computer memory, and the development of programming languages from individual machine code, to assembly languages, to higher level languages such as FORTRAN (1954) and C (1972). 

But in all of these cases, the logic and feedback mechanisms assumes sequential processing. This, of course, is perfectly in accord with the "time's arrow", as Arthur Eddington pithily described the assymetrical "one way property of time that has no analogue in space" (The Nature of the Physical World, 1928). The traditional, sequential, model of a program is to break down a problem into a discrete set of instructions, and to execute those instructions in turn. In terms of computational architecture, this would be carried out on one processor. 

Sequential programming is, of course, an incredibly important technological development for the species. However it does run into two major scalability issues. The first is a time-based limitation; if compute resources are available to conduct parallel processing it is inefficient to conduct them in sequence. The second is a task-based limitation; so many computational tasks are based on simulations of a parallel system, because so much of reality is a parallel system. Parallel programming extensions to sequential programming provides the opportunity to save time, solve more complex problems, and, in some cases, take advantage of distributed compute resources.

Fortunately, computational resources are now available to carry out parallel programming. This consists of developments in the traditional two areas of computing, hardware and software. From a hardware perspective, contemporary computer systems are almost invariably multicore and multiprocessor devices, and many of them are connected, whether through tight-coupling (e.g., clusters) or loosely-coupled (e.g., grids). From a software perspective a variety of tools exist that can treat multiple processors in a single system, whether it is through distributed and grid system (such as the @home projects, folding@home, seti@home etc), whether it is through thread-based parallelism, or whether it is through message passing paradigms.

This book is designed as a strong introduction to parallel programming and is primarily for people who have had some programming experience, particularly with C and Fortran. Designed as both a reference and a self-teaching guide, it begins with an exploration of computer architecture and contemporary trends that have lead to the increasing importance of parallel computation, along with potential limitations and implementations. In many ways this is the most time-dependent chapter of the book, due to the particulars of technological change.

Following this, the book provides a summary of some core sequential programming aspects in the C and Fortran programming languages, including a review of their fundamental structures, the use of variables, loops, conditional branching, along with various routines and data structures. For those who have a good grounding in either or both of these languages this will be very familiar territory. Whilst it is not meant to be even remotely an in-depth study in either language, it does contain a lot of advice for good programming practice, which is not just relevant for sequential programming, but especially also for shared and distributed parallel programming. 

One particular type of parallellism is the shared memory, multi-threaded approach. The most well-known implementation of this approach is the OpenMP (Open Multi-Processing) application programming interface, and is explored here. The relevant chapter covers the conceptual level of the OpenMP programming, especially the fork-join and work-sharing models, an elaboration on the various directives to include synchronisation and data scope issues, along with run-time libraries and routines and environment variables.

Moving from shared memory to parallel programming involves a conceptual change from multi-threaded programming to a message passing paradigm. In this case, MPI (Message Passing Interface) is one of the most popular standards and is used here, along with an implementation as OpenMPI. In this chapter core routines for establishing and closing communications worlds are explored, along with interprocess communication, and then collective communications, before concluding with multiple communication worlds.

Finally, relevant to sequential, multi-threaded, and message passing programs, is the issues of profiling and debugging. In particular the applications TAU (Tuning and Analysis Utilities), Valgrind, and GDB (GNU Debugger) are explored in some detail with some practical examples on how to improve one's code.

As a whole it must be reiterated that this book gives but a broad introduction to the subjects in question. There are, of course, some very detailed books on each of the subjects addressed; books on multicore systems, books on Fortran, books on C, books on OpenMP, MPI, debugging and profiling. Designed as two-days of learning material, this is no substitute for the thousands of pages of material that in-depth study can provide on each subject.

As with other books recently published in this series it is designed in part as a quick reference guide for research-programmers and as a workbook, which can be studied from beginning to end. Indeed, it is in the latter manner than a great deal of the material has been derived from a number of parallel programming courses conducted by the Victorian Partnership for Advanced Computing (VPAC). The content is deliberately designed in a structured manner, and as such can be used by an educator, including those engaging in self-education. Whether through instruction or self-learning it is highly recommended that a learner take the time to work through the code examples carefully and to be prepared to make plenty of errors. Errors are a very effective learning tool.

A number of sources directly contributed to this book, most obviously the official documentation for the OpenMPI API (OpenMP Application Programming Interface v4.0.2, 2015 and OpenMP Application Programming Interface Examples v4.5, 2015), the Open MPI implementation (Open MPI User Manual, 2013), the various debugging and profiling tools (e.g., TAU User Guide, 2015, Valgrind User Manual, 2015, Debugging with GDB, 2015).  Credit must also be given to the influence of some timeless classics in the programming world, such as  George Pólya, How to Solve It (1945), Brian W. Kernighan and P. J. Plauger, The Elements of Programming Style (2nd edition, 1978), Brian W. Kernighan and Dennis Ritchie, The C Programming Language, (1978),Niklas Wirth Algorithms and Data Structures (1985), Michael Metcalf and John Reid, Fortran 90/95 Explained (1996), and Andy Oram, Greg Wilson (eds), Beautiful Code (2007).

Recognition is also given to the various training manuals produced at the Victorian Partnership for Advanced Computing over the years, and those from the Lawrence Livermore National Laboratory and the Edinburg Parallel Computing Centre. From the latter two the material (Parallel Programming, OpenMP, Message Passing Interface) all by Blaise Barney, are exceptional contributions to the field as is the course material from Elspeth Minty et. al., (Decomposing the Potentially Parallel, Writing Message Passing Programs with MPI). From the former, special thanks is given to Bill Applebe, Alan Lo, Steve Quenette, Patrick Sunter, and Craig West. 

I also wish to thank Matt Davis who reviewed this manuscript and publication prior to publication and for their excellent advice. All errors and omissions are my own.

Thanks are also given to the Victorian Partnership of Advanced Computing for the time and resources necessary for the publication of this book, and especially Bill Yeadon, manager of research and development, and Ann Borda, CEO, who authorised its publication.


This book is part of a series designed to assist researchers, systems administrators, and managers in a variety of advanced computational tasks. Other books that will be published in this series include: Supercomputing with Linux., Mathematical Applications and Programming., Data Management Tools for eResearchers., Building HPC Clusters and Clouds., Teaching Research Computing to Advanced Learners., Quality Assurance in Technical Organisations., Technical Project Management, and A History of the Victorian Partnership of Advanced Computing.


Lev Lafayette, Victorian Partnership for Advanced Computing, Melbourne, 2015


# 1.0 Current Trends in Computer Systems

## 1.1 Computer System Architectures 

High performance computing (HPC) is the use of supercomputers and clusters to solve advanced computation problems. All supercomputers, a nebulous term for computer that is at the forefront of current processing capacity, in contemporary times use parallel computing, the distribution of jobs or processes over one or more processors and by splitting up the task between them. 

It is possible to illustrate the degree and development of parallelisation by using Michael Flynn's Taxonomy of Computer Systems (1966), where each process is considered as the execution of a pool of instructions (instruction stream) on a pool of data (data stream). 

From this complex is four basic possibilities:

Single Instruction Stream, Single Data Stream (SISD)
Single Instruction Stream, Multiple Data Streams (SIMD)
Multiple Instruction Streams, Single Data Stream (MISD)
Multiple Instruction Streams, Multiple Data Streams (MIMD)

Single Instruction Stream, Single Data Stream (SISD)
(Image from Oracle Essentials, 4th edition, O'Reilly Media, 2007)

This is the simplest and, until recently, the most common processor architecture on desktop computer systems. Also known as a uniprocessor system it offers a single instruction stream and a single data stream. Whilst uniprocessor systems were not able to run programs in parallel (i.e., multiple tasks simultaneously), they were able or include concurrency (i.e., multiple logical tasks) through a number of different methods:

a) It is possible for a uniprocessor system to run processes concurrently by switching between one and another.

b) Superscale instruction level parallelism could be used on uniprocessors. More than one instruction during a clock cycle is simultaneously dispatched to different functional units on the processor. 

c) Instruction prefetch, where an instruction is requested from main memory before it is actually needed and placed in a cache. This often also includes a  prediction algorithm of what the instruction will be.

d) Pipelines, on the instruction level or the graphics level, can also serve as an example of concurrent activity. An instruction pipeline (e.g., RISC) allows multiple instructions on the same circuitry by dividing the task into stages. A graphics pipeline implements different stages of rendering operations to different arithmetic units.

### Single Instruction Stream, Multiple Data Streams (SIMD)

SIMD architecture represents a situation where a single processor performs the same instruction on multiple data streams. This commonly occurs in contemporary multimedia processors, for example MMX instruction set from the 1990s, which lead to Motorolla’s PowerPC Altivec, and more contemporary times AVE (Advanced Vector Extensions) instruction set used in Intel Sandy Bridge processors and AMD's Bulldozer processor. These developments have primarily been orientated towards real-time graphics, using short-vectors. Contemporary supercomputers are invariably MIMD clusters which can implement short-vector SIMD instructions. IBM is still continuing with a general SIMD architecture through their Power Architecture.

SIMD was also used especially in the 1970s and notably on the various Cray systems. For example the Cray-1 (1976) had eight "vector registers," which held sixty-four 64-bit words each (long vectors) with instructions applied to the registers. Pipeline parallelism was used to implement vector instructions with separate pipelines for different instructions, which themselves could be run in batch and pipelined (vector chaining). As a result the Cray-1 could have a peak performance of 240 MFLOPS  - extraordinary for the day, and even acceptable in the early 2000s.

SIMD is also known as vector processing or data parallelism, in comparison to a regular SIMD CPU which operates on scalars. SIMD lines up a row of scalar data (of uniform type) as a vector and operates on it as a unit. For example, inverting an RGB picture to produce its negative, or to alter its brightness etc. Without SIMD each pixel would have to be fetched to memory, the instruction applied to it, and then returned. With SIMD the same instruction is applied to all the data, depending on the availability of cores, e.g., get n pixels, apply instruction, return. The main disadvantages of SIMD, within the limitations of the process itself, is that it does require additional register, power consumption, and heat.

### Multiple Instruction Streams, Single Data Stream (MISD)

Multiple Instruction, Single Data (MISD) occurs when different operations are performed on the same data. This is quite rare and indeed debatable as it is reasonable to claim that once an instruction has been performed on the data, it's not the same anymore. If one allows for a variety of instructions to be applied to the same data which can change, then various pipeline architectures can be considered MISD. 

Systolic arrays are another form of MISD. They are different to pipelines because they have a non-linear array structure, they have multidirectional data flow, and each processing element may even have its own local memory . In this situation, a matrix pipe network arrangement of processing units will compute data and store independently of each other. Matrix multiplication is an example of such an array in an algorithmic form, where once a matric is introduced one row at a time from the top of the array, whereas another matrix is introduced one column at a time.

MISD machines are rare; the Cisco PXF processor is an example. They can be fast and scalable, as they do operate in parallel, but they are really difficult to build.

### Multiple Instruction Streams, Multiple Data Streams (MIMD)

Multiple Instruction, Multiple Data (MIMD) have independent and asynchronous processes that can operate on a number of different data streams. They are now the mainstream in contemporary computer systems and thus can be further differentiated between multiprocessor computers and their extension, multicomputer mutiprocessors. As the name clearly indicates, the former refers to single machines which have multiple processors and the latter to a cluster of these machines acting as a single entity.

Multiprocessor systems can be differentiated between shared memory and distributed memory. Shared memory systems have all processors connected to a single pool of global memory (whether by hardware or by software). This may be easier to program, but it's harder to achieve scalability. Such an architecture is quite common in single system unit multiprocessor machines. 

With distributed memory systems, each processor has its own memory. Finally, another combination is distributed shared memory, where the (physically separate) memories can be addressed as one (logically shared) address space. A variant combined method is to have shared memory within each multiprocessor node, and distributed between them.

### Divisions within MIMD

More recently further subdivisions within that category are considered. Specifically there are the taxons of Single Program Multiple Data streams (SPMD) and Multiple Programs Multiple Data streams (MPMD). These classifications have gained recent popularity given the widespread use of MIMD systems.

In the former case (SPMD), multiple autonomous processors execute the same program on multiple data streams. This differs from SIMD approaches which a single processor executes on multiple data streams. In the latter case (MPMD) the autonomous processors operate with at least two independent programs.

## 1.2 Processors, Cores, and Threads

### Uni- and Multi-Processors

A further distinction needs to be made between processors and cores. A processor is a physical device that accepts data as input and provides results as output. A uniprocessor system has one such device, although the definitions can become ambiguous. In some uniprocessor systems it is possible that there is more than one, but the entities engage in separate functions. For example, a computer system that has one central processing unit may also have a co-processor for mathematic functions and a graphics processor on a separate card. Is that system uniprocessor? Arguably not as the co-processor will be seen as belonging to the same entity as the CPU, and the graphics processor will have different memory, system I/O, and will be dealing with different peripherals. In contrast a multiprocessor system does share memory, system I/O, and peripherals. But then the debate will become murky with the distinction between shared and distributed memory discussed above.

### Uni- and Multi-core

In addition to the distinction between uniprocessor and multiprocessor there is also the distinction between unicore and multicore processors.  A unicore processor carries out the usual functions of a CPU, according to the instruction set; data handling instructions (set register values, move data, read and write), arithmetic and logic functions (add, subtract, multiply, divide, bitwise operations for conjunction and disjunction, negate, compare), and control-flow functions (conditionally branch to another address within a program, indirectly branch and return). A multicore processor carries out the same functions, but with independent central processing units (note lower case)  called 'cores'. Manufacturers integrate the multiple cores onto a single integrated circuit die or onto multiple dies in a single chip package.

In terms of theoretical architecture, a uniprocessor system could be multicore, and a multiprocessor system could be unicore. In practise the most common contemporary architecture is multiprocessor and multicore. The number of cores is represented by a prefix. For example, a dual-core processor has two cores (e.g. AMD Phenom II X2, Intel Core Duo), a quad-core processor contains four cores (e.g. AMD Phenom II X4, Intel i3, i5, and i7), a hexa-core processor contains six cores (e.g. AMD Phenom II X6, Intel Core i7 Extreme Edition 980X), an octo-core processor or octa-core processor contains eight cores (e.g. Intel Xeon E7-2820, AMD FX-8350) etc.

### Uni- and Mult-Threading

In addition to the distinctions between processors and cores, whether uni- or multi-, there is also the question of threads and its distinction from a process.  A process provides the resources to execute an instance of a program (such as address space, the code, handles to system objects, a process identifier etc).  An execution thread is the smallest processing unit in an operating system, contained inside a process. Multiple threads can exist within the same process and share the resources allocated to a process. 

On a uniprocessor, multithreading generally occurs by switching between different threads engaging in time-division multiplexing with the processor switching between the different threads, which may give the apperance that the ask is happening at the same time. On a multiprocessor or multi-core system, threads become truly concurrent, with every processor or core executing a separate thread simultaneously. 

## 1.3 Multithreaded Applications

One form of parallel programming is multithreading, whereby a master thread forks a number of sub-threads and divides tasks between them. The threads will then run concurrently and are then joined at a subsequent point to resume normal serial application.

One implementation of multithreading is OpenMP (Open Multi-Processing). It is an Application Programming Interface (API) that includes language directives for controlling multi-threaded, shared memory parallel programming behaviour. The directives are introduced by the program using a special syntax in the C or Fortran source code. In in a system where OpenMP is not implemented, they would be interpeted as comments. 

There is no doubt that OpenMP is an easier form of parallel programming compared to distributed memory parallel programming or directly programming for shared memory using shared memory function calls. However it is limited to a single system unit (no distributed memory) and is thread-based rather than using message passing.
	
### Why Is It A Multicore Future?

Ideally, don't we want clusters of multicore multiprocessors with multithreaded instructions? Of course we do; but think of the heat that this generates, think of the potential for race conditions, such as situations where multiple processes or threads are attemping to read or write to the same resources (e.g., deadlocks, data integrity issues, resource conflicts, interleaved execution issues).

One of the reasons that multicore multiprocessor clusters have become popular is that clock rate has pretty much stalled. Apart from the physical reasons, it is uneconomical. It's simply not worth the cost increasing the frequency of clock rate in terms of the power consumed and the heat dissipitated. Intel calls the rate/heat trade-off a "fundamental theorem of multicore processors". To express simply, the power increases for new processors around around the early to mid 2000s was increasing faster than the performance improvements gained. 

The partial solution to the issue was to pipeline power through additional cores, instead of trying to squeeze more and more transistors onto a single processor. As a result, modern processors are made up of multiple cores and system units typically consist of multiple, and often heterogeneous, processors. However this solution requires that programs know how to access and utilise these additional resources.

New multicore systems are being developed all the time. Using RISC CPUs, Tilera released 64-core processors in 2007, the TILE64, and in 2011, a one hundred core processor, the Gx3100. In 2012 Tilera founder, Dr. Agarwal, is leading a new MIT effort dubbed The Angstrom Project. It is one of four DARPA-funded efforts aimed at building exascale supercomputers, i.e., a system capable of at least one exaFLOP, or a billion billion calculations per second. The goal is to design a chip with 1,000 cores.

## 1.4 Parallel Processing Performance

### Speedup and Locks

Parallel programming and multicore systems should mean better performance. This can be expressed a ratio called speedup (c.f., C. Xavier, S. S. Iyengar, "Introduction to Parallel Algorithms", John Wiley and Sons, 5 Aug. 1998, pp52) 
        
Speedup (p) = Time (serial)/ Time (parallel)

This is varied by the number of processors S = T(1)/T(p), where T(p) represents the execution time taken by the program running on p processors, and T(1) represents the time taken by the best serial implementation of the application measured on one processor. 

Linear, or ideal, speedup is when S(p) = p. For example, double the processors resulting in double the speedup.

However parallel programming is hard . More complexity = more bugs. Correctness in parallelisation usually requires synchronisation, of locking is one common implementation. Synchronisation and atomic operations causes loss of performance, communication latency as they effectively make a portion of the program serial.  A probable issue in parallel computing is deadlocks, where two or more competing actions are each waiting for the other to finish, and thus neither ever does. An apocraphyl story of a Kansas railroad statue radically illustrates the problem of a deadlock:

"When two trains approach each other at a crossing, both shall come to a full stop and neither shall start up again until the other has gone."

A similar example is a livelock; the states of the processes involved in the livelock constantly change with regard to one another, none progressing. A real-world analogy would be two polite people trying to pass each other in a narrow corridor; on noticing that an impending resource conflict will occur (collision sense carrier detect, if you like), they both simultaneously move out of the way – and then back again with new collision potential. Both use up resources, are active, but progress no futher.

Locks are currrently manually inserted in typically programming languages; without locks programs can be put in an inconsistent state. They are usually included as a way of guarding critical sections. Multiple locks in different places and orders can lead to deadlocks. Manual lock inserts is error-prone, tedious and difficult to maintain. Does the programmer know what parts of a program will benefit from parallelisation? To ensure that parallel execution is safe, a task’s effects must not interfere with the execution of another task. 

### Amdahl's Law and the Gustafson-Barsis Law

Amdahl's law, in the general sense, is a method to work out the maximum improvement to a system when only part of the system has been improved. A very typical use - and appropriate in this context - is the improvement in speedup with the adding on multiple processors to a computational task. Because some of the task is in serial, there is a maxiumum limit to the speedup based on the time that is required for the sequential task - no matter how many processors are thrown at the problem. For example, if there is a complex one hundred hour which will require five hours of sequential processing, only 95% of the task can be parallel - which means a maximum speedup of 20X.

Thus maximum speedup is:

S(N) = 1 / (1-P) + (P/N)

Where P is the proportion of a program that can be made parallel, and (1 - P) is the proportion that cannot be parallelized (remains serial).

It seems a little disappointing to discover that, at a certain point, no matter how many processors you throw at a problem, it's just not going to get any faster, and given that almost all computational tasks are somewhat serial, the conclusion should be clear (e.g., Minsky's Conjecture). Not only are there serial tasks within a program, the very act of making a program parallel involves serial overhead, such as start-up time, synchronisation, data communications, etc.

However it is not necessarily the case that the ratio of parallel and serial parts of a job and the number of processors generate the same result, as the variation in execution time in the specific serial and parallel implementation of a task can vary. An example can be what is called "embarrassingly parallel", so named because it is a very simple task to split up into parallel tasks as they have little communication between each other. For example, the use of GPUs for projection, where each pixel is rendered independently. Such tasks are often called "pleasingly parallel". To give an example using the R programming language the SNOW package (Simple Network of Workstations) package allows for such parallel computations.

Whilst originally expressed by Gene Amdahl in 1967, it wasn't until over twenty years later in 1988 that an alternative to these limitations was proposed by John L. Gustafson and Edwin H. Barsis. Gustafon noted that Amadahl's Law assumed a computation problem of fixed data set size. Gustafson and Barsis observed that programmers tend to set the size of their computational problems according to the available equipment; therefore as faster and more parallel equipment becomes available, larger problems can be solved. Thus scaled speedup occurs; although Amdahl's law is correct in a fixed sense, it can be circumvented in practise by increasing the scale of the problem. 

If the problem size is allowed to grow with P, then the sequential fraction of the workload would become less and less important. A common metaphor is based on driving (computation), time, and distance (computational task). In Amdhal's Law, if a car had been travelling 40kmp/h and needs to reach a point 80km from the point of origin, no matter how fast the vehicle travels it will can only reach a maximum of a 80km/h average before reaching the 80km point, even if it travelled at infinite speed as the first hour has already passed. With the Gustafon-Barsis Law, it doesn't matter if the first hour has been at a plodding 40 km/h, this can be infinitely increased given enough time and distance. Just make the problem bigger!

(Image from Wikipedia)


# 2.0 Sequential Programming with C and Fortran


## 2.1 Fortran and C Fundamentals

Fortran and C are two of the most deployed programming languages in existence. Whilst languages do rise and fall in popularity, these two in particular have been in use since 1957 and 1972 respectively and are still in very active development. For those interested in scientific or high performance computing in particular, there can be little doubt that these will be of primary use for a significant period of time into the future, as they are they primary languages for implementations of shared memory parallelism (OpenMP) and message passing (MPI). Both languages are sufficiently important to have standards established by the ISO. Certainly they are not recommended for all programming activities; in many cases a simpler language such as a shell script, perl, python etc will be sufficient. But when it comes down to complex data structures, speed, and parallel processing, C and Fortran are the preferred choice.

The purpose of this chapter is not so much to provide an in-depth overview of the two languages. There are already many books that do this and are excellent in this regard. Rather, it is to provide a sufficient grounding that a reader who is unfamiliar with programming in these language, but does have some programming experience, is able to follow the code examples. More importantly at this stage however is the conceptual grounding provided in placing C and Fortran within the wide range of programming languages available, and in particular providing various suggestions on coding practice that should be followed for programs of any level of complexity.  Whilst this important for sequential programs, it is absolutely critical for any parallel programs.

Both Fortran and C have a particular history and implementations. As mentioned, Fortran was first implemented in 1957 by IBM and was quickly adopted as it was relatively easy to program and had a performance comparable to programs written in assembly language. Early versions included support for procedural programming. A significant development occurred in 1966 with a ANSI standard release, which would be elaborated in 1978 (known as FORTRAN77) with a release that supported structured programming with block statements. Early version of FORTRAN required six spaces before any commands were declared for operations with punch-card systems. 

The next major release was Fortran90 (ISO/IEC standard in 1991 and ANSI in 1992) which allowed free-form source and modular programming. Since then there has been a minor revision with Fortran95, a major revision with Fortran 2003 (ISO/IEC release in 2004), which included object-orientated programming and interoperability with C, and a minor release in 2008. Contemporary implementations are found in many compiler suites, such as the Gnu Compiler Collection (GCC), Intel, and the Portland Group. 

With regards to C, early implementations were limited to a small range of systems, and strongly tied to the development of the Unix operating system whose kernel was largely written in C. An informal standard was established with the first edition of The C Programmig Language by Brian Kernighan and Dennis Ritchie in 1978. In 1983 the American National Standards Institute began a process for standardisation which was completed in 1989, with formatting changes endorsed by the ISO/IEC in 1990. A minor amendment was introduced by both bodies in 1995, and a minor revision in 1999. Unicode support and improved multi-threading was introduced with a revision in the ISO/IEC 2011. Like Fortran, contemporary implementations are found in many compiler suites, such as the Gnu Compiler Collection (GCC), Intel, and the Portland Group. As is well known, there are a number of programming languages that have been heavily influenced from C, including C++, Objective C, and Java.

It is commonly, if incorrectly, stated that languages like C and Fortran are compiled languages as opposed to interpreted. Strictly speaking this is not quite true, as any programming language can be compiled or interpreted. Rather compilation or interpretation are implementations of a language, rather than an attribute of the language. Nevertheless, it is true to say that C and Fortran programs are typically compiled and are operated with the executable binary from the compiled source code, rather than having an interpreter performing operations from the source code, executing each step directly on the way. Interpretation does have some advantages, which will be explored in this book, but speed is not one of them.

Contemporary Fortran and C programming is often described as imperative, procedural, and structured. In imperative programming algorithms are implemented in explicit steps to change the program's state. This is often contrasted with declarative programming, that express the logic of a computation without describing its control flow, leaving that to the specific language. By procedural programming what is meant is a sub-type of imperative programming where the the program is built from one or more procedures (also referred to as routines or functions). The significant change in procedural programming is that state changes can be localised; this technique would provide the foundation for object-orientated programming. 

Finally, contemporary Fortran and C can both described as using a structured programming style. This makes extensive use of procedures and block structures rather than conditional jump branching (e.g., the goto statement). Structured programming is now extremely common to high level programming languages, as it is a powerful aid to readability and code maintenance. Structured programming also allows for greater ease in the development of pseudo-code, which should be requisite in any program of a non-trivial size, as it can replace non-unique expression calls to common functions. Writing pseudo-code should also be an aid for clarity in the program; programs that sacrifice clarity for cleverness are difficult to maintain.
	
An important attribute of programming languages is the implementation of types. These are the rules that the assign properties and interfaces to a variety of common constructs, such as variables, expressions, procedures, etc, which are then checked at compilation (static type checking), at run time (dynamic type checking), or a combination thereof depending on the construct. In principle typing prevents logical errors (particularly of the 'not even wrong' variety e.g., 2 + zebra / glockenspiel = homeopathy works!) and memory errors. Both C and Fortran check their typing at compilation, and are therefore statically typed. They both use manifest typing which requires explicit type identification by the programmer, rather than deducing the type from context or dynamically assigning it at runtime. With these contributions, C and Fortran are often colloquially classified as 'strongly typed', meaning that they are likely to catch type errors when compiled.

The examples throughout this chapter will use the GNU compiler suite version 5.2.0 (2015). Note that the assumed suffix for Fortran90 is .f90 – if you attempt to compile with just .f, the compiler will assume you're using FORTRAN77.

## 2.2 Program and Compilation

The classic 'Hello World' example can be expressed as source in Fortran and C as follows. 

In Fortran
```	
	program hello
		implicit none
		print *, "Hello world!"
	end program hello
```
In C

```
	#include <stdio.h>
	int main(void)
	{
	   printf("Hello, world!");
	   return 0;
	}
```

Both can be compiled respectively as follows, with the source file (.c or .f) creating an executable binary:

	`gfortran hello.f90 -o hellof`
	`gcc hello.c -o helloc`

Which can be run by invoked ./hellof or ./helloc as appropriate from the executable directory.

The basic compilation command runs the against a text files with the correct suffix (i.e., .c, .f90). In this situation the source files are assembled but not linked. Assuming that compilation is successful however, the compiled version is left in a file called a.out 

(image from David Marshall, Professor of Computer Vision, University of Cardiff, used with permission.)

However it usually far more convenient to use a -o and filename in the compilation to specify an output executable binary. 

The compiler translates source to assembly code, and the assembler creates object code (represented with the .o suffix). The link editor then combines and references library functions in other source files, creating an executable.

The two examples that follow illustrate the basic structure in Fortran and C languages. The use of the 'implicit none' in the Fortran example forces the programmer to declare all variables, which is certainly a good practice and should be regarded as compulsory. (The requirement dates back to historic versions of FORTRAN where variable names starting with i, j, k, l, m, or n, were integers and others were reals). The #include <stdio.h> is a preprocessor directive and tells the C compiler to find the standard input-output header called and include it to this program. This is followed by the main function which takes no parameters (and protects itself with the `void` type), with the printf function within it, a statement which is terminated by a semicolon. The return 0 in the C main function indicates to the operating system that the program has completed successfully. 

In C, the comment block can be multi-line. In Fortran each line (or inline) comment needs to be initiated by the exclamation mark. Comments should introduce the program and be applied sufficiently to improve the readability of the code; and wary of over-commenting. The argument that comments should be used liberally to improve readability is simply not true. Liberal use of comments can reduce readability. The best criteria for commenting is that it is complete enough to make it clear to probable readers – especially and primarily the authors of the code - and that is is correct (i.e., the comments and the code agree). Commenting certainly proves its worth months later when code will be revised and often by different people to the original authors. Often various hacks are commented to explain what was done and why. Whilst this is better than leaving the change without comments, it is better still to rewrite the code. Of course this isn't always available. Sometimes other code or compilers that are controlled by other people require various workarounds. In which case, make this explicit.

Functions, subroutines, procedures, modules, subprograms - all are a part of the decomposition of tasks in a program, which breaks down a complex program into more understandable and maintainable parts, and as result are the most important feature of the structured programming paradigm. It reduces repetition of code within a program, provides easier means for code re-use across multiple programs, and improves debugging by providing clarity in traces. Such methods provide the instructions of a specific task as a single unit and like the main program itself should also be introduced with a comment, especially to note the input and output parameters and their purpose. Function names should illustrate the activity of the function. Also, develop an awareness of existing libraries; it is much easier to use code that is already written.

Arguments to subprograms are called by value or reference in C and Fortran. In Fortran a procedure is defined as a group of statements that perform a well-defined task and can be invoked from the program. A function is a type of procedure that returns a single value. In contrast a subroutine does not return a value, but can modify the arguments parsed to it. In C, what Fortran would call a procedure, function, or subroutine, are just called functions. In Fortran, a module is a separate collection of different functions and subroutines are kept and can be invoked by the `use modulename` command. In C the equivalent can be achieved by  preprocessor directives.

```	
	program program-name 
	! comments
		implicit none 
		[specifications] 
		[execution] 
		[subprograms] 
	end program 

	/* Comments */
	#include <stdio.h> 
	#include other pre-processor directives 
	global declarations 
	main() 
	{ 
	local variables to function main ; 
	statements associated with function main ; 
	return 0; 
	} 

	function1..n() 
	{ 
	local variables to function 1..n ; 
	statements associated with function 1..n ; 
	} 
```

## 2.3 Variables and Constants

A strength of a programming language is its capacity to employ symbolic identifiers which references storage locations that holds a value; the compiler will replace the symbolic identifier with the actual location of the data. These values can be variable or constant and have a data type. The typical datatypes used in programming languages, including C and Fortran, include integers, floating-point numbers, logicals, characters and strings, with certain elaborations which will be explained soon.

The basic principle is that variables have a great deal of flexibility, whereas constants can provide form of self-documenting code, and provide checks that constancy assumptions are not violated. They also provide a means by which literals (e.g., a number or string) can be easily referred to and updated if necessary. In both cases of these value assignments, the symbolic identifier should be both meaningful and unique, avoiding confusion between other identifiers in the code. Longer and more explicit names are preferable to shorter obscure identifiers which can be ambiguous even within the same area of inquiry e.g., does an identifier named APC 'activated protein C', 'adenomatous polyposis coli', or 'argon plasma coagulation'? (From: "Abbreviation and Acronym Disambiguation in Clinical Discourse", AMIA Annual Symposium Proceedings. 2005; 2005: 5899-593). One method to assist in this is to stringently avoid having too many temporary value identifiers, typically applied to variables. 

As with any programming languages there a limits to what characters can be used as symbolic identifiers. In general it is easier for all concerned to use only the alphanumeric range and underscores, and to start identifiers with letters. In C, identifiers are case sensitive (e.g., `example` and `EXAMPLE` are different), whereas in Fortran they are case insensitive (e.g., `example` and `EXAMPLE` are the same), except for string literals. The use of reserved words, which have a special meaning the context of the language in question, is forbidden; Fortran has around seventy of these and C about half that number.

Attentiveness to value scope is extremely important as it defines where it may be used and in run-time the extent that it has a meaningful value; this is most typically defined as either globally (indefinite scope) or within a subprogram. As mentioned uniqueness in identifiers is an essential practice; a program will result in error if there are multiple identifiers with the same name in the same scope. This requires some knowledge of the identifiers used in header files that are used by a program as well as those that are used within a program.

In all cases the value should be assigned prior to use, i.e., scope should not begin prior to extent, otherwise the unitialised value may have an undefined value. A variable whose extent outlasts its state can result in a memory leak, resulting in the program to eventually cause errors or cease functioning. Contemporary Fortran implementations will manage values within the scope of the entity; in C memory management is typically manual, using the standard library functions malloc() and free(), to allocate and free memory blocks respectively.

The previous 'Hello World' program can thus be expressed in Fortran and C with symbolic identifier values as follows: 

```
	program hello2 
		implicit none 
		character(len=16) :: greetings 
		greetings = "Hello World!" 
		print *, greetings 
	end program hello2 

	#include <stdio.h> 
	int main(void) 
	{ 
	   char greetings[] = "Hello world!"; 
	   printf("%s\n", greetings); 
	   return 0;
	}
```

Or, as an alternative using named constants.

```
	program hello3 
		implicit none 
		character(len=16), parameter :: greetings = "Hello World!" 
		print *, greetings 
	end program hello3

	#include <stdio.h> 
	int main(void) 
	{ 
	   char greetings[] = "Hello world!"; 
	   printf("%s\n", greeting); 
	   return 0;
	}
```

As the previous example – one last time - both can be compiled, with the source file (.c or .f) creating an executable binary:

`gfortran hello2.f90 -o hellof2`
`gcc hello2.c -o helloc2```

`gfortran hello3.f90 -o hellof3`
`gcc hello3.c -o helloc3`

The resulting executable can be run by invoking `./hellof2` or `./helloc2` as appropriate from the executable directory.

A pointer is a special type of variable. Whereas other variables are assigned to a data type, a pointer is assigned to the memory address of another variable. In Fortran, a pointer also contains other information about a variable, including type, rank, and extents, as well as the memory location. Like any other variable, a pointer has to be declared. Strictly speaking, the data type of the value of all pointers, whether integer, float, character, or otherwise, is the same, a long hexadecimal number that represents a memory address. It is good practice to assign a NULL value to a pointer variable if the address is not initially known. The general format in C and Fortran is as follows:

`type *variable_name;`
`integer, pointer :: p1`

## 2.4 Data Types and Operations

As previously mentioned, both C and Fortran are considered strongly-typed and statically-typed languages. The basic types in C are `char`, an integer type of usually of a single byte, `int`, an integer with a typical range of around -/+2.1 billion ; `float`, a single-precision floating point value (i.e., occupies a 32-bit of memory) ; `double`, a double-precision floating point value (i.e., occupies a 64-bit of memory); and void, a sort of null-set in for type definitions. In Fortran the basic types are `integer`, `real`, `complex`, `logical`, and `character`. In Fortran the size of a numeric type can be set by the use of `kind` with the bytes specified. For example, the value `integer(kind=16)` would be a 16-byte integer – a very large number indeed. 

In C strings are an array terminated by a null character which is inserted by the compiler at initialisation. The array length is determined at declaration, with `char[]` of undetermined length. C supports a range of string functions, including `strcat(string1, string2)`, which concatenates the two strings., and `strcopy(string1, string2)`, which copies string2 into string1 - an interesting reverse of the standard Unix argument of source first then destination. Incorporate the string.h preprocessor directive when making use of these functions. To print a range of from a string use a string format. The following code illustrates these examples;

```
#include <string.h>
#include <stdio.h> 
int main(void) 
{ 
   char salutation[] = "Hello "; 
   char place[] = "World!"; 
   strcat( salutation, place);
   printf("%s\n", salutation);
   printf("%.14s\n", &salutation[6]); 
   return 0;
}
```

In Fortran a string is represented as an array of characters with a length specified and a default of 1 character, or an unspecified length with `(en=*)`. Strings can be concatenated with the `//` operator, and the `trim` function will removed any trailing blanks. Strings can be extracted by specifying the character range extent  Using the above examples, the following code snippet will illustrate:

```	
	character(len=8) :: salutation
	character(len=8) :: place
	character(len=16) :: fullgreetings 
	salutation = "Hello "
	place = "World!"
	fullgreetings = salutation//place 
	print *, trim(fullgreetings) 
	print *, fullgreetings(7:11)
``` 

Both C and Fortran follow a general syntax of declaring value types then the values in statement. After a variable has been declared, it should be assigned an initial value. Only after that should it be manipulated and displayed.  Special care is required when manipulating and displaying data types. In C and Fortran there is no automatic type conversion; dividing 10 by 3 will result in 3, dividing 7 by 8 will result in 0! But mixing integers with reals will convert the integers to reals. A more precise result requires the use of real number types, but of course, even that is subject to arbitrary limits; a third multiplied by a third does not equal 1 – as a real type can only approximate a third, rather than present 0.333..n. A very important lesson for this is that floating point numbers should not be compared for equality!

When printing to standard output in Fortran, the `*` that follows the initial print statement is an argument to output the data in a format that is equivalent to the items that follow the comma delimited list. In C that the standard display function, printf, can vary the formatting that is displayed. In previous examples the `%d` specifier indicates that external data is required. In the following example, the `%f` specifier displays a floating point number in decimal notation. Other common options include `%e` or `%E` for scientific notation, and `%g` or `%G` for the shorter of decimal or scientific notation.

```
program variableManipulation
implicit none

   ! declaring variables
   character(len=55) :: message
   integer :: integer_1, integer_2, wrong_divide;
   real :: real_1, real_2, rough_divide;
   
   ! assigning values
   message = "This program displays variables of different types" 
   integer_1 = 10
   integer_2 = 3
   wrong_divide = 0
   real_1 = 10.0
   real_2 = 3.0
   rough_divide = 0.0

   ! displaying variables	
   print *, message
   wrong_divide = integer_1 / integer_2
   print *, "The wrong divide result is : ", wrong_divide
   rough_divide = real_1 / real_2
   print *, "The rough divide result is : ", rough_divide

end program variableManipulation
```

```
#include <stdio.h>

/* Variable declaration */
int integer_1, integer_2, wrong_divide;
float real_1, real_2, rough_divide;

int main (void) 
{
   /* variable initialisation */
   char message[] = "This program displays manipulated variables"; 
   integer_1 = 10;
   integer_2 = 3;
   real_1 = 10.0;
   real_2 = 3.0;
   wrong_divide = 0;
   rough_divide = 0.0;
   
   /* variable manipulation and display */
   printf("%s\n", message); 
   wrong_divide = integer_1 / integer_2 ; 
   printf("The wrong divide result is : %d \n", wrong_divide);
   rough_divide = real_1 / real_2 ;
   printf("The rough divide result is : %f \n", rough_divide);
   return 0;
}
```

Programming languages like C and Fortran can provide operations on variables and constants with results depending on the data type. The common operations to both languages which are discussed here are arithmetic, logical, and relational. C also has some assignment operations which will be described here in context, along with bitwise operations (logical expressions applied on the bit-by-bit level), and ternary operations, pointer assignments, and others, which will be mentioned only in passing. The following tables illustrate the different operations allowed in the two languages. Note that in Fortran there is two types of relational operations. If an expression appears to be overly complex, consider using propositional logic for transformation rules to make the statements clearer.

### Arithmetic Operators

C Operator Fortran Operator Description
+ +  Addition Operator, adds two operands.
- -  Subtraction Operator, subtracts second operand from the first.
* *  Multiplication Operator, multiplies first and second operands.
/ /  Division Operator, divides first operand by the second
**  Exponentiation Operator, raises first operand to the power of the second.
% Modulus Operator, the remainder of after an integer division of the first operand by the second.
++ Increment the integer value of the operand by one.
-- Decrement the integer value of the operand by one.

C also has assignment operators which are worth mentioning in this context. These include +=, -=, *=, /=, %=. In each of these a value becomes equal to the left-side value with an operation on a right-side operand (e.g., A =+ B is A = A + B etc). 

### Relational Operators

C Operator Fortran Operator Description
== == eq.  If the values of two operands are equal, then the condition is true.
!= /= .ne.  If the values of two operands are not equal, then the condition is true.
> > .gt. If the value of first operand is greater than the value of second operand, then the condition is true.
< < .lt.  if the value of left operand is less than the value of right operand, if yes then condition becomes true.
>= >= .ge.  Checks if the value of left operand is greater than or equal to the value of right operand, if yes then condition becomes true.
<= <= .le. 

Checks if the value of left operand is less than or equal to the value of right operand, if yes then condition becomes true.

### Logical Operators

C Operator Fortran Operator  Description
&& .and.  If both the operands are true, then the condition is true. 
|| .or.  If either of the operands is true, then the condition is true. 
! .not.  If an operand is false, it becomes true, else if true, it becomes false.
.eqv.  If an first and second operands are of equivalent values, the condition is true.
.neqv. If an first and second operands are not of equivalent values, the condition is true.

## 2.5 Loops and Branches

A statement or block of statements may be executed several times as a loop in both C and Fortran. The general rule is that a loop tests against a condition and, if the condition is true, executes a code block. If it is not true, it programs continues to the next statement. There are however some variations on this.

A for loop (C), or do loop (Fortran), executes a sequence of statements multiple times and abbreviates the code that manages the loop variable. The loop initialises a value, tests a conditional statement, if true it carries out a code block, and incremements the value. If false it continues to the next statement. The following code snippet, elaborating from the previous 'Hello World' variable examples, illustrates the loop in action. Note the slight difference in the loop conditional range. Always be careful with "off by one" values.

```
/* Prints 'Hello World' ten times */
int countera;   
for ( countera = 1; countera < 11; countera = countera + 1 )
	{
	printf("%s\n", greetings); 
   	}

```

```
! Prints 'Hello World', ten times
integer :: countera
do countera = 1, 10
	print *, greetings   
end do
```

A variation in the while loop (C) which repeats a statement or code block while a given condition is true, testing the condition before executing the loop statement or block. The following code snippet illustates an example:

```
/* Prints 'Hello World' ten times */
int counterb = 1;
while( counterb < 11 ) 
	{
	printf("%s\n", greetings); 
	counterb++;
	}
```

In contrast the do-while loop, common to C and Fortran, will also repeat a statement or code block a given condition is true. In C however, unlike the do loop, it tests the condition at the end of the loop body. Importantly this means that it will always carry out the conditional statement or code block at least once. In Fortran however the initial condition is tested the block is carried out while the condition is true.The following code snippets illustrate examples:

```
int counterc = 99;
/* Prints 'Hello World' once
do {
	printf("%s\n", greetings); 
	counterc++ ;
   }
while( counterc < 11 );
! Doesn't print 'Hello World'
integer :: counterc
counterc = 99
   do while (counterc <= 11)       
	print *, greetings   
   end do 
```

As should be expected, more complex loops can be created by nesting any variety of loops within loops. C has a `break` statement and Fortran a `exit` statement, both of which will terminate a loop and exit, transferring execution to the statement following the loop. The `continue` statement in C or the `cycle` statement in Fortran will cause the loop to skip the rest of the code block and return to the conditional statement for the next iteration. 

Loops are, in many ways, a decision making structure. A condition is tested, and if the condition is true, a code block or statement is carried out over multiple iterations under the condition is no longer true. Different decision making branches are also available in C and Fortran if a condition is true and sometimes with alternative statements or code blocks to be executed if the condition is determined to be false.

In C the `if` statement carries out a code block if a logic expression is true. The equivalent in Fortran is `if-then`. If the expression is not true then the code continues to the next statement. The following two code snippets, using prior examples, illustrate their use:

```
int time = 700;
   if( a > 630 ) {
	printf("%s\n", greetings); 
   }

integer :: time = 700
	if (time > 630 ) then
	print *, greetings
	end if
```

The `if` and `if-then` conditional branches can be extended with an optional `else` statement to provide an alternative statement or code block if the logical expression is false.

```
char sleeping[] = "Zzzzzzzz"; 
int time = 700;
   if( a < 630 ) {
	printf("%s\n", sleeping); 
   }
   else {
	printf("%s\n", greetings);
   }

character(len=16), parameter :: sleeping = "Zzzzzzzz" 
integer :: time = 700
	if (time < 630 ) then
	print *, sleeping
	else
	print *, greetings
	end if
```

The `if-else` and `if-then-else` conditional branches can be extended further with additional optional `else` statements to provide even more alternative statements or code blocks. Note that the conditional branch will execute on the first logical expression that is true, therefore the order of options is important.

```
char sleeping[] = "Zzzzzzzz"; 
char waking[] = "I need coffee"; 
int time = 700;
   if ( a < 630 ) {
	printf("%s\n", sleeping); 
   }
   else 
   if ( a < 730 ) {
	printf("%s\n", waking);
   }
   else {
	printf("%s\n", greetings);
   }

character(len=16), parameter :: sleeping = "Zzzzzzzz" 
character(len=16), parameter :: sleeping = "I need coffee" 
integer :: time = 700
	if (time < 630 ) then
	print *, sleeping
	else
	if (time < 730 ) then
	print *, waking
	else
	print, 
	print *, greetings
	end if
```

C also has the `?` operator, which take the following form:

Expression1 ? Expression2 : Expression3;

In this situation Expression1 is evaluated; if it is true, then Expression2 is evaluated and becomes the value of the entire ? expression. If Expression1 is false, then Expression3 is evaluated and its value becomes the value of the expression.

Laddered `if-else` statements can be replaced with `switch-case` or `select-case` conditional statement in C or Fortran respectively. Like the nested statements the program will execute the first logical expression that evaluates true. However, in C (but not modern Fortran), the control will also "falls through" to the next statement and executes that as well, unless the case is terminated by a break statement. The use of `switch-case` or `select-case` statements are generally recommended in preference to complex ladders for clarity in code and also more efficient compilation speed. Indeed, complex branching should be avoided if possible.

Note that relational operators are not allowed as case labels. Case labels are constant expressions only. Some compilers (e.g., GCC) allow for an extension for a range of values, which the following examples illustrate.

```
switch(time) {
	case 0 ... 630 :
	printf("%s\n", sleeping); 
	break ;
	case 631 ... 730 :
	printf("%s\n", waking); 
	break ;
	case 731 ... 2400 :
	printf("%s\n", greetinsg); 
	break ;
	default :
	printf("You're not on earth!\n");
   }

select case (time)
      case (0:630) 
	print *, sleeping
      case (631:730)
	print *, waking
      case (731:2400) 
         print*, greetings 
      case default
         print*, "You're not on earth!" 
end select
```

In both C and Fortran 'switch-case` or `select-case` statements can be nested.

## 2.6 Data Structures

Data structures are the means to arrange data efficiently, both in terms of speed of computation and program clarity. Some basic data structures in C and Fortran are explored here, including arrays and structures. An array is a data structure which holds a sequential collection of elements of the same data type, whereas a structure is a program-defined data strcuture combine data items of different data types.

With an array provision is available to declare associated variables in a simpler manner; instead of declaring each variable individual (e.g., variable_1, variable_2, variable_3 etc), it is possible have them associated with a common name and as elements from a single declaration (e.g., variable[1], variable[2], variable[3] etc). In C and Fortran a string is a variable array of the character type; on a low-level array elements are held in contiguous memory locations, where the lowest address corresponds to the first element and the highest address to the last element.

To declare an array the type is specified followed by the array's name as a symbolic identifier and then the number of elements. The number of elements must be an integer constant greater than zero, for fairly obvious reasons. The array can be initialised by a single statement or element-by-element. The former is typical when a program is initially written and the latter during run-time by assignment (e.g., a loop generating the values). In both C and Fortran the individual elements of an array can be referenced by the numbered order.

Examples of an array have already been shown with strings as an array of characters, i.e., in C and Fortran respectively: 

`char greetings[] = "Hello world!"; `

`character(len=16) :: greetings` 
`greetings = "Hello World!"` 

Array elements are assigned slightly differently in their non-character form in Fortran with use of the dimension declaration. e.g.,

`integer, dimension(4) :: melencolia_row1`
`melancolia_row1 = (/16, 3, 2, 13 /)`
`! In Fortran 2003 you can use melancolia_row1 = [16, 3, 2, 13]` 

An array can be passed as an argument to a function or procedure. The parameters must be declared, either as a pointer or an array.  For example, consider the following code snippet:

`double thefunction (int array[], int size);`
`int thearray[5] = {1, 2, 3, 4, 5};`
`double functionresult;`
`functionresult = thefunction( thearray, 5 ) ;`

`integer, dimension (5) :: thearray`
`thearray = 	(/1,2,3,4,5/)`
`call theprocedure (thearray)`

Both C and Fortran allow for multi-dimensional arrays, which is particularly handy for matrix mathematics. In C the declaration and initialisation is similar, with type, name, but followed with elements of each dimension, one row at a time. It could also be presented as a single line and the compiler would work out the row-breaks when appropriate. In Fortran, the transformational functions `shape` and `reshape` are used - note that column order is used. To have row order use the `transpose` function as Fortran uses column-primary order.

Consider the following from the magic square in Albrecht Dürer's Melencolia I (1514) engraving, as code snippets. 

```
int melancolia [4][4] = {  
   {16, 3, 2, 13} ,   
   {5, 10, 11, 8} ,  
   {9, 6, 7, 12} ,  
   {4, 15, 14, 1} ,  
};
```

`integer, dimension(4,4) :: melancolia`
`melancolia = transpose(reshape((/16, 5, 9, 4, 3, 10, 6, 15, 2, 11, 7, 14, 13, 8, 12, 1 /), shape(melancolia)))`

The following elaborations (melancolia.c and melancolia.f90) will print out each element of the array. Note the formatting statement used in Fortran, which is presented here an alternative to the nested for loop in C. In previous examples the print statement has used the default format string `*` has been used. In this instance the format is `1x`, and `4I5/`. The first part introduces a blank space; the latter part creates four instances of a 5 character width integer descriptor followed by a blank line.

```
#include <stdio.h>
int main () {
int melancolia [4][4] = {  
   {16, 3, 2, 13} ,   
   {5, 10, 11, 8} ,  
   {9, 6, 7, 12} ,  
   {4, 15, 14, 1} ,  
};

int row, column;

   for ( row = 0; row < 4; row++ ) {
      for ( column = 0; column < 4; column++ ) {
         printf("melancolia[%d][%d] = %d\n", row,column, melancolia[row][column] );
      }
   }
   return 0;
}

program matrix
	
integer, dimension(4,4) :: melancolia
melancolia = transpose(reshape((/16, 5, 9, 4, 3, 10, 6, 15, 2, 11, 7, 14, 13, 8, 12, 1 /), shape(melancolia)))

print '(1x, 4I5/)', melancolia
   
end program matrix
```

A derived data type, or structure, consists of an objects that has different characteristics of different types. A type name is provided with the declarations of the data types contained in the structure. A very common example of a structure would be the objects in a person's  book collection. Structure objects then can be declared and specified. This can be expressed in C and Fortran as follows:

```
struct book {
   char  title[50];
   char  author[50];
   char  subject[100];
   int	 isbn
};

struct book book1;        /* Declare Book1 of type Book */
..
/* book 1 specification */
strcpy( book1.title, "Sequential Programming with C and Fortran");
strcpy( book1.author, "Lev Lafayette"); 
strcpy( book1.subject, "C, Fortran, OpenMP, MPI");
book1.isbn = 9780994337313;

type book
   character(len=50) :: title
   character(len=50) :: author
   character(len=150) :: subject
   int :: isbn
end type book

type(book) :: book1 
..
book1%title = "Sequential Programming with C and Fortran"
book1%author = "Lev Lafayette"
book1%subject = "C, Fortran, OpenMP, MPI"
book1%isbn = 9780994337313 
```

## 2.7 Input and Output

Input is data sent to a program from an external source, whether from the operating system's standard input (e.g., the keyboard) or from a file. Output is data sent to an external source, such as standard output (e.g., a terminal) or a file. Both C and Fortran have a number of input-output functions to read input and send output.

In C, the `getchar()` and `putchar()` functions reads the next available character from standard input and sends it to standard output respectively, one character at a time, which can be elaborated into the `char *gets(char *save)` to read a line to the buffer `save` until a terminating newline, with the `int puts(const char *save)` writing the buffer to standard output. Commonly `int scanf(const char *format, ...)` reads from standard input stream according to the format provided, where as `int printf(const char *format, ...)` writes to standard output stream according to the format provided. Format can be a simple string, but can be specified as `%s`, `%d`, `%c`, `%f`, to print or read strings, integers, characters or floats respectively.

In Fortran, variables of a specified type can be read in freeform from standard input with `read (*,*) var1, var2` statememt, and can be written to standard output or a file with `write (*,*) var1, var2`. The `print` statement, used throughout this chapter, is a specialised form for writing to standard output alone. Formatted input and output is achieved with the three commands, followed by a format specification and the variable list. The common format specifications depend on the data type; `I` for integers, `F` for real numbers, `E` for exponential notation, `A`, for character output, `X` for spaces, and `/` to insert blank lines. For integers, a value is placed optionally before the specifier to indicate repetition, and a value afterwards for integer width. For reals and 
exponents, the integer width is replaced with a decimal width value (e.g., F3.3 = xxx.xxx).

```
#include <stdio.h>
#include <math.h>

int main()
{
   char str[80];
   sprintf(str, "Value of Scientific Notation Pi = %E", M_PI);
   puts(str);
   sprintf(str, "Value of Decimal Floating Point Pi = %f", M_PI);
   puts(str);
   return(0);
}

program pidisplay
   pi = 3.14159265359
   print "(f6.3)", pi 
   print "(f9.6)", pi
   print "(e16.10)", pi 
end program pidisplay
```

In addition to reading from standard input and printing to standard output, both Fortran and C have file reading and writing functions. In C, the `fopen()` function creates a new file or opens and existing file. An object of the type `file` is initialised with an access mode specified; `r` read, `w` write, `a` append, or `r+`, `w+`, `a+`, for reading and writing. To close a file, the `fclose()` function is invoked. Reading a file can be achieved by a single character function `fgetc()`, an input stream to n-1 characters with the function `fgets()`. Writing to a file is achieved with the function for individual characters, `fputc()`, null-terminated strings `futps()`. In comparison Fortran uses the `open`, `write`, `read`, and `close` statements to read and write data streams to files. The `open` command which requires parameters for a file identifier as an integer, which is repeated with the `read`, `write` and `close` command.  

Expressed in a general form the C and Fortran functions follow. A lengthier example is included with the files the accompany the book.

```
   FILE *fp;
   char buff[255];
..
   fp = fopen("/tmp/hello.txt", "a+");
   fprintf(fp, "This is testing for fprintf...\n");
   fputs("This is testing for fputs...\n", fp);
   fscanf(fp, "%s", buff);
   printf("1 : %s\n", buff );
   fgets(buff, 255, (FILE*)fp);
   printf("2: %s\n", buff );
   fgets(buff, 255, (FILE*)fp);
   printf("3: %s\n", buff );
   fclose(fp);

open (unit = 1, file = "/tmp/hello.txt").
open(1, file='/tmp/hello.txt', status='old')  
read(1,*)
write(1,*)
```

## 3.0 Shared Memory Parallel Programming with OpenMP

### 3.1 Shared Memory Concepts and the OpenMP Implementation

As mentioned in the first chapter, a tread is the smallest instruction set managed by an operating system. Whilst a process is allocated resources, such as memory, multiple thread can exist in the same process sharing instructions, context (e.g., variables), and resources. In a unicore environment, the operating system may be able to manage multithreaded concurrency by switching between different threads. In a multicore system however, multiple threads can be executed in parallel. The distinction between concurrency and parallelism is emphasized, and illustrated as subsets. Within the set of all programs there is a subset that are concurrent programs. Within the set of concurrent programs, there is a smaller set of parallel programs.

Whilst concurrent programs have advantages over single-threaded programs, multi-threading has greater advantages. A multi-threaded progam can have faster execution on multicore systems. It can also be more responsive with some careful design; on a single-threaded program if the main executation thread takes time, then the entire program must also be follow suit. In a multi-threaded program long-running tasks can be moved to a seperate thread allowing the program to be responsive in other threads. However, as mentioned in the first chapter, multi-threading does however have the issue of race conditions, deadlock, and livelocks. It also suffers the problem that if a thread crashes, can causes the entire process to crash.

The earliest appearance of multithreading was in the System/360 IBM mainframe computer in 1964 with Multiprogramming with a Variable number of Tasks (MVT), although it was not publically available until 1967 due to numerous bugs. MVT treated all non-operating system memory as a single pool, a shared memory space, which allowed for simultaneous application and system operations. At the time the System/360 lacked memory relocation hardware. Instead, a it used a Rollout/Rollin process that could swap a running job out to secondary storage to make its memory available to another job. The rolled-out job would, however, have to be "rolled-in" to the original memory locations when they again became available. In 1971 a Time Sharing Option for MVT was added which included an editor, the ability to submit batch jobs, and receive notification and results.

When seeking to parallelise code, a programmer needs to review existing sequential programs to find sets of statements that can be conducted simultaneously. This is a painstaking and serious process. The advantages of parallelism are often quite sufficient to make it worthwhile, but issues such as race conditions and locks must be scrupulously avoided. Occasionally a programming problem is relatively easy to turn in to parallel code, usually when there is little need for communication between the tasks (e.g., Monte Carlo experiments). In most such cases, distributing the tasks into loops is typical. Such problems are referred to as “embarrassingly parallel” on the grounds they are so simple, although increasingly there is a move to describe such problems as “pleasingly parallel”, as is so joyful to find them. This author has suggested a combination with “embarrassing pleasures”! 

A fork-join approach can be used in multithreading. This is the method used by OpenMP and also with POSIX threads (pthreads). The basic idea is that a program's execution branches off in parallel threads at specified points in the program and joins and merges at a subsequent specified point, returning to serial execution. In the OpenMP implementation, a master thread contains the instructions that are to be executed in parallel and executes additional worker threads that divide the task among them. The 'specified point' for forking is marked with a preprocessor directive and each thread has an individual identity attached to it. After the execution of the parallel, the threads join back into the master thread.

(image from Wikipedia, user: Qwetyus)

OpenMP is an application programming interface, an elaboration of existing programming languages (specifically C and Fortran). The standards are governed by The OpenMP Architecture Review Board (ARB) which was formed in 1997 as a non-profit organisation from DEC, IBM, and Intel, and motivated by a common need to standardise coding for symmetric multiprocessing systems (SMPs). From the 1980s onwards SMP vendors had been developing special and different notation to distribute tasks between individual SMP processors and to provide a framework for access order. As if often the case in such situations, there are many good ideas from the diverse range of sources, but little portability and standardisation.

The first API for OpenMP was developed for Fortran in 19917, and for C/C++ in 1998. In 2000 a new major version release occured for Fortran specification, with C/C++ specification in 2002. A single API was developed for the two language families in version 2.5 in 2005. Version 3.0 was released in 2008 which included in the new features tasks and the task constructs. In 2013 version 4.0 was released which included support for accelerators, sequentially consistent atomics, improved error handling, thread affinity, additional tasking extensions, SIMD, user defined reductions, and Fortran 2003 support. OpenMP is supported by compilers that support Fortran 77, Fortran 90, Fortran 95, Fortran 2003, ANSI 89 C or ANSI C++. However the OpenMP specification does not introduce any constructs that require specific Fortran 90 or C++ features 

As an organisation, the OpenMP Architecture Review Board, currently consists of thirteen permanent and thirteen auxillery members. The permanent members are vendors with a long-standing interest in creating OpenMP products and include corporations such as AMD, Cray, HP, Intel, IBM, and Red Hat. The auxiliary members are typically those with an interest in the standard but that do not create or sell OpenMP products. They are often research groups and higher edcuation bodies, and include Argonne National Laboratory, Lawrence Livermore National Laboratory, the Edinburgh Parallel Computing Centre, and NASA. The OpenMP Board of Directors conducts the corporate governance, whilst the Officers run the organisation. In addition there are Language, Tools, and Marketing committees, an annual conference (The International Workshop on OpenMP, IWOMP), and the Community of OpenMP Users (cOMPunity), consisting of OpenMP students, researchers, and developers. 

The URLs for the respective bodies are as follows:

http://openmp.org
http://www.iwomp.org
http://compunity.org

## 3.2 Directives and Internal Control Variables

In the OpenMP API instructions known as compiler directives can be added to a sequential program to invoke parallel capability. They are the absolute foundation from which a OpenMP can be differentiated from a sequential program. These directives specify how a compiler with OpenMP should process input. OpenMP is a particularly efficient form of parallelisation in terms of programmer effort, and a serial program can be made parallel with just a handful of directives. Another advantage is that OpenMP allows concurrency and parallelisation to be incrementally improved.

In OpenMP directives are deliberately designed to appear as comments unless the program (usually at compilation) is explicitly commanded to be attentive to them. Compiler directives are used to initiate a parallel region, divide code among threads, distribute loops among threads, and synchronise work among threads. The first step in any OpenMP program ought to be identification of the regions of code that could be executed concurrently or in parallel and then applying appropriate directives.

OpenMP compiler directives must begin with a sentinel (Fortran) or pragma (C). All compiler directives have the basic form of:

sentinel/pragma directive-name clauses

In C and Fortran respectively, the following is basic sentinel for thread creation. When invoked it will create additional threads that are forked from the master tread within the construct. 

Throughout this book modern freeform Fortran will be used in preference to the more archaic fixed form.

```
#pragma omp parallel default(shared) private(variables)
!$omp parallel default(shared) private(variables)

The following is the standard `hello world` program in  C/C++ and Fortran.

#include <stdio.h>

int main(void)
{
    #pragma omp parallel
    {
    printf("Hello world.\n");
    }
    return 0;
}

      program helloomp
	!$omp parallel
          print *, "Hello world!"
	!$omp end parallel
       end program helloomp
```

When compiled, the respective programs will print `hello world` equal to the number of cores on the shared-memory system. As mentioned compilation explicitly requires options that inform the compiler to be attentive to compiler directives that would otherwise be interpreted as comments. For example:

`gcc -fopenmp helloomp.c -o helloompc`
`./helloompc`

`gfortran -fopenmp helloomp.f90 -o helloompf`
`./helloompf`

For Portland and Intel compilers use:

`pgcc -mp helloomp.c -o helloompc`
`./helloompc`
`icpc -openmp helloomp.c -o helloompc`
`./helloompc`

`pgf90 -mp helloomp.f90 -o helloompf`
`./helloompf`
`ifort -openmp helloomp.f90 -o helloompf`
`./helloompf`

The number of threads can be varied as an environment variable. This is both more adaptable and provides some protection against race conditions. To give an example using bash as the shell:

```
export OMP_NUM_THREADS=16
./helloompc
./helloompf
```

A more elaborate version will specify the appropriate include file and the runtime library to specify the number of threads and thread ID. Note that the parallel section will override the export value given previously. If no num_threads is specified, it will use the full sixteen that were exported.  

The programs also use a private variable to each thread.  By default a variable is shared among threads. The private (variable) option in the directive it ensures that the variable is private to the thread that is using it. 

```
#include <stdio.h>
#include  "omp.h"
int main(void)
{
	int id;
	#pragma omp parallel num_threads(4) private(id)
	{
	int id = omp_get_thread_num();
	printf("Hello world %d\n", id);
	}
return 0;
}

program hello2omp
	include "omp_lib.h"
	implicit none
	integer :: id	
     !$omp parallel num_threads(4) private(id)
		id = omp_get_thread_num() 
		print *, "Hello world", id 
	!$omp end parallel
end program hello2omp
```

The next version of the program illustrates how the same variable name can have different values within the parallel section and outside it.

```	

```
```
program SharedHello
implicit none
	character(len=16) :: greetings 
	greetings = "Hello World!" 
	print *, "Before parallel section: ", greetings 

	!$omp parallel num_threads(4) private(greetings)
	greetings = "Saluton mondo!"
	print *, "Inside parallel section: ", greetings
	!$omp end parallel

	print *, "After parallel section:  ", greetings

end program SharedHello
```

All implementation of OpenMP must act with the assumption of internal control variables (ICVs) that control the behaviour of the program. These variables hold information such as the number of threads, the maximum size of the thread team, the number of processors, etc. There are default values given by specific implementations and they can also be manipulated during runtime.

Whilst there are many ICVs (beyond the scope of this book) the following gives a description of a few major ones, their initial value, the functions for how to retrieve their value, how to modify their value, and the environment variable. Their syntax is consistent in both C and Fortran

dyn-var. Operates within parallel regions. The default value is set to `false` unless the implementation supports dynamic adjustment of the number of threads, in which case it is set by the implementation. It controls whether dynamic adjustment of the number of threads is enabled for encountered parallel regions. There is one copy of this ICV per data environment. The value may be retrieved with `omp_get_dynamic()`, and modified with `omp_set_dynamic()`. It uses OMP_DYNAMIC as an environment variable.

nest-var. Operates within parallel regions. The default value is set to `false`. It controls whether nested parallelism is enabled for encountered parallel regions. There is one copy of this ICV per data environment. The value may be retrieved with `omp_get_nested()`, and modified with `omp_set_nested()`. It uses OMP_NESTED as an environment variable.	

nthreads-var. Operates within parallel regions. The default value is set according to the specific implementation. It controls the number of threads requested for encountered parallel regions. There is one copy of this ICV per data environment. The value may be retrieved with `omp_get_max_threads()`, and modified with `omp_set_num_threads()`. It uses OMP_NUM_THREADS as an environment variable.

thread-limit-var. It controls the maximum number of threads participating in a contention
group. There is one copy of this ICV per data environment. The value may be retrieved with `omp_get_thread_limit()`, and modified with `thread_limit` clause. It uses OMP_THREAD_LIMIT as an environment variable.

max-active-levels-var. It controls the maximum number of nested active parallel regions.
There is one copy of this ICV per device. The value may be retrived with `omp_get_max_active_levels()` and modified with `omp_set_max_active_levels()`. It uses 
OMP_MAX_ACTIVE_LEVELS as an environment variable.
 
The OpenMP Application Programming Interface Examples Version 4.0.2 (March 2015) contains an absolutely superb example of internal control variables and their interactions with runtime library routines which is included in the programs with this book (icv1.f90 and icv.c). Four ICV's - nest-var, mex-active-levels-var, dyn-var, and nthreads-var - are modified by calls their respective library routines (omp_set_nested(), omp_set_max_active_levels(), omp_set_dynamic(), and omp_set_num_threads()). Apart the previously described parallel directives, the program also makes use of the single directive, that specifies that the enclosed code is only to be executed by one thread in the team, and the barrier directive, which synchronises all threads in the team. It is recommended that one experiment with the program by changing the number of threads in the inner and outer parallel regions to gain a fuller understanding of the interactions. The unchanged version can be compiled and executed as follows:

```
gcc -fopenmp icv1.c -o icv1c
 ./icv1c 
Inner: max_act_lev=8, num_thds=3, max_thds=4
Inner: max_act_lev=8, num_thds=3, max_thds=4
Outer: max_act_lev=8, num_thds=2, max_thds=3
```

```
gfortran -fopenmp icv1.f90 -o icv1f
./icv1f 
Inner: max_act_lev=       8 , num_thds=           3 , max_thds=           4
Inner: max_act_lev=       8 , num_thds=           3 , max_thds=           4
Outer: max_act_lev=       8 , num_thds=           2 , max_thds=           3
```

3.3 Core Constructs 
-------------------
	
As seen the parallel construct is absolutely fundamental to OpenMPI as it initiates a parallel execution region. The thread that encounters construct becomes the master thread of the new team, with a thread number of zero. All other threads have their own unique identity. All threads in the new team, including the master thread, execute the parallel region. At the end of a parallel region, only the master thread of the team continues execution. The number of threads will be determined by the value of the `if` or `num_threads`, if any, in the directive. Otherwise it will be determined by the current parallel context.

One of the most typical applications of OpenMPI is the parallelisation of loops. This will include a worksharing construct, which distributes the execution of the parallel region among the thread team members. A loop region will bind to the innermost enclosing parallel region, and only threads in the binding parallel region will execute the loop iterations. There is an implicit barrier at the end of a loop construct, unless a `nowait` clause has been stated. Loop iteration variables are private by default. 

In C/C++ and Fortran the following general structures are applied:
```
#pragma omp for clauses 
for-loop
```
```
!$omp do clauses
do-loop
!$omp end do
```
It is always a good idea to start with working serial code and find areas that can be made parallel, and test to see whether the parallel design is more efficient. In the previous chapter, there were two simple loop programs that printed "Hello World" a million times. Expressed in serial form, this would be noticeably slower if the requirement was to iterate over the loop a million thousand times. Thus the program can be recompiled with this higher limit and run with the `time` utility, with additional parallel loops included.

```
gcc hello1mill.c -o hello1millc
time ./hello1millc
real	0m7.375s
user	0m0.062s
sys	0m1.360s
```
```
gfortran hello1mill.f -o hello1millf
time ./hello1millf
real	0m8.359s
user	0m0.209s
sys	0m1.469s
```
`cp hello1mill.c hello1millomp.c`

Make minimal requisite modifications to the OMP version of the file.

```
diff hello1mill.c hello1millomp.c
1a2
> #include  "omp.h"
5a7,8
>    #pragma omp parallel
>    #pragma omp for
```

```
gcc -fopenmp hello1millomp.c -o hello1millompc
time ./hello1millc
real	0m4.779s
user	0m0.145s
sys	0m1.097s
```

`cp hello1mill.f90 hello1millomp.f90`

Make minimal requisite modifications to the OMP version of the file.

```
diff hello1mill.f90 hello1millomp.f90 
1a2
> 	include "omp_lib.h"
6c7,9
< 
---
> 	
> 	!$omp parallel
> 	!$omp do 
11c14,15
< 
---
> 	!$omp end parallel
> 	
```

```
gfortran -fopenmp hello1millomp.f90 -o hello1millompf
time ./hello1millf
real	0m5.172s
user	0m0.318s
sys	0m1.181s	
```

A further variation is the SIMD loop, which enables multiple iterations concurrently by means of SIMD instructions, a particularly efficient method for multiple data tasks. 

`cp hello1mill.c hello1millsimd.c`

```
diff hello1mill.c hello1millsimd.c
1a2
> #include "omp.h"
5a7
>    #pragma omp simd
```
```
gcc -fopenmp hello1millsimd.c -o hello1millsimdc
time ./hello1millsimdc
real	0m4.792s
user	0m0.058s
sys	0m1.063s
````
`cp hello1mill.f90 hello1millsimd.f90`

```
diff hello1mill.f90 hello1millsimd.f90
2a3
>         include "omp_lib.h"
7a9
> 	!$omp simd
```
```
time ./hello1millsimdf
real	0m2.908s
user	0m0.458s
sys	0m1.753s
```

Note that there is a bug in gcc4.x compilers which means that the Fortran version of this program will not compile. Use gcc5.x compilers.

In addition to the loop worksharing construct, there are also `sections`, `single`, and `workshare` constructs. The `workshare` construct divides the execution of a structured block into separate units, which threads sharing the work and ensuring that each unit is only executed once. It only exists in Fortran and is not elaborated here.

The `single` construct was introduced at the end of the last chapter, and specifies that the associated structured block is executed by only one of the threads in the team. It binds to the innermost enclosing parallel region. The method of choosing which thread to execute the structured block is implementation defined, but is not ncessarily the master thread.

The `sections` construct contains a collection of structured blocks that are distributed among the threads in the team. The general syntax is as follows:

```
#pragma omp sections [clauses]
{
#pragma omp section
structured-block
#pragma omp section
structured-block
...
}
```
```
!$omp sections [clauses]
!$omp section
structured-block
!$omp section
structured-block
...
!$omp end sections
```

As an example - elaborating even further on the apparently very adaptable `hello world` program - the following makes use of loop and section work constructs to provide `hello world` a hundred times in three languages.

```
#include <stdio.h> 
#include  "omp.h"
int main(void) 
{ 
   char greetingsen[] = "Hello world!"; 
   char greetingsde[] = "Hallo Welt!";
   char greetingsfr[] = "Bonjour le monde!";
   int a;
   #pragma parallel sections
   {
   #pragma omp section
   for ( a = 0; a < 100; a = a + 1 )
        {
        printf("%s\n", greetingsen); 
        }

   #pragma omp section
   for ( a = 0; a < 100; a = a + 1 )
        {
        printf("%s\n", greetingsde); 
        }

   #pragma omp section
     for ( a = 0; a < 100; a = a + 1 )
        {
        printf("%s\n", greetingsfr); 
        }
    }
return 0;
}
```

```
program sections
        implicit none 
        include "omp_lib.h"

        character(len=16) :: greetingsen
        character(len=16) :: greetingsde
        character(len=16) :: greetingsfr 
        integer :: a
        greetingsen = "Hello World!" 
        greetingsde = "Hallo Welt!"
        greetingsfr = "Bonjour le monde!"       

        !$omp parallel
        !$omp sections

	   !$omp section
        do a = 1, 100
        print *, greetingsen   
        end do

        !$omp section
        do a = 1, 100
        print *, greetingsde
        end do

        !$omp section
        do a = 1, 100
        print *, greetingsfr  
        end do
		
        !$omp end sections

        !$omp end parallel
        
end program sections
```

Two variations on the simd construct which are not elaborated here include the `declare simd` construct and the composite loop simd constructs. In the former, the `declare simd` construct enables the creation of one or more versions that can process multiple arguments using SIMD instructions from a single invocation in a SIMD loop. In the latter case, the the loop construct ensures that iterations of associated loops are distributed across existing threads and that the iterations executed by each thread can also be executed concurrently using SIMD instructions.

The general syntax of the `declare simd` construct takes the following form in C/C++ and Fortran:

`#pragma omp declare simd [clauses]`

`!$omp declare simd [clauses]`

The general syntax of the SIMD loop constructs take the following forms in C/C++ and Fortran:

```
#pragma omp for simd [clauses]
for-loops
```
```
!$omp do simd [clauses]
do-loops
!$omp end do simd
```

## 3.4 Tasks and Synchronisation

With common computational problems such as linked lists and recursive algorithms the `task` constructs are very useful to mosty efficiently implement parallelism. The general principle is that a thread generates tasks which are then executed according to the runtime system, either immediately or delayed. The task construct defines an explicit task with the following general syntax in C and Fortran: 

```
#pragma omp task [clauses]
structured-block
```
```
!$omp task [clauses]
structured-block
!$omp end task
```

Task synchronisation is carried out with the `barrier` or `taskwait` constructs.  The barrier construct specifies an explicit barrier at the point at which all tasks bound to the assocated parallel region must complete before any are allowed to continue beyond the barrier. The latter construct explicitly waits for the completion of child tasks.

```
#pragma omp barrier
!omp barrier
```
```
#pragma omp taskwait
!$omp taskwait
```

A simple sentence that is is grammatically correct, but (arguably) semantically nonsensical is "Colourless green ideas sleep furiously". Embodied with standard omp structure (colourless-1.c and colourless-1.f90), this will produce the sentence according to the number of exported threads available. Fortran, of course, automates a new line with each print (an advance=no plus character variables, plus explicit formatting, would be required to suppress this).

```./colourless-1c
Colourless green ideas sleep furiously Colourless green ideas sleep furiously Colourless green ideas sleep furiously Colourless green ideas sleep furiously```

```./colourless-1f 
 Colourless 
 green 
 ideas 
 sleep furiously 
```

With the `single` construct, these multiple threads can be forced into using just one (colourless-2.c and colourless-2.f90). Variations (not elaborated here) is the `master` construct, which specifies a structured block that that can only be executed by the master thread, and the `critical` construct also operates on a single thread but typically with an expression clause.

Within the single thread, individual tasks can be specified (colourless-3.c and colourless-3.f90). The tasks will complete in any order and at a task execution point, as the code snippets and results show. If a `taskwait` construct was included at the end of the tasks the tasks would execute first.

```
 #pragma omp parallel
 { 
  #pragma omp single
   {
   printf("Noam Chomsky said ");
    #pragma omp task
     {	printf("Colourless "); }
    #pragma omp task
     {  printf("green ");      }
    #pragma omp task
     {	printf("ideas ");      }
	printf("sleep furiously ");
   }
   }
```

```
./colourless3c 
Noam Chomsky said Colourless sleep furiously ideas green

	!$omp parallel
	 !$omp single
	  print *, "Noam Chomsky said "
	  !omp task
          print *, "Colourless " 
	  !omp end task
	  !omp task
	  print *, "green "   
	  !omp end task
	  !omp task
	  print *, "ideas "  
          !omp end task
	  print *, "sleep furiously "
	 !$omp end single
	!$omp end parallel
```
```
./colourless3f [EDIT Doesn't work as expected]
 Noam Chomsky said
 Colourless 
 green 
 ideas 
 sleep furiously 
```

A combination of tasks and loops is also possible with the `taskloop` construct. With this construct one or more associated loops will be executed in parallel using tasks. It can be further expanded to carry out these taskloops with SIMD instructions. Its generic form follows:

```
#pragma omp taskloop simd [clauses]
for-loops
```

```!
$omp taskloop simd [clauses]
do-loops
!$omp end taskloop simd
```

## 3.5 Targets and Teams

In addition to operating with different tasks, OpenMP can also operate on different devices (e.g., coprocessors, GPGPUs). A relatively new development, this means that OpenMP can run on both a host and an device, optimally in parallel, in a worksharing manner by encapsulating part of the code to run on a target device. There is a large number of directives, constructs, and clauses associated with this activity, of which a few are expressed here albeit only in summary form.

Program execution begins on the host device and when a thread encounters the `target` directive subsequent code in that region executes on the target device. The target device is determined by the device clause or, if that is not in the construct, the default-device-var ICV. The generic syntax is as follows:

```
#pragma omp target [clause[ [,] clause] ... ] new-line
structured-block
```

```
!$omp target [clause[ [,] clause] ... ]
structured-block
!$omp end target
```

Whereas the `target` construct transfers the control flow to a target device, the `target data` construct maps variables to a device data environment. 

```
#pragma omp target data [clauses]
structured-block
```

```
!$omp target data [clauses]
structured-block
!$omp end target data
```

This is then elaborated by the `target update` directive to request data transfers from within a target data region by making the corresponding list items in the device data environment consistent with their original list items and according to specified clauses. For each list item in a `to` or `from` clause there is a corresponding list item and an original list item. Note that clauses must be present in this directive.

```
#pragma omp target update clauses
!$omp target update clauses
```

The `declare target` directive specifies that variables, functions, and subroutines (Fortran alone) are mapped to a device. If an extended list is not included, the clause `to(extended-list)` or `link(list)` must be.

```
#pragma omp declare target
declaration-definition-seq
#pragma omp end declare target
```
or
`#pragma omp declare target (extended-list)`
or
`#pragma omp declare target clauses`

`!$omp declare target (extended-list)`
or
`!$omp declare target clauses`

The `target enter data` directive specifies that variables are mapped to a device data environment. When a target enter data construct is encountered, the list items are mapped to the device data environment according to the map clauses. An associated directive is `target exit data`, which specifies list items that are to be unmapped from a device data environment. The general syntax for the two is as follows:

```
#pragma omp target enter data [clauses]
!$omp target enter data [clauses]
```

```
#pragma omp target exit data [clauses]
!$omp target exit data [clauses]
```

Whilst a parallel region creates a team of threads for execution, and a nested parallel can create a new team within an existing team, there is also a `teams` construct for use specifically within the `targets` construct i.e., the binding thread for a teams region is where the the initial thread is of the target region. When a thread encounters the `teams` construct it creates a league of thread teams and the master thread of each team executes the region. Once the teams are created, the number of `teams` remains constant for the duration of the region and within a `teams` region, each team is identified with a call to the `omp_get_team_num` library routine.

```
#pragma omp teams [clauses]
structured-block
```

```
!$omp teams [clauses]
structured-block
!$omp end teams
```

Once target teams are in place tasks may be assigned to them, for example with the `distribute` construct, which can allocate one or more loops. An equivalent `distribute simd` is also available. Composite constructs can be built with `distribute parallel for` and `distribute parallel for simd`.

```
#pragma omp distribute [clauses]
for-loops
```

```
!$omp distribute [clauses]
do-loops
!$omp end distribute
```

```
#pragma omp distribute simd [clauses]
for-loops
```

```
!$omp distribute simd [clauses]
do-loops
!$omp end distribute simd
```

```
#pragma omp distribute parallel for [clauses]
for-loops
```

```
!$omp distribute parallel do [clauses]
do-loops
[!$omp end distribute parallel do]
```

```
#pragma omp distribute parallel for simd [clauses]
for-loops
```

```
!$omp distribute parallel do simd [clauses]
do-loops
!$omp end distribute parallel do simd
```

This brings us to an end of the chapter on OpenMP; rather like the following chapter on OpenMPI only a cursorary exploration of the major capabilities have been provided. However they should be a sufficient overview to start converting sequential code into parallel code immediately and with minimum effort whilst also providing the grounding for future exploration and detail.

# 4.0 Distributed Memory Programming with OpenMPI


## 4.1 Distributed Memory Concepts and the OpenMPI Implementation

The Message Passing Interface (MPI) is a widely used standard, initially designed by academia and industry initiated in 1991, to run on parallel computers. The goal of the group was to ensure source-code portability, and as a result they have a standard that defines an interface and specific functionality. As a standard, syntax and semantics are defined for core library routines which allow for programmers to write message-passing programs in Fortran or C. 

Some implementations of these core library routine specifications are available as free and open-source software, such as Open MPI.  Open MPI combined three previous well-known implementations, namely FT-MPI from the University of Tennessee, LA-MPI from Los Alamos National Laboratory, and LAM/MPI from Indiana University, each of which excelled in particular areas, with additional contributions from the PACX-MPI team at the University of Stuttgart. OpenMPI combines the quality peer-review of a scientific free and open-source software project, and has been used in many of the world's top ranking supercomputers.

Major milestones in the development of MPI include the following:

* 1991 Decision to initiate Standards for Message Passing in a Distributed Memory Environment
* 1992 Worskhop on the above held.
* 1992 Preliminary draft specification released for MPI
* 1994 MPI-1 released. Specification, not an implementation. Library, not a language. Designed for C and Fortran 77.
* 1998 MPI-2 released. Extends message-passing model to include parallel I/O, includes C++/Fortran90. Interaction with threads, and more.
* 2007 MPI Forum reconvened
* 2009 MPI-2.2 released; C++ deprecated (everyone was using C anyway).
* 2012 MPI-3 released. No further C++ support; added Java.

The message passing paradigm, as it is called, is attractive as it is portable on a wide variety of distributed architectures, including distributed and shared memory multiprocessor systems, networks of workstations, or even potentially a combination thereof. Although originally designed for distributed architectures (unicore workstations connected by a common network) which were popular at the time the standard was initiated, shared memory symmetric multiprocessing systems over networks created a hybrid distributed/shared memory systems, that is each system has shared memory within each machine but not the memory distributed between machines, which distribute data over the network communications. The MPI library standards and implementations were modified to handle both types of memory architectures.



(image from Lawrence Livermore National Laboratory, U.S.A)

Using MPI is a matter of some common sense. It is is the only message passing library which can really be considered a standard. It is supported on virtually all HPC platforms, and has replaced all previous message passing libraries, such as PVM, PARMACS, EUI, NX, Chameleon, to name a few predecessors. Programmers like it because there is no need to modify their source code when ported to a different system as long as that system also supports the MPI standard (there may be other reasons however to modify the code!). MPI has excellent performance with vendors able to exploit hardware features for optimisation.

The core principle is that many processors should be able cooperate to solve a problem by passing messages to each through a common communications network. The flexible architecture does overcome serial bottlenecks, but it also does require explicit programmer effort (the "questing beast" of automatic parallelisation remains somewhat elusive). The programmer is responsible for identifying opportunities for parallelism and implementing algorithms for parallelisation using MPI. 

MPI programming is best where there is not too many small communications, and where coarse-level breakup of tasks or data is possible.

"In cases where the data layout is fairly simple, and the communications patterns are regular this [data-parallel] is an excellent approach. However, when dealing with dynamic, irregular data structures, data parallel programming can be difficult, and the end result may be a program with sub-optimal performance." 

(Warren, Michael S., and John K. Salmon. "A portable parallel particle program." Computer Physics Communications 87.1 (1995): 266-290.)

4.2 MPI Program Structure and OpenMPI Wrappers

Walking through a `helloworld` example for C and Fortran illustrates some key routines in MPI.

This is the text for mpi-helloworld.c

#include <stdio.h>
A standard include for C programs. 
#include "mpi.h"
A standard include for MPI programs. 
int main( argc, argv )
Beginning of the main function, establish arguments and vector. To incorporate input files argc (argument count) is the number of arguments, and argv (argument vector) is an array of characters representing the arguments. 
int  argc; 
Argument count is an integer
char **argv; 
Argument vector is a string of characters.
{
 
    int rank, size; 
Set rank and size from the inputs.
    MPI_Init( &argc, &argv );
Initialises the MPI execution environment. The input parameters argc is pointer to the number of arguments and argv is a pointer to the argument vector 
    MPI_Comm_size( MPI_COMM_WORLD, &size );
Determines the size of the group associated with a communicator. In input parameter is simply a handle (Contains all of the processes), the output parameter, size, is an integer of the number of processes in the group. 
    MPI_Comm_rank( MPI_COMM_WORLD, &rank );
As above, except rank is rank of the calling process. 
    printf( "Hello world from process %d of %d\n", rank, size ); 
Printing "Hello world" from each process.
    MPI_Finalize();
Terminates MPI execution environment 
    return 0; 
A successful program finishes!
} 


It is compiled into an executable with the command: 

mpicc mpi-helloworld.c -o mpi-helloworldc

A similar elaboration can occur with Fortran (mpi-helloworld.f)

!  Fortran MPI Hello World
A comment
   program hello
Program name
   implicit none
Suppress assumed variable datatypes
   include 'mpif.h'
Include file for MPI
   integer rank, size, ierror, tag, status(MPI_STATUS_SIZE)
Variables
   call MPI_INIT(ierror)
Start MPI
   call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
Number of processers
   call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)
Process IDs
   print*, 'node', rank, ': Hello world'
Each processor prints "Hello World"
   call MPI_FINALIZE(ierror)
Finish MPI.
   end



It is compiled into an executable with the command: 

mpif90 mpi-helloworld.f90 -o mpi-helloworldf

Compared with OpenMP it can be immediately noticed that the MPI routines have to be called directly from within the program, and the program has to be modified in such a manner to include these routines. In this sense, MPI is harder than OpenMP – however, it also can leverage distributed systems.

MPI code can be run on systems that have had an MPI implementation installed, such as OpenMPI or MPICH. The operation can be conducted in real-time (good for testing and debugging) or with a batch submission system, such as OpenPBS, Torque, PBSPro, or SLURM. If operating on a clustered HPC system, it is almost invariably recommended that you use one of these tools rather than running your task on the login node. The examples given here assume use of OpenMPI and Torque, but the principles apply equally to other systems.

To run directly use simple invoke mpiexec (or mpirun, or orterun, they're all synonyms), assuming it's in your path. The following examples assume 8 cores.


mpiexec -np 8 ./mpi-helloworldc
mpiexec -np 8 ./mpi-helloworldf

As there is no locking or communication between the cores, they will each run and complete their tasks independently (i.e., a race condition). The result of running such a command should be similar to the following:

Hello world from process 1 of 8
Hello world from process 5 of 8
Hello world from process 2 of 8
Hello world from process 0 of 8
Hello world from process 3 of 8
Hello world from process 7 of 8
Hello world from process 6 of 8
Hello world from process 4 of 8

The other option, using Torque, is to submit through a job submission system. For example submitting pbs-helloworld.

#!/bin/bash
# To give your job a name, replace with an appropriate name
#PBS -N HelloWorld
# Establish processors and walltime.
# For PBSPro
# PBS -l select=1:ncpus=8:mpiprocs=8
# For Torque
#PBS -l nodes=1:ppn=8
#PBS -l walltime=00:10:00
# Changes directory to your execution directory. 
cd $PBS_O_WORKDIR
# Command to run an MPI job, note we specified mpiexec so dont need to
# specify the number of processes or thier names. 
module load openmpic-gcc
mpiexec ./mpi-helloworldc

This PBS script can be submitted with 

qsub pbs-helloworld

When this job completes it should have an output file with a similar output to above.

The sample "hello world" programs should be understandable to any C or Fortran programmer (indeed, any programmer) and with the MPI-specific annotations, it should be clear what is going on. It is the same as any other program, but with a few MPI-specific additions. For example, one can check the mpi.h. For example:

less /usr/local/openmpi/1.8.6-gcc/include/mpi.h

MPI compiler wrappers are used to compile MPI programs which perform basic error checking, integrate the MPI include files, link to the MPI libraries and pass switches to the underlying compiler. The wrappers are as follows:

mpif77
OpenMPI Fortran 77 wrapper compiler (deprecated from OpenMPI 1.7 onwards)
mpif90
OpenMPI Fortran 90 wrapper compiler (deprecated from OpenMPI 1.7 onwards)
mpifort
OpenMPI Fortran wrapper (OpenMPI 1.7+), can be used for all versions of Fortran.
mpicc
OpenMPI C wrapper compiler
mpicxx
OpenMPI C++ wrapper compiler. Also, mpic++ mpiCC can be used.

Open MPI is comprised of three software layers or modules: OPAL (Open Portable Access Layer), ORTE (Open Run-Time Environment), and OMPI (Open MPI).  Each layer provides the following wrapper compilers:

OPAL
opalcc and opalc++
ORTE
ortecc and ortec++
OMPI
mpicc,  mpic++,  mpicxx,  mpiCC  (only on systems with case-senstive file systems), mpif77, and mpif90.  Note that mpic++, mpicxx, and mpiCC all invoke the same underlying C++ compiler with the same options.  All are provided as compatibility with other MPI implementations.

The distinction between Fortran and C routines in MPI are fairly minimal. All the names of MPI routines and constants in both C and Fortran begin with the same MPI_ prefix. The main differences are:

* The include files are slightly different: in C, mpi.h, in Fortan, mpif.h.
* Fortran MPI routine names are in uppercase (e.g., MPI_INIT), whereas C-compatible MPI routine names are upper and lowercase (e.g., MPI_Init).
* The arguments to MPI_Init are different; an MPI C program can take advantage of command-line arguments. 
* The arguments in MPI C functions are more strongly typed than they are in Fortran, resulting in specific types in C  (e.g., MPI_Comm, MPI_Datatype) whereas MPI Fortran uses integers.
* Error codes are returned in a separate argument for Fortran as opposed to the return value for C functions.

The mpi-helloworld program is an example of using MPI in a manner that is similar to a Single Instruction  architecture. The same instruction stream (print hello world) is used across multiple times. It is perhaps best described as Single Program Multiple Data, as it obtains the effect of running the same program multiple times, or, if you like different programs with the same instructions.

The MPI specific routines however are very important, as they illustrate the absolute bare minimum requirements for all MPI programs. A very useful analogy is to view the MPI system of routines as similar to a postal system. 

1. MPI_Init. This is called once, and only once, in all MPI programs. It states that there will be MPI routines called within this bounded area, the communications world. Using the analogy it establishes that there will be a postage system.
2. MPI_Comm_size. This establishes how many processors will be used in the MPI communications world. Using the analogy, it represents how many addresses will exist.
3. MPI_Comm_rank. This establishes the rank of each of the processors in the MPI communications world. Using the analogy, it represents what the addresses are.
4. MPI_Finalize. This closes the MPI Communications. It can be called once, and only once.

With the addition of these four routines, any existing C or Fortran code can be converted into at least a minimal MPI program. 

4.3 MPI's Basic Routines

The core theoretical concept in MPI programming is the move from a model where the processor and memory act in a sequence to each other to  model where the memory and processor act in parallel and pass information through a communications network.

MPI has been described as both small and large. In many cases one can agree with the words of Avicenna, the famous Persian physician and philosopher when such comments are made: 

"Anyone who denies the law of non-contradiction should be beaten and burned until he admits that to be beaten is not the same as not to be beaten, and to be burned is not the same as not to be burned."

It shouldn't take long!

However, without delving into the deep matters of paraconsistent logic, it can be simple stated that MPI is large, insofar that there are well over a hundred different routines. But most of these are only called when one is engaging in advanced MPI programming and various edge cases. It is therefore perhaps fair to say that in a sense that MPI is small, as there are only a handful of basic routines that are usually needed, of which we've seen four. There are two others (MPI_Send, MPI_Recv) which can also be considered "basic routines".

MPI_Init()

This routine initializes the MPI execution environment Every MPI program must call this routine once, and only once, and before any other MPI routines; subsequent calls to MPI_Init will produce an error. With MPI_Init() processes are spawned and ranked with communication channels established and the defafult communicator, MPI_COMM_WORLD created. Communicators are considered analoguous to the mail or telephone system; every message travels in the communicator, with every message passing call having a communcator argument.

The input paramters are argc, a pointer to the number of arguments, and argv, the argument vector. These are for C and C++ only. The Fortran-only output parameter is IERROR, as integer.

The syntax for MPI_Init() is as follows for C, Fortran, and C++. 

C Syntax
       #include <mpi.h>
       int MPI_Init(int *argc, char ***argv)

Fortran Syntax
       INCLUDE ’mpif.h’
       MPI_INIT(IERROR)
            INTEGER   IERROR

C++ Syntax
       	#include <mpi.h>
       	void MPI::Init(int& argc, char**& argv)
       	void MPI::Init()

MPI_Comm_size()

This routine indicates the number of processes involved in a communicator, such as MPI_COMM_WORLD. The input parameter is comm, which the handle for the communicator, and the output paramter is size, the number of processes in the group of comm (integer) and the Fortran only IERROR providing the error status as integer.

A communicator is effectively a collection of processes that can send messages to each other. Within programs many communications also depend on the number of processes executing the program. 

The syntax for MPI_Comm_size() is as follows for C, Fortran, and C++. 

C Syntax
       #include <mpi.h>
       int MPI_Comm_size(MPI_Comm comm, int *size)

Fortran Syntax
       INCLUDE ’mpif.h’
       MPI_COMM_SIZE(COMM, SIZE, IERROR)
            INTEGER   COMM, SIZE, IERROR

C++ Syntax
       #include <mpi.h>
       int Comm::Get_size() const



 
MPI_Comm_rank()

This routine indicates the rank rank number of the calling processes within the pool of MPI communicator processes. The input parameters are comm, the communicator handle and the outpit paramters are rank, the rank of the calling processses expressed as an integer, and the ever present, IERROR error status for Fortran. It is common for MPI programs to be written in a manager/worker model, where one process (typically rank 0) acts in a supervisory role, and the other processes act in a computational role.

The syntax for MPI_Comm_rank() is as follows for C, Fortran, and C++. 

C Syntax
       #include <mpi.h>
       int MPI_Comm_rank(MPI_Comm comm, int *rank)

Fortran Syntax
       INCLUDE ’mpif.h’
       MPI_COMM_RANK(COMM, RANK, IERROR)
            INTEGER COMM, RANK, IERROR

C++ Syntax
       #include <mpi.h>
       int Comm::Get_rank() const

MPI_Send()

This routine performs a standard-mode, blocking send. By "blocking" what is mean that this routine will block until the message is sent to the destination.

The message-passing system handle many messages going to and from 
many different sources. The programmer just needs to state send/recv's messages in appropriate way, without needing to know underlying implementation. The message-passing system take care of delivery. However this “appropriate way” means stating various characteristics of the message just like the post or email; who is sending it, where it’s being sent to, what it’s about, and so forth.

The input parameters include buf, the initial address of the send buffer., count, an integer of the number of elements., datatype, a handle of the datatype of each send buffer., dest, an integer rank of the destination., tag, an integer message tag, and comm, the communicator handle. The only output parameter is Fortran's , IERROR.

If MPIComm represents a community of addressable space, then MPISend and MPIRecv the envelope, addressing information and the data. In order for a message to be successfully communicated the system must append some information to the data that the application program wishes to transmit. This includes the rank of the sender, the receiver, a tag, and the communicator. The source is used to differentiate messages received from different sources; the tag to distinguish messages from a single process.

The syntax for MPI_Send() is as follows for C, Fortran, and C++. 

C Syntax
       #include <mpi.h>
       int MPI_Send(void *buf, int count, MPI_Datatype datatype, int dest,
            int tag, MPI_Comm comm)

Fortran Syntax
       INCLUDE ’mpif.h’
       MPI_SEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, IERROR)
            <type>    BUF(*)
            INTEGER   COUNT, DATATYPE, DEST, TAG, COMM, IERROR

C++ Syntax
       #include <mpi.h>
       void Comm::Send(const void* buf, int count, const Datatype&
            datatype, int dest, int tag) const
            
MPI_Recv()

As what is sent should be received, the MPI_Recv routine, provides a standard-mode, blocking receive. A message can be received only if addressed to the receiving process, and if its source, tag, and communicator (comm) values match the source,  tag,  and  comm  values  specified.  After a matching send has been initiated, a receive will block and until that send has completed. The length of the received message must be less than or equal to the length of the receive buffer, otherwise an overflow error will be returned.

The input paramters include count, the maximum integer number of elements to receive., datatype, a handle of the datatype for each receive buffer entry., source, an integer rank of the source., tag, an integer message tag., and comm, the communicator handle. The output parameters are buf, the initial address of the receive buffer., status, a status object., and the ever-present Fortran IERROR.

The syntax for MPI_Recv() is as follows for C, Fortran, and C++. 

C Syntax
       #include <mpi.h>
       int MPI_Recv(void *buf, int count, MPI_Datatype datatype,
            int source, int tag, MPI_Comm comm, MPI_Status *status)

Fortran Syntax
       INCLUDE ’mpif.h’
       MPI_RECV(BUF, COUNT, DATATYPE, SOURCE, TAG, COMM, STATUS, IERROR)
            <type>    BUF(*)
            INTEGER   COUNT, DATATYPE, SOURCE, TAG, COMM
            INTEGER   STATUS(MPI_STATUS_SIZE), IERROR

C++ Syntax
       #include <mpi.h>
       void Comm::Recv(void* buf, int count, const Datatype& datatype,
            int source, int tag, Status& status) const
       void Comm::Recv(void* buf, int count, const Datatype& datatype,
            int source, int tag) const

The importance of MPI_Send() and MPI_Recv()  refers to the nature of process variables, which remain private unless passed by MPI in the Communications World.





MPI_Finalize() 

This routine should be called when all communications are completed. Whilist it cleans up MPI data structures etc., it does not cancel continuing communications which the programmer should look out for. Once called, no other routines can be called (with some minor exceptions), not even MPI_Init.  There are no input parameters. The only output paramter is Fortran's IERROR.

The syntax for MPI_Finalize() is as follows for C, Fortran, and C++. 

C Syntax
       #include <mpi.h>
       int MPI_Finalize()

Fortran Syntax
       INCLUDE ’mpif.h’
       MPI_FINALIZE(IERROR)
            INTEGER   IERROR

C++ Syntax
       #include <mpi.h>
       void Finalize()

Whilst the previous mpi-helloworld.c and the mpi-helloworld.f90 examples illustrated the use of four of the six core routines of MPI, it did not illustrate the use of the MPI_Recv and MPI_Send routines. The following program, of no greater complexity, does this. There is no need to provide additional explanation of what is happening, as this should be discerned from the routine explanations given. Each program should be compiled with mpicc and mpif90 respectively, submitted with qsub, with the results checked.

#include <stdio.h> 
#include <stdlib.h> 
#include <mpi.h> 
 
int main(argc,argv) 
int argc; 
char *argv[]; 
{ 
    int myid, numprocs; 
    int tag,source,destination,count; 
    int buffer; 
    MPI_Status status; 
 
    MPI_Init(&argc,&argv); 
    MPI_Comm_size(MPI_COMM_WORLD,&numprocs); 
    MPI_Comm_rank(MPI_COMM_WORLD,&myid); 
    tag=1; 
    source=0; 
    destination=1; 
    count=1; 
    if(myid == source){ 
      buffer=1729; 
      MPI_Send(&buffer,count,MPI_INT,destination,tag,MPI_COMM_WORLD); 
      printf("processor %d  sent a very interesting integer : %d\n",myid,buffer); 
    } 
    if(myid == destination){ 
        MPI_Recv(&buffer,count,MPI_INT,source,tag,MPI_COMM_WORLD,&status); 
        printf("processor %d  received a very interesting integer :  %d\n",myid,buffer); 
    } 
    MPI_Finalize(); 
} 

The mpi-sendrecv.f program; compile with mpif90 mpi-sendrecv.f90, submit with qsub pbs-sendrecv

      program sendrecv 
      include "mpif.h" 
	 implicit none
      integer myid, ierr,numprocs 
      integer tag,source,destination,count 
      integer buffer 
      integer status(MPI_STATUS_SIZE) 
      call MPI_INIT( ierr ) 
      call MPI_COMM_RANK( MPI_COMM_WORLD, myid, ierr ) 
      call MPI_COMM_SIZE( MPI_COMM_WORLD, numprocs, ierr ) 
      tag=1
      source=0 
      destination=1 
      count=1 
      if(myid .eq. source)then 
         buffer=1729
         Call MPI_Send(buffer, count, MPI_INTEGER,destination,& 
          tag, MPI_COMM_WORLD, ierr) 
         write(*,*)"processor ",myid," sent a very interesting integer: ", buffer 
      endif 
      if(myid .eq. destination)then 
         Call MPI_Recv(buffer, count, MPI_INTEGER,source,& 
          tag, MPI_COMM_WORLD, status,ierr) 
         write(*,*)"processor ",myid," received a very interesting integer: ",buffer 
      endif 
      call MPI_FINALIZE(ierr) 
      stop 
      end 

It is left to the reader's own investigations on why the buffer is so interesting.

The following provides a summary use of the six core routines in C and Fortran.


Purpose
C 
Fortran
Include header files
#include <mpi.h>
INCLUDE ’mpif.h’
Initialize MPI
int MPI_Init(int *argc, char ***argv)
INTEGER IERROR
CALL MPI_INIT(IERROR)
Determine number of processes within a communicator
int MPI_Comm_size(MPI_Comm comm, int *size)
INTEGER COMM,SIZE,IERROR
CALL MPI_COMM_SIZE(COMM,SIZE,IERROR)
Determine processor rank within a communicator
int MPI_Comm_rank(MPI_Comm comm, int *rank)
INTEGER COMM,RANK,IERROR
CALL MPI_COMM_RANK(COMM,RANK,IERROR)
Send a message
int MPI_Send (void *buf,int count, MPI_Datatype
datatype, int dest, int tag, MPI_Comm comm)
<TYPE> BUF(*) 
INTEGER COUNT, DATATYPE,DEST,TAG
INTEGER COMM, IERROR
CALL MPI_SEND(BUF,COUNT, DATATYPE, DEST, TAG, COMM, IERROR)
Receive a message
int MPI_Recv (void *buf,int count, MPI_Datatype
datatype, int source, int tag, MPI_Comm comm, MPI_Status *status)
<TYPE> BUF(*) 
INTEGER COUNT, DATATYPE, SOURCE,TAG
INTEGER COMM, STATUS, IERROR
CALL MPI_RECV(BUF,COUNT, DATATYPE, SOURCE, TAG, COMM, STATUS, IERROR)
Exit MPI 
int MPI_Finalize()
CALL MPI_FINALIZE(IERROR)

4.4 MPI Datatypes

Like C and Fortran (and indeed, almost every programming language that comes to mind), MPI has datatypes, a classification for identifying different types of data (such as real, int, float, char etc). In the introductory MPI program there wasn’t really much complexity in these types; as one delves deeper however more will be encountered. Forewarned is forearmed, so the following provides a handy comparison chart between MPI, C, and Fortran.


MPI DATATYPE
FORTRAN DATATYPE
MPI_INTEGER
INTEGER
MPI_REAL
REAL
MPI_DOUBLE_PRECISION
DOUBLE PRECISION
MPI_COMPLEX
COMPLEX
MPI_LOGICAL
LOGICAL
MPI_CHARACTER
CHARACTER
MPI_BYTE

MPI_PACKED


MPI DATATYPE
C Datatype
MPI_CHAR
signed char
MPI_SHORT
signed short int
MPI_LONG
signed long int
MPI_UNSIGNED_CHAR
unsigned char
MPI_UNSIGNED_SHORT
unsigned short int
MPI_UNSIGNED
unsigned int
MPI_UNSIGNED_LONG
unsigned long int
MPI_FLOAT
float
MPI_DOUBLE
double
MPI_LONG_DOUBLE
long double
MPI_BYTE

MPI_PACKED



Derived Data Types

Derived types are essentially a user define type for MPI_Send()‏. They are described as 'derived' as they are derived from existing primitive datatype like int and float. The main reason to use them in in MPI context is that they make message passing more efficient and easier to code.

For example if a program has data in double results[5][5], what does the user do if they want to send results[0][0], results[1][0], …results[5][0]?

The program could send the data one at a time e.g.,

double results[5][5];
int i;
for ( i = 0; i < 5; i++ ) {
	MPI_Send( &(results[i][0]), 1, MPI_DOUBLE,
				dest, tag, comm );
}

But this has overhead; message passing is always (relatively) expensive. So instead, a datatype can be created that informs MPI how the data is stored so it can be sent in one routine.

To create a derived type there are two steps: Firstly construct the datatype, with MPI_Type_vector() or MPI_Type_struct() and and then‏ commit the datatype with MPI_Type_Commit()‏.

When all the data to send is the same data type use the vector method e.g.,

int MPI_Type_vector( int count, int blocklen, int stride, MPI_Datatype old_type, MPI_Datatype* newtype )

/* Send the first double of each of the 5 rows */
MPI_Datatype newType;
double results[5][5];

MPI_Type_vector( 5, 1, 5, MPI_Double, &newType);
MPI_Type_commit( &newType );
MPI_Ssend( &(results[0][0]), 1, newType, dest, tag, comm );
‏
Note that when sending a vector, data on receiving processor may be of a different type eg:

double 		recvData[COUNT*BLOCKLEN];
double 		sendData[COUNT][STRIDE];
MPI_Datatype 	vecType;
MPI_Status    st;

MPI_Type_vector( COUNT, BLOCKLEN, STRIDE, MPI_DOUBLE, &vecType );
MPI_Type_commit( &vecType );
if( rank == 0 )
  MPI_Send( &(sendData[0][0]), 1, vecType, 1, tag, comm );
else
  MPI_Recv( recvData, COUNT*BLOCKLEN, MPI_DOUBLE, 0, tag, comm, &st );

If you have specific parts of a struct you wish to send and the members are of different types, use the struct datatype.

int MPI_Type_struct( int count, int blocklen[], MPI_Aint indices, MPI_Datatype old_types[],MPI_Datatype* newtype )‏

For example....

/* Send the Packet structure in a message */
struct {
   int a;
   double array[3];
   char b[10];
} Packet;

struct Packet dataToSend;

Another example ….

int blockLens[3] = { 1, 3, 10 };
MPI_Aint intSize, doubleSize;
MPI_Aint displacements[3];
MPI_Datatype types[3] = { MPI_INT, MPI_DOUBLE, MPI_CHAR };
MPI_Datatype myType;

MPI_Type_extent( MPI_INT, &intSize ); //# of bytes in an int
MPI_Type_extent( MPI_DOUBLE, &doubleSize ); //” “ “ “ double
displacements[0] = (MPI_Aint) 0;
displacements[1] = intSize;
displacements[2] = intSize + ((MPI_Aint) 3 * doubleSize);
MPI_Type_struct( 3, blockLens, displacements, types, &myType );
MPI_Type_commit( &myType );
MPI_Ssend( &dataToSend, 1, myType, dest, tag, comm );

There are actually other functions for creating derived types:

MPI_Type_contiguous
MPI_Type_hvector
MPI_Type_indexed
MPI_Type_hindexed

In many applications, the size of a message to receive is unknown before it is received. (e.g.: number of particles moving between domains)‏. MPI has a way of dealing with this elegantly. Firstly, receive side calls MPI_Probe before actually receiving:

int MPI_Probe( int source, int tag, MPI_Comm comm, MPI_Status *status )‏
Can then examine the status, and find length using:
int MPI_Get_count( MPI_Status *status,
MPI_Datatype datatype, int *count )‏

Then the application dynamically allocate the recv buffer, and call MPI_Recv.
	
4.5 Extended Communications and Other Routines
----------------------------------------------

Included in the source code files that accompany this book there are two programs (mpi-pingpong.c, mpi-pingpong.f90) from the  University of Edinburgh Parallel Computing Centre. This program tests time for communication according to packet sizes, asynchronous, and bi-directional. The usual methods can be used for compiling and submitting these programs, e.g.,

mpicc -mpi-pingpong.c  -o mpi-pingpongc
mpif90 mpi-pingpong.f90 -o mpi-pingpongf

qsub pbs-pingpong

The pbs file should be modified to agree with the resource requirements and the executable being run.

In the source code are new routines that extend the suite MPI communications along with other routines. As previously there is the mpi.h header include files, the initialisation routines, the establishment of a communications world and so forth.  In addition however there are some new routines, specifically MPI_Wtime, MPI_Abort, MPI_Status, and MPI_Ssend.  

MPI_Wtime()

MPI_Wtime returns the elapsed time, as a floating point number in seconds, of the calling processor from an arbitrary point in the past. It can be applied in the following fashion:

    {
       double starttime, endtime;
       starttime = MPI_Wtime();
        ....  stuff to be timed  ...
       endtime   = MPI_Wtime();
       printf("That took %f seconds\n",endtime-starttime);
    }

The syntax for MPI_Wtime() is as follows for C, Fortran, and C++.

C Syntax

#include <mpi.h>
double MPI_Wtime()

Fortran Syntax

INCLUDE ’mpif.h’
DOUBLE PRECISION MPI_WTIME()

C++ Syntax

#include <mpi.h>
double MPI::Wtime()

MPI_Abort()

MPI_Abort() aborts (or at least tries to) all tasks in the group of a communicator. All associated processes are sent a SIGTERM.  The input parameters include comm, the communicator of taks to abort and errorcode, the error code to return to invoking the environment. The only output parameter is Fortran's , IERROR.

The syntax for MPI_Abort() is as follows for C, Fortran, and C++. 

C Syntax 
       #include <mpi.h> 
       int MPI_Abort(MPI_Comm comm, int errorcode) 

Fortran Syntax 
       INCLUDE ’mpif.h’ 
       MPI_ABORT(COMM, ERRORCODE, IERROR) 
            INTEGER        COMM, ERRORCODE, IERROR 

C++ Syntax 
       #include <mpi.h> 
       void Comm::Abort(int errorcode) 

MPI_Status()

MPI_Status is not a routine, but  rather a data structure and is typically attached to an MPI_Recv() routine. It is used by the a receiving function to obtain information about a received message and contains at least fields for the MPI_Source (an integer value of the processor sending the message), MPI_Tag the integer tag of the message, and MPI_Error, the integer error code.

MPI_Ssend()

MPI_Ssend performs a synchronous-mode, blocking send. Whereas MPI_Send will not return until the program can use the send buffer,  MPI_Ssend will no return until a matching receive is posted. It’s a fairly subtle difference, but in general, the best performance occurs if the program is written so that buffering can be avoided, and MPI_Ssend is used. Otherwise, MPI_Send is the more flexible option. 
The available input parameters include buf, the initial addess of the send buffer., count., an non-negative integer of the number of elements in the send buffer., datatype, a datatype of each send buffer element as a handle., dest, an integer rank of destination., tag, a message tag represented as an integer, and comm, the communicator handle. The only output paramter is Fortran’s IERRROR.

The syntax for MPI_Ssend() is as follows for C, Fortran, and C++.

C Syntax 
       #include <mpi.h> 
       int MPI_Ssend(void *buf, int count, MPI_Datatype datatype, int dest, 
            int tag, MPI_Comm comm) 

Fortran Syntax 
       INCLUDE ’mpif.h’ 
       MPI_SSEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, IERROR) 
            <type>    BUF(*) 
            INTEGER   COUNT, DATATYPE, DEST, TAG, COMM, IERROR 

C++ Syntax 
       #include <mpi.h> 
       void Comm::Ssend(const void* buf, int count, const Datatype& 
            datatype, int dest, int tag) const 

Other Send and Recv Routines

Although not used in the specific program just illustrated there are actually a number of other send options for Open MPI. These include MPI_Bsend , MPI_Rsend, MPI_Isend, MPI_Ibsend, MPI_Issend, and MPI_Irsend. These are worth mentioning in summary as follows:

MPI_Bsend(). Basic send with user-specified buffering and returns immediately.  It allows the user to send messages without worrying about where they are buffered (because the user has provided buffer space with MPI_Buffer_attach – if they haven’t they’ll encounter problems).

MPI_Rsend. Ready send; may be called if a matching receive has already 
posted. 

MPI_Irsend. A ready-mode, non-blocking send. Otherwise the same as  MPI_Rsend. 

MPI_Isend. A standard-mode, nonblocking send. It will allocate a communication request object and associate it with the request handle. A nonblocking send call indicates to the system to start copying data out of the send buffer.  A send request can be determined being completed by calling the MPI_Wait, MPI_Waitany, MPI_Test, or MPI_Testany with request returned by this function. The send buffer cannot be used until one of these conditions is successful, or an MPI_Request_free indicates that the buffer is available.

MPI_Ibsend. This initiates a buffered, nonblocking send. As it is non-blocking it indicates that the system may start copying data out of the send buffer, as it is buffered, it is a very good idea that the application does not access any part of the send until the send completes.

Although MPI_Send and MPI_Ssend are typical, there may be occassions when some of these routines are preferred. If non-blocking routines are necessary, for example, then look at MPI_Isend or MPI_Irecv.

MPI_Isend() 

MPI_Isend() provides a standard-mode, nonblocking send by allocating a communication request object and associate it with the request handle (the argument request). The request can be used later to query the status of the communication or wait for its completion. The nonblocking send call allows the system to copy data out of the send buffer. A send request can be determined being completed by calling the MPI_Wait.

The input paramters are buf, the initial address of the send buffer., count, an integer of the number of elements in the send buffer, datatype, a datatype handle of each send buffer element., dest, an integer rank of the destination., tag, an integer message tag, and comm, the comminicator handle. The output paramters are request, the communication handle request., and Fortran's integer IERROR.

The syntax for MPI_Isend() is as follows for C, Fortran, and C++.

C Syntax
       #include <mpi.h>
       int MPI_Isend(void *buf, int count, MPI_Datatype datatype, int dest,
            int tag, MPI_Comm comm, MPI_Request *request)

Fortran Syntax
       INCLUDE ’mpif.h’
       MPI_ISEND(BUF, COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR)
            <type>    BUF(*)
            INTEGER   COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR

C++ Syntax
       #include <mpi.h>
       Request Comm::Isend(const void* buf, int count, const
            Datatype& datatype, int dest, int tag) const

MPI_Irecv()

MPI_Irecv() provides a standard-mode, nonblocking receive. With a recv, the request handle (the argument request). The request can be used to query the status of the communication or wait for its completion. A  receive request can be  determined being completed by calling MPI_Wait.

The input paramters are buf, the initial address of the receive buffer., count, an integer of the number of elements in the receive buffer, datatype, a datatype handle of each receive buffer element., dest, an integer rank of the source., tag, an integer message tag, and comm, the comminicator handle. The output paramters are request, the communication handle request., and Fortran's integer IERROR.

The syntax for MPI_Recv() is as follows for C, Fortran, and C++.

C Syntax
       #include <mpi.h>
       int MPI_Irecv(void *buf, int count, MPI_Datatype datatype,
               int source, int tag, MPI_Comm comm, MPI_Request *request)

Fortran Syntax
       INCLUDE ’mpif.h’
       MPI_IRECV(BUF, COUNT, DATATYPE, SOURCE, TAG, COMM, REQUEST,
                 IERROR)
            <type>    BUF(*)
            INTEGER   COUNT, DATATYPE, SOURCE, TAG, COMM, REQUEST, IERROR

C++ Syntax
       #include <mpi.h> 
       Request Comm::Irecv(void* buf, int count, const Datatype& 
            datatype, int source, int tag) const 

MPI_Wait() 

Waits for an MPI send or receive to complete. It returns when the operation identified by request is complete. If the communication object was created by a nonblocking send or receive call, then the object is deallocated by the call to MPI_Wait and the request handle is set to MPI_REQUEST_NULL. The input parameter is request, the request handle. The output paramter is status, the status object and Fortran's integer IERROR.

The syntax for MPI_Wait() is as follows for C, Fortran, and C++.

C Syntax
       #include <mpi.h>
       int MPI_Wait(MPI_Request *request, MPI_Status *status)

Fortran Syntax
       INCLUDE ’mpif.h’
       MPI_WAIT(REQUEST, STATUS, IERROR)
            INTEGER   REQUEST, STATUS(MPI_STATUS_SIZE), IERROR

C++ Syntax
       #include <mpi.h>
       void Request::Wait(Status& status)
       void Request::Wait()


A Summary of Some Other MPI Send/Receive Modes


Send Mode
Explanation
Benefits
Problems
MPI_Send()
Standard send. May be synchronous or buffering
Flexible tradeoff; automatically uses buffer if available, but goes for synchronous if not.
Can hide deadlocks, uncertainty of type makes debugging harder.
MPI_Ssend()
Synchronous send. Doesn't return until receive has also completed.
Safest mode, confident that message has been received. 
Lower performance, especially without non-blocking.
MPI_Bsend()
Buffered send. Copies data to buffer, program free to continue whilst message delivered later.
Good performance. Need to be aware of buffer space.
Buffer management issues.
MPI_Rsend()
Receive send. Message must be already posted or is lost.
Slight performance increase since there's no handshake.
Risky and difficult to design.

As described previously the arguments dest and source in the various modes of send are the ranks of the receiving and the sending processes. MPI also allows source to be a "wildcard" through the predefined constant MPI_ANY_SOURCE (to receive from any source) and MPI_ANY_TAG (to receive with any source). There is no wildcard for dest. Again using the postal analogy, a recipient may be ready to receive a message from anyone, but they can't send a message to anywhere (as we'll see in the next section, you can however send to everywhere)!

The Prisoner’s Dilemma Example

The example of the Prisoner’s Dilemma (cooperation vs competition) is provided as an example to illustrate how non-blocking communications work. It in this example, there are ten rounds between two players. There are different pay-offs for each. In this particular version the distinction is between cooperation and competition for financial rewards. If both players cooperate they receive $2 for the round. If they both compete, they receive $1 each for the round. But if one adopts a competitive stance and the other a cooperative stance, the competitor receives $3 and the co-operative player nothing. 

A serial version of the code is provided (serial-gametheory.c, serial-gametheory.f90). Review and then attempt a parallel version from the skeleton versions of MPI (mpi-skel-gametheory.c, mpi-skel-gametheory.f90). Each process must run one of the players decision-making, then they both have to transmit their decision to the other, and then update their own tally of the result. Consider using MPI_Send(), or MPI_Irecv(), and MPI_Wait(). On completion review with a solution provided with mpi-gametheory.c and mpi-gametheory.f90 and submit the tasks with qsub.

4.6 Compiler Differences
------------------------

Compile the  mpi-pong.c and mpi-pong.f90 example MPI applications included with this chapter.  The submit the jobs with the included PBS script.  The command tracejob will provide some answers on how long a job took to complete, along with exit status and resources used. The syntax is tracejob <jobid>. If available, compare compilation with different compilers (e.g., GCC, Intel, PGI).


[EDIT]

Fill in the following for the MPI program msum after compiling it using the three MPI compilers.

Cores/Compiler
GCC
PGI
Intel
8 Cores (nodes=1:ppn=16)



16 Cores (nodes=1:ppn=16)



32 Cores (nodes=1:ppn=32)


4.7 Collective Communications
-----------------------------

MPI can also conduct collective communications.  These include MPI_Broadcast, MPI_Scatter, MPI_Gather, MPI_Reduce, and MPI_Allreduce. A brief summary of their syntax and description of effects is provided before a practical example.

The basic principle and motivation is that whilst collective communications this may provide a performance improvement, it will certainly provide clearer code. Consider the following C snippet of a root processor sending to all..

if ( 0 == rank ) {
  unsigned int proc_I;
  for ( proc_I=1; proc_I < numProcs; proc_I++ ) {
    MPI_Ssend( &param, 1, MPI_UNSIGNED, proc_I, PARAM_TAG, MPI_COMM_WORLD );
  }
}
else {
  MPI_Recv( &param, 1, MPI_UNSIGNED, 0 /*ROOT*/, PARAM_TAG, MPI_COMM_WORLD, &status );
}

Replaced with:

MPI_Bcast( &param, 1, MPI_UNSIGNED, 0/*ROOT*/, MPI_COMM_WORLD );

MPI_Bcast()

MPI_Bcast Broadcasts a message from the process with rank "root" to all other processes of the communicator, including itself. It is called by all members of group using the same arguments for comm, root and on return, the contents of root's communication buffer is been copied to all processes.

The input paramters include count, an integer of the number of entries in the buffer., datatype, the datatyope of the buffer handle., root, an integer rank of the broadcast root, and comm, the communicator handle., and buf, the starting address of the buffer (input and output). The only other output parameter is Fortran's , IERROR.

The syntax for MPI_Broadcast() is as follows for C, Fortran, and C++. 

C Syntax 
	#include <mpi.h>
	int MPI_Bcast(void *buffer, int count, MPI_Datatype datatype,
    	int root, MPI_Comm comm)

Fortran Syntax 
	INCLUDE ’mpif.h’
	MPI_BCAST(BUFFER, COUNT, DATATYPE, ROOT, COMM, IERROR)
	    <type>    BUFFER(*)
	    INTEGER    COUNT, DATATYPE, ROOT, COMM, IERROR

C++ Syntax 
	#include <mpi.h>
	void MPI::Comm::Bcast(void* buffer, int count,
	    const MPI::Datatype& datatype, int root) const = 0

MPI_Scatter(), MPI_Scatterv()

MPI_Scatter sends data from one task to all tasks in a group; the inverse operation of MPI_Gather. The outcome is as if the root executed n send operations and each process executed a receive. MPI_Scatterv scatters a buffer in parts to all tasks in a group.

The input parameters include sendbuff, the address of the send buffer., sendcount, an integer for root that is the number of elements to send to each process., sendtype, the datatype handle for root for send buffer elements., recvcount, an integer of the number of elements in the receive buffer., rectype, the datatype handle of receive buffer elements., root, the integer rank of the sending process., and comm, the communicator handle. MPI_Scatterv also has the input paramter of displs, an integrer array of group length size, which specifies a displacement relative to sendbuf. The output paramters include recvbuf, the address of the receive buff and the ever-dependable IERROR for Fortran,



The syntax for MPI_Scatter() is as follows for C, Fortran, and C++. 

C Syntax

#include <mpi.h>
int MPI_Scatter(void *sendbuf, int sendcount, MPI_Datatype sendtype,
    void *recvbuf, int recvcount, MPI_Datatype recvtype, int root,
    MPI_Comm comm)

Fortran Syntax

INCLUDE ’mpif.h’
MPI_SCATTER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT,
        RECVTYPE, ROOT, COMM, IERROR)
    <type>    SENDBUF(*), RECVBUF(*)
    INTEGER    SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, ROOT
    INTEGER    COMM, IERROR

C++ Syntax

#include <mpi.h>
void MPI::Comm::Scatter(const void* sendbuf, int sendcount,
    const MPI::Datatype& sendtype, void* recvbuf,
    int recvcount, const MPI::Datatype& recvtype,
    int root) const

MPI_Gather()

Gathers data and combines a partial array from each processor into one array on the root processor. Each process, including the root process, sends the contents of its send buffer to the root process. The root process receives the messages and stores them in rank order. The outcome is as if each of the n processes in the group (including the root process) had executed a call to MPI_Send() and root had executed n calls to MPI_Recv().

The input parameters include sendbuff, the address of the send buffer., sendcount, an integer of the number of elements in the send buff., sendtype, the datatype handle send buffer elements., recvcount, an root integer of the number of elements in the receive buffer., rectype, the datatype handle for root of receive buffer elements., root, the integer rank of the sending process., and comm, the communicator handle. The output paramters include recbuf, the address of the receive buff for root and the ever-dependable IERROR for Fortran,

The syntax for MPI_Gather() is as follows for C, Fortran, and C++. 

C Syntax

#include <mpi.h>
int MPI_Gather(void *sendbuf, int sendcount, MPI_Datatype sendtype,
    void *recvbuf, int recvcount, MPI_Datatype recvtype, int root,
    MPI_Comm comm)

Fortran Syntax

INCLUDE ’mpif.h’
MPI_GATHER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT,
        RECVTYPE, ROOT, COMM, IERROR)
    <type>    SENDBUF(*), RECVBUF(*)
    INTEGER    SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, ROOT
    INTEGER    COMM, IERROR

C++ Syntax

#include <mpi.h>
void MPI::Comm::Gather(const void* sendbuf, int sendcount,
    const MPI::Datatype& sendtype, void* recvbuf,
    int recvcount, const MPI::Datatype& recvtype, int root,
    const = 0


MPI_Reduce(), MPI_Allreduce()

MPI_Reduce performs a reduce operation (such as sum, max, logical AND, etc.) across all the members of a communication group. The reduction operation can be either one of a predefined list of operations, or a user-defined operation. 

MPI_Allreduce conducts the same operation but returns the reduced result to all processors. User defined reduction operations must be of type:

typedef void MPI_User_function( void* invec, void* inoutvec, 
                                int* len, MPI_Datatype* datatype )

A handle must be created to the reduction operation of type MPI_Op; and supplied MPI_Reduce (don't forget to free up after use).

The general principle in Reduce and All Reduce is the idea of reducing a set of numbers to a small set via a function. If you have a set of numbers (e.g., [1,2,3,4,5]) a reduce function (e.g., sum) can convert that set to a reduced set (e.g., 15). MPI_Reduce takes in an array of values as that set and outputs the result to the root process. MPI_AllReduce outputs the result to all processes.

The input paramters include sendbuf, the address of the send buffer., count, an integer number of elements in the send buffer., datatype, a handle of the datatype of elements in the send buffers., op, a handle of the reduce operation., root, the integrer rank of the root process., comm, the communicator handle. The output paramters are recvbug, the address of the receive buffer for root, and Fortran's IERROR.

The syntax for MPI_Reduce() is as follows for C, Fortran, and C++.

C Syntax

#include <mpi.h>
int MPI_Reduce(void *sendbuf, void *recvbuf, int count,
    MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm)

Fortran Syntax

INCLUDE ’mpif.h’
MPI_REDUCE(SENDBUF, RECVBUF, COUNT, DATATYPE, OP, ROOT, COMM,
        IERROR)
    <type>    SENDBUF(*), RECVBUF(*)
    INTEGER    COUNT, DATATYPE, OP, ROOT, COMM, IERROR

C++ Syntax

#include <mpi.h>
void MPI::Intracomm::Reduce(const void* sendbuf, void* recvbuf,
    int count, const MPI::Datatype& datatype, const MPI::Op& op,
    int root) const

MPI reduction operations include the following:


MPI_Name
Function
MPI_Max
Maximum
MPI_MIN
Minimum
MPI_SUM
Sum
MPI_PROD
Product
MPI_LAND
Logical AND
MPI_BAND
Bitwise AND
MPI_LOR
Logical OR
MPI_BOR
Bitwise OR
MPI_LXOR
Logical exclusive OR
MPI_BXOR
Bitwise exclusive OR
MPI_MAXLOC
Maximum and location
MPI_MINLOC
Miniumun and location

Other Collective Communications

Other collective communications include:

MPI_Barrier(): Synchronises processors
MPI_Alltoall():  useful way of sharing array and interleaving at the same time
MPI_Reduce_scatter(): Reduction operation on a set of arrays, followed by a scatter
MPI_Scan(): Same as reduce, except each processor i only works on arrays 0-i

Creating A New Communicator

Many MPI routines use the communicator as an argument. When one of these communicators is created, it needs to be associated with a group of ranked processes. This group needs to exist before the new communicator is created. The following code snippet creates a new group by eliminating processes from an existing group:

MPI_Group		worldGroup, subGroup;
MPI_Comm		subComm;
int			*procsToExcl, numToExcl;

MPI_Comm_group( MPI_COMM_WORLD, &worldGroup );
MPI_Group_excl( worldGroup, numToExcl, procsToExcl, &subGroup );
MPI_Comm_create( MPI_COMM_WORLD, subGroup, &subComm );

The program mpigroup.c can be compiled as follows:

$ mpicc mpigroup.c -o mpigroup

Then launch an interactive job:

$ qsub -l walltime=1:0:0,nodes=1:ppn=8 -I
qsub: waiting for job 319613.mgmt1 to start 
qsub: job 319613.mgmt1 ready 
$ cd $PBS_O_WORKDIR 
$ mpiexec mpigroup 
rank= 0 newrank= 0 recvbuf= 6 
rank= 1 newrank= 1 recvbuf= 6 
rank= 2 newrank= 2 recvbuf= 6 
rank= 3 newrank= 3 recvbuf= 6 
rank= 4 newrank= 0 recvbuf= 22 
rank= 5 newrank= 1 recvbuf= 22 
rank= 6 newrank= 2 recvbuf= 22 
rank= 7 newrank= 3 recvbuf= 22 


Particle Advector

Contained with the source code with this chapter, the particle advector hands-on excersise consists of two parts. 

The first example is designed to gain familiarity with the MPI_Scatter() routine as a means of distributing global arrays among multiple processesors via collective commuinication. Use the skeleton code provided and determine the number of particles to assign to each processor. Then use the function MPI_Scatter() to spread the global particle coordinates, ids and tags among the processors. 

For an advanced tests, on the root processor only, calculate the particle with the smallest distance from the origin (hint: MPI_Reduce( ) ). If the particle with the smallest distance is < 1.0 from the origin, then flip the direction of movement of all the particles. Then modify your code to use the MPI_Scatterv() function to allow the given number of particles to be properly distributed among a variable number of processors.

		int MPI_Scatterv ( 
        		void         	*sendbuf, 
        		int          	*sendcnts, 
        		int          	*displs, 
        		MPI_Datatype 	sendtype, 
        		void         	*recvbuf, 
        		int          	recvcnt,  
        		MPI_Datatype	recvtype, 
        		int          	root, 
        		MPI_Comm     	comm )


The second example is designed to gain a practical example of the use of MPI derived data types. Implement a data type storing the particle information from the previous exercise and use this data type for collective communications. Set up and commit a new MPI derived data type, based on the struct below:

		typedef struct Particle {
			unsigned int   globalId;
			unsigned int   tag;
			Coord          coord;
		} Particle;


	Hint: MPI_Type_struct( ), MPI_Type_commit( )

Then seed the random number sequence on the root processor only, and determine how many particles are to be assigned among the respective processors (same as for last exercise) and collectively assign their data using the MPI derived data type you have implemented.

5.0 Profiling and Debugging
===========================

5.1 Profiling with TAU/PDT and PAPI
-----------------------------------

Parallel Performance Issues include the following:

* Coverage - % of the code that is parallel
* Granularity - Amount of work in each section
* Load Balancing
* Locality - Communication structure
* Synchronization - Locking latencies

Since the performance of parallel programs are dependent on so many issues, it is an inherently difficult task to profile parallel programs.

Developed at the University of Oregon, the TAU (Tuning and Analysis Utilities) Performance System(R) and API is a profiling and tracing tookit, for C, C++, Fortran, Java, and Python and works with parallel code.  The profiling that TAU provides shows how much time was spent on each routine, and the tracing shows when events took place. It used PDT (Program Database Toolkit) as a high-level interface of source code for analysis.

It uses three methods to track the performance of applications; library interposition using tau_exec, or compiler directives and source transformation using PDT (Program Database Toolkit). Use of the tau_exec only requires shared library support, whereas compiler instrumentation requires recompiling, source instrumentation requires the source code. As a result, it is recommended that profiling and performance analysis starts with the library interposition and work towards the source as needed. MPI events can be instrumented from the interposition stage, as can throttling. Routine-level events require recompilation. Low-level events, such as loops etc require PDT and source code.

The steps involved in profiling parallel code are outlined as follows:

Instrument the source code with Tau macros
Compile the instrumented code
Run the program to view profile.* files  for each separate process

The instrumentation of source code can be done manually or with the help of another utility called PDT, which automatically parses source files and instruments them with Tau macros.

TAU provides multiple scripts (tau_cc.sh, tau_cxx.sh, tau_upc.sh, tau_f77.sh and tau_f90.sh) to compile programs.  A sample file from this chapter is the sendrecv.f90 or sendrecv.c file which is renamed mpi-debug.c and mpi-debug.f90 for the purposes of the experiment.

The scope of dynamic instrumentation depends on the libraries chosen (e.g., tracking MPI, io, memory). MPI instrumentation is included by default the others are enabled by command-line options to tau_exec. Using tau_exec simply follows the standard application to binary. For example, assuming that tau_exec is in the user's PATH and with the file mpi-debug[cf] that is included with this publication, and should be compiled first.

[lev@edward]$ qsub -l walltime=0:30:00,nodes=1:ppn=2 -I -X
[lev@edward006 ~]$ cd $PBS_O_WORKDIR
[lev@edward006 ch05]$ module load tau
[lev@edward006 ch05]$ tau_cc.sh mpi-debug.c -o mpi-debugc
[lev@edward006 ch05]$ mpiexec -np 2 tau_exec -io ./mpi-debugc

Which should generate the expected output:

I am a subsidiary process 1 of the group (total 2).
I am the root 0 process of the group (total 2).
processor 0  sent 1729
processor 1  received 1729

The profile of the application can be viewed with pprof (text) or paraprof (graphical).

[lev@edward006 ch05]$ pprof
[lev@edward006 ch05]$ module load java # necessary for paraprof
[lev@edward006 ch05]$ paraprof

The same applies with the Fortran version of the program:

[lev@edward006 ch05]$ tau_f90.sh mpi-debug.f90 -o mpi-debugf
[lev@edward006 ch05]$ mpiexec -np 2 tau_exec -io ./mpi-debugf

I am a subsidiary process   0.0000000      of the group (total            2 ).
processor            1  received         1729
I am the root 0 process of the group (total           2 ).
processor            0  sent         1729

[lev@edward006 ch05]$ pprof
[lev@edward006 ch05]$ paraprof


The instrumentation of a program can be customised by a file, which states which parts of an application are profiles and how. When using the TAU compiler wrapper scripts the -tau_options=-optTauSelectFile=<file> can be used to enable selective
instrumentation. Selective instrumentation is only available when using source-level instrumentation (PDT).

After instrumentation and compilation are completed, the profiled application is run to generate the profile data files. These files can be stored in a directory specified by the environment variable PROFILEDIR. By default, profiles are placed in the current directory. A TAU_VERBOSE environment variable can be set to see the steps the TAU measurement systems takes when the application is running. Other environment variables that can set to enable MPI measurement features are TAU_TRACK_MESSAGE to track MPI message statistics when profiling or messages lines when tracing, and TAU_COMM_MATRIX to generate MPI communication matrix data. 

In addition, many modern processors have performance counters, which measure events such as floating point operations, cache misses and so forth while an application executes. The Performance Data Standard and API (PAPI) provides a uniform interface to access these performance counters, which TAU can be compiled against. To use these counters, you must first find out which PAPI events your system supports. To do so type:

$ module load papi
$ papi_avail
[lev@edward seqandpar]$ papi_avail
Available PAPI preset and user defined events plus hardware information.
--------------------------------------------------------------------------------
PAPI Version             : 5.4.1.0
Vendor string and code   : AuthenticAMD (2)
Model string and code    : AMD Opteron(tm) Processor 6128 (9)
CPU Revision             : 1.000000
CPUID Info               : Family: 16  Model: 9  Stepping: 1
CPU Max Megahertz        : 2000
CPU Min Megahertz        : 800
Hdw Threads per core     : 1
Cores per Socket         : 8
Sockets                  : 2
NUMA Nodes               : 4
CPUs per Node            : 4
Total CPUs               : 16
Running in a VM          : no
Number Hardware Counters : 4
Max Multiplex Counters   : 32
--------------------------------------------------------------------------------
...
...
$ export PAPI_EVENT PAPI_FP_INS
$ export TAU_VERBOSE=1
$ export PROFILEDIR=/home/lev/profiledata/seqandpar
$ export TAU_COMM_MATRIX=1
$ export TAU_TRACK_MESSAGE=1
$ tau_cc.sh mpi-pingpong.c -o mpi-pingpongc
$ mpiexec -np 2 tau_exec -io ./mpi-pingpongc
$ paraprof &

Obviously this is but a basic introduction to TAU/PDT and PAPI, which provided information on compiling with TAU and generating profiles. The documentation from the appropriate providers should be consulted if detail on the much greater range of options and interpretation is desired. 

5.2 Memory Checking with Valgrind
---------------------------------

Originally developed by Julian Seward (who in 2006 won a Google-O'Reilly Open Source Award for his work on this application), Valgrind performs memory debugging, memory leak detection, and profiling - although it is its first two tasks which is what it is primarily used for. Through inserted instrumentation and wrappers, Valgrind can identify memory leaks, deallocation errors, etc in an application. The major tools provided are memcheck, for memory errors., helgrind and DRD for thread errors., Massif and DHAT, heap profilers., Cachegrind and Callgrind for cache, branch-prediction profiler and call-graph generating cach profiler.

Valgrind works with executable files with a standard invocation of the application name and the tool that is being used; memcheck is the default and can be ommitted. Compling with debugging information symbols (-g) is very useful to Valgrind, especially for associating functions. With C++ the -fno-inline also assists the function call chain. Optimisations are sometimes a problem for Valgrind as sometimes memcheck is fooled into incorrectly reporting unitialised values.

$ module load valgrind
$ mpicc -g mpi-debug.c -o mpi-debugc
$ mpif90 -g mpi-debug.f90 -o mpi-debugf
$ mpiexec -np 2 valgrind --tool=memcheck ./mpi-debugc 2> valgrindc.err
$ mpiexec -np 2 valgrind --tool=memcheck ./mpi-debugc 2> valgrindf.err

A command like this will produce a great deal of errors some of which are not at all related to the code that a programmer wrote. Valgrind will simulate every single instruction a program executes, including dynamically-linked libraries, X11 libraries etc. This can result in not-insignificant memory loss e.g.,

$ less valgrindc.err
..
==7574== LEAK SUMMARY:
==7574==    definitely lost: 4,937 bytes in 41 blocks
==7574==    indirectly lost: 3,936 bytes in 85 blocks
==7574==      possibly lost: 0 bytes in 0 blocks
==7574==    still reachable: 150,701 bytes in 164 blocks
==7574==         suppressed: 0 bytes in 0 blocks
==7574== Rerun with --leak-check=full to see details of leaked memory
..

There are several common errors that memcheck picks up, some of which can be found in the valgrin[cf].err file. For example:

==8826== Syscall param writev(vector[...]) points to uninitialised byte(s)
==8826==    at 0x3E1B0E033B: writev (in /lib64/libc-2.12.so)

Points to Unitialised Bytes

If a system call needs to read from a buffer provided by your program, memcheck checks that the buffer is addressable and has valid readable data. If the system call needs to write to a user-supplied buffer, memcheck checks that the buffer is addressable. If the program tries to write unitialised values this will be caught by memcheck.

Other common errors include the following:

Invalid read/write errors

When an application attempts to read or write memory to address that it shouldn't, memcheck will catch it, note the address and what other application was currently using that address space, and try to establish where the address was called from.

Invalid free() errors

Memcheck tracks memory blocks allocated by your program with malloc/new, so it can know exactly whether or not the argument to free a block is valid or not.

Mismatched free()/delete

As with invalid free() errors, memcheck will catch blocks that have been inappropriately deallocated. For example, in C++, if a memory block is allocated with `malloc` it must be deallocated with `free`, and if with new, it must be deallocated with `delete`.

Source and destination overlap

Memory blocks pointed to by the src and dst pointers in functions like memcpy(), strcpy(), strncpy(), strcat(), strncat(), aren't allowed to overlap. If they do, one can overwrite the contents posted by the other. Memcheck checks for this and will report the address, and where in the program the function is called.


To selectively suppress errors that a programmer has no control, recording these in a suppressions file which is read when Valgrind starts up. The build mechanism selects default suppressions which give reasonable behaviour for the OS and libraries detected on your machine. Use the --gen-suppressions=yes optionto print out a suppression for each reported error, which you can then be copied into a suppressions file. Valgrind loads suppression patterns from $PREFIX/lib/valgrind/default.supp unless --default-suppressions=no has been specified. Additional files by specifying --suppressions=/path/to/file.supp one or more times.

The default file can be viewed for an idea of the format:

less /usr/local/valgrind/3.9.0-openmpi-gcc/lib/valgrind/default.supp 
# This is a generated file, composed of the following suppression rules:
#  exp-sgcheck.supp xfree-3.supp xfree-4.supp glibc-2.X-drd.supp glibc-2.34567-NPTL-helgrind.supp glibc-2.X.supp
{
   ld-2.X possibly applying relocations
   exp-sgcheck:SorG
   obj:*/*lib*/ld-2.*so*
   obj:*/*lib*/ld-2.*so*
}

# I'm pretty sure this is a false positive caused by the sg_ stuff
{
   glibc realpath false positive
   exp-sgcheck:SorG
   fun:realpath
   fun:*
}

And a new mpi-suppress.supp can be created by copying the desired suppressed errors.

{
   MPI Errors Outside Our Control
   Memcheck:Param
   writev(vector[...])
   fun:writev
   fun:mca_oob_tcp_msg_send_handler
   fun:mca_oob_tcp_peer_send
   fun:mca_oob_tcp_send_nb
   fun:orte_rml_oob_send_buffer_nb
   fun:bad_allgather
   fun:orte_grpcomm_base_modex
   fun:ompi_mpi_init
   fun:PMPI_Init
   fun:main
}

Running the program again, valgrind will still report the memory that has been lost, but it will report that none of the errors arise from mpi-debug

$ mpiexec -np 2 valgrind --tool=memcheck --suppressions=mpi-suppress.supp ./mpi-debugc 

5.3 Debugging with GDB
----------------------

It has taken many years for this essential truth to be realised, that software equals bugs – a great example of this is Paul Fenwick's presentation to OSDC on “An Illustrated History of Failure” (2008), which reported some rather inglorious examples such as the Therac-25, the Ariane 5, Northeast America 2003 Power Outage, and many others. In sequential programming bugs are common enough - parallel systems, the bugs are particularly difficult to diagnose, and the core principle of parallelisation suggests race conditions and deadlocks. According to a 2002 study by the US Department of Commerce determined, "software bugs, or errors, are so prevalent and so detrimental that they cost the US economy an estimated $59 billion annually, or about 0.6 percent of the gross domestic product".

One very useful application for debugging is the GNU Debugger, or gdb, after its executable, which operates on a wide variety of programming languages including Ada, C, C++, Objective-C,,Fortran, Pascal, Java and others. It was first written by Richard Stallman in 1986 and is in very active development. GDB allows the user to trace execution but also to alter that execution as it is occurring, including internal variables and functions. 

The core principle behind GDB is building a debugging symbol table, that maps the instructions in a compiled binary to their values in source code. Programs (including parallel programs with OpenMP and MPI) can be compiled in gcc with the -g flag to provide for such a symbol table. As with other compilations and testing activities, if one is operating on a shared compute cluster, it is much better to conduct these activities on a compute node - not only is it polite to other users, it also ensures that the job will be running on the architecture that the computation will occur on.

GDB operates from an interactive shell, with a range of commands to run a program, conduct a backtrace, print the value of an expression, stepping through the program or instructions line-by-line, inserting and clearing breakpoints, and so forth. A more thorough explanation of commands can be invoked through the built-in help. The following example simply lists the program, runs it, inserts a breakpoint, runs through the program line-by-line, and displays information on current known threads.

[lev@edward015 seqandpar]$ gdb hello3versompc
GNU gdb (GDB) 7.6
...
(gdb) list
1	#include <stdio.h> 
2	#include  "omp.h"
3	int main(void) 
4	{ 
5	   char greetingsen[] = "Hello world!"; 
6	   char greetingsde[] = "Hallo Welt!";
7	   char greetingsfr[] = "Bonjour le monde!";
8	   int a;
9	   #pragma parallel 
10	
(gdb) run
Starting program: /data/user1/lev/programming/seqandpar/hello3versompc 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
Hello world!
..
Hallo Welt!
..
Bonjour le monde!
[Inferior 1 (process 19433) exited normally]
(gdb) break 4
Breakpoint 1 at 0x40064c: file hello3versomp.c, line 4.
(gdb) run
Starting program: /data/user1/lev/programming/seqandpar/hello3versompc 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
5	   char greetingsen[] = "Hello world!"; 
(gdb) n
6	   char greetingsde[] = "Hallo Welt!";
(gdb) n
7	   char greetingsfr[] = "Bonjour le monde!";
(gdb) n
14	   for ( a = 0; a < 100; a = a + 1 
Breakpoint 1, main () at hello3versomp.c:5
5	   char greetingsen[] = "Hello world!";
(gdb) info threads
  Id   Target Id         Frame 
* 1    Thread 0x7ffff7dd7760 (LWP 20560) "hello3versompc" main ()
    at hello3versomp.c:14

Despite its supported for threaded applications, parallelism with distributed memory and message passing (e.g., OpenMPI) however can create some difficulties if conducted naively as following illustrates. 

$ qsub -l nodes=1:ppn=2:walltime=0:60:0 -I
$ cd $PBS_O_WORKDIR
$ module load gdb
$ module load openmpi-gcc
$ gcc -fopenmp -g hello3versomp.c -o hello3versompc
$ gfortran -fopenmp -g hello3versomp.f90 -o hello3versompf
$ mpicc -g mpi-debug.c -o mpi-debugc  
$ mpif90 -g mpi.debug.f90 -o mpi-debugf



$ gdb mpi-debugc
GNU gdb (GDB) 7.6
Copyright (C) 2013 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-unknown-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /data/user1/lev/programming/seqandpar/mpi-debug...done.
(gdb) list
5	int main(argc,argv)
6	int argc;
7	char *argv[];
8	{
9	    int myid, numprocs;
10	    int tag, source, destination, count;
11	    int buffer;
12	    MPI_Status status;
13	 
14	    MPI_Init(&argc,&argv);
(gdb) r
Starting program: /data/user1/lev/programming/seqandpar/mpi-debugc 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
I am the root 0 process of the group (total 1).
[edward027:20645] *** An error occurred in MPI_Send
[edward027:20645] *** on communicator MPI_COMM_WORLD
[edward027:20645] *** MPI_ERR_RANK: invalid rank
[edward027:20645] *** MPI_ERRORS_ARE_FATAL (your MPI job will now abort)
[Inferior 1 (process 20645) exited with code 06]

There are two common workarounds to this problem. The first is to launch multiple xterms with forwarding (which is not a good idea on a shared cluster login). The second, and recommended method, is to attach to the individual MPI processes after they are initiated. For the first method, in some cases an X-forwarding session can be initiated like follows:

$ mpiexec -np 2 xterm -e gdb mpi-debug

This will open two xterm windows on the host machine (one for each processor), although this sort of command does have the issues of ensuring the ssh connections active and ensuring the correct DISPLAY environment. In addition, as mentioned, if running on a cluster this should be conducted on the compute node as an interactive job (that is, X-windows forwarding to the cluster login node and from the login node to the compute node). Assuming all this is in place however, running the program over both xterm sessions will result in the following:

(gdb) run
Starting program: /data/user1/lev/programming/seqandpar/mpi-debugc 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
I am the root 0 process of the group (total 2).
processor 0  sent 1729
[Inferior 1 (process 2990) exited normally]

(gdb) run
Starting program: /data/user1/lev/programming/seqandpar/mpi-debugc 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib64/libthread_db.so.1".
I am a subsidiary process 1 of the group (total 2).
processor 1  received 1729
[Inferior 1 (process 2998) exited normally]

The second, and recommended method, is to insert a catch within the application's source code and recompile, then use gdb --pid to attach to the processors after the application is launched. It's the equivalent of the above, but without the associated problems. The following - although noted by the OpenMPI developers as 'inelegant' is recommended.


{
    int i = 0;
    char hostname[256];
    gethostname(hostname, sizeof(hostname));
    printf("PID %d on %s ready for attach\n", getpid(), hostname);
    fflush(stdout);
    while (0 == i)
        sleep(5);
}

After incorporating this catch into the source code, then recompile, and run gdb, change i to a non-zero value, and then the program can be walked through as normal on each processor.

$ vim mpi-debug.c
$ module load openmpi-gcc
$ module load gdb
$ mpicc -g mpi-debug.c -o mpi-debugc
$ mpiexec -np 2 ./mpi-debugc
PID 5607 on edward ready for attach
PID 5608 on edward ready for attach

$ gdb --pid 5607
..
(gdb) list
(gdb) set var i = 1
(gdb) n
(gdb) n
...
Single stepping until exit from function __libc_start_main,
which has no line number information.

Program exited normally.

$ gdb --pid 5608
(gdb) list
(gdb) set var i = 1
(gdb) n
..
(gdb) n
Single stepping until exit from function __libc_start_main,
which has no line number information.
[Inferior 1 (process 5608) exited normally]

When the program completes, the results will appear in the original execution environment.

I am the root 0 process of the group (total 2).
processor 0  sent 1729
I am a subsidiary process 1 of the group (total 2).
processor 1  received 1729
$ 


References
==========

Fork-join image by Qwertyus, https://commons.wikimedia.org/wiki/File:Fork_join.svg, This file is licensed under the Creative Commons Attribution 3.0 Unported license.



