# Sequential CPU

## General

This project contains a simple sequential cpu in system verilog.

## Requirements

- havard architecture
- 16 bit instructions
- 16 bit data
- only 2 registers (accumulator and point register) should be accessible from outside (Assembler)
- instruction set should be identical to given instruction set (-> compatible with student cpu)

## Instruction set

The current instruction set is not yet done, so be aware of missing important instructions.

| Layout | Name  | Opcode  | Register1 | Register2 | Immediate |
| ------ | ----- | ------- | --------- | --------- | --------- | 
| 8+8    | NOOP  | 0x00    |           |           | 0xXX      |
|        |       |         |           |           |           |
| 5+3+8  | ADD   | 0b11000 | 0bXXX     |           | 0xXX      |
|        | SUB   | 0b11001 | 0bXXX     |           | 0xXX      |
|        | IN    | 0b11010 | 0bXXX     |           | 0xXX      |
|        | OUT   | 0b11011 | 0bXXX     |           | 0xXX      |
|        | MOV0L | 0b11100 | 0bXXX     |           | 0xXX      |
|        | MOVH  | 0b11101 | 0bXXX     |           | 0xXX      |
|        | JUMPS | 0b11110 | 0bXXX     |           | 0xXX      |
|        | XXXX  | 0b11111 | 0bXXX     |           | 0xXX      |
|        |       |         |           |           |           |

## Special register address

Some special register addresses will be named soon

| I-Layout | Name  | Address |
| -------- | ----- | ------- |
| 8+8      |       |         |
| 5+3+8    | ACC   | 0b000   |
|          | MAR   | 0b001   |
|          | MDR   | 0b010   |
|          | R1    | 0b011   |
|          | R2    | 0b100   |
|          | R3    | 0b101   |
|          | R4    | 0b110   |
|          | R5    | 0b111   |

## TODO

TODO

## Done

TODO