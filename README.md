# String-Sorting-MASM-

## Introduction 
This assembly language program aims to sort three strings provided by the user. It prompts the user to enter three names and calculates the sum of the ASCII values for each string. The program then compares the sums to determine the largest, smallest, and middle strings. Finally, it displays the strings in ascending order based on their respective sums.
![image](https://github.com/HammadHk1/String-Sorting-MASM-/assets/117303560/bb13a0b4-780b-4c2e-b644-aeef001e89ee)
## Code Explained
The code begins by initializing the necessary data elements and displaying messages to prompt the user for input. It uses a loop to calculate the sum of ASCII values for each character in each string and stores the sums in separate variables <b>(sum1, sum2, and sum3)</b>.

After obtaining the sums, the code compares them to determine the largest and smallest values. It uses conditional jumps <b>(jbe, jne, jae, etc.)</b> to control the flow of execution based on the comparison results.

The program then displays the strings in the desired order by checking the sums and comparing them to the largest, middle, and smallest values. It utilizes conditional jumps and displays the strings using the <b>int 21h</b> interrupt.

Finally, an exit option is provided, and the program terminates.

## Flow of Code

- The program starts by setting up the data segment and stack.
- It prompts the user to enter three strings.
- It reads the input strings using interrupt 21h with function 3fh.
- The program initializes variables and counters for further calculations.
- A loop is used to calculate the sum of ASCII values for each character in the first string.
- The sum is added to sum1, and the counter is incremented.
- The loop continues for the second and third strings, updating sum2 and sum3.
- The program compares the sums to find the smallest, largest, and middle values.
- Based on the comparisons, it displays the strings in the desired order using interrupt 21h with function 09h.
- The program provides an exit option and terminates.

##  Execution:
You have Download MASM 8086 to execute this code. After Download link your Dosbox with Bin Folder of Masm and put Code.asm file bin and run on Dosbox.
Do following Task to Mount
```
mount c C:\path\to\directory
```
```
C:
```
```
masm Code.asm;
```
```
link filename.obj;
```
```
filename.exe
```
