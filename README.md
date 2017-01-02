# HELP on KNL

## HELP
HELP (Helsinki Lattice Package) is a Quantum Chronodynamics (QCD) code developed at the Department of Physics,
University of Helsinki. It has been developed for several years and contains a bunch of different models. It is not
licensed under any OS license per se but available upon request for academic use.

## Porting

The pure-MPI version of the code was straightforward to compile by simple adapting the makefiles to use Intel compilers.
The makefiles are available in this branch.

There is an experimental (and apparantly unfinished) OpenMP version of the code, but that does not work (but segfaults) at least
with the test cases we had. This is the case also with other compilers (GNU) and on other platforms (Cray XC40 with Haswell CPUs).

## Performance

### Test case

A small test case was provided by the lead developer that was fast to run with one node. (I have no idea what it is about).

The case is compute-bound and no I/O is performed (just a kilobyte or so of log file).

### Run parameters

A brute-force sweep over relevant run-time parameters was carried out. The run script is in this repository.

### Results

The best results from the sweep are as follows.

| Run | Runtime (s) |
|-----|-------------|
| 1-w HT (64 MPI tasks) | xx  |
| 2-w HT (128 MPI tasks) | yy  |
| 4-w HT (256 MPI tasks) | zz  |
| Reference (2 x HSW) | xx | 

The reference result was obtained with one node of a Cray XC40, featuring two 12c 2.6 GHz Haswell processors and run 
with one-way hyperthreading, i.e. 24 MPI tasks.

### Analysis

## Conclusions and outlook
