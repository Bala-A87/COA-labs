# Instruction for compilation and execution

- The processor.cpp file can be compiled by simply running 'g++ processor.cpp' in the terminal and the generated executable can be run directly
- For running the program, make sure that the required files i.e. ICache.txt, DCache.txt and RF.txt are present in the working directory of the program
- Ensure that ICache.txt contains the proper instructions corresponding to the program that needs to be run
- The program will output two files, ODCache.txt and Output.txt
- ODCache.txt will contain the final state of the Data cache after execution of the given program
- Output.txt will contain various statistics regarding the execution of the program on the processor such as no. of cycles, no. of stall, etc.