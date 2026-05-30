# 4-Bit Arithmetic Logic Unit (ALU)
This project implements a 4-Bit Arithmetic Logic Unit (ALU) in Verilog HDL based on the functionality of the DM74LS181 ALU IC. The design supports multiple arithmetic and logical operations controlled using function select inputs, mode selection, and carry input signals.

The project was developed by referring to the DM74LS181 datasheet to understand the internal functionality and waveform behavior of the ALU.

The project includes RTL design, functional verification using a testbench, simulation waveform generation, logic synthesis, and synthesized RTL schematics.
---

## Design Specifications

- 4-Bit ALU
- Arithmetic and Logic Operations
- 4-Bit Function Select Input
- Carry Input and Carry Output Support
- Generate and Propagate Outputs
- Comparator Output
- Active High and Active Low Operation Modes

---

## Tools Used

- Quartus II for RTL Design and Logic Synthesis
- ModelSim-Altera for Simulation and Waveform Generation
- Verilog HDL

---

## Features

- Supports multiple arithmetic operations
- Supports multiple logical operations
- Comparator functionality for equality checking
- Carry Generate and Carry Propagate outputs
- Arithmetic mode and logic mode selection
- Behaviour inspired by DM74LS181 ALU architecture
- Functional verification using randomized testbench inputs

---

## RTL Design Description

The ALU performs arithmetic and logical operations based on:
- Function Select Inputs (`S[3:0]`)
- Mode Control (`M`)
- Carry Input (`Cn`)
- Signal Input for active HIGH/LOW operation

### Outputs
- `F[3:0]` → Function Output
- `comp` → Comparator Output
- `G` → Carry Generate
- `P` → Carry Propagate
- `Cn4` → Carry Output

The design includes internal propagate and generate logic similar to the original DM74LS181 architecture.

---

## Functional Description

### Logic Mode
When Mode (`M`) is HIGH:
- The ALU performs logical operations such as:
  - AND
  - OR
  - XOR
  - NAND
  - NOR
  - Complement operations

### Arithmetic Mode
When Mode (`M`) is LOW:
- The ALU performs arithmetic operations such as:
  - Addition
  - Subtraction
  - Increment
  - Decrement
  - Double operations
  - Arithmetic combinations of inputs

The carry input (`Cn`) controls arithmetic behaviour and carry propagation.

---

## Testbench Verification

The testbench verifies:
- Randomized arithmetic operations
- Randomized logical operations
- Carry functionality
- Comparator behaviour
- Different function select combinations
- Active HIGH and active LOW operation modes

Simulation is performed using ModelSim-Altera.

---

## Simulation Results

Waveform analysis confirms:
- Correct arithmetic operation execution
- Proper logical operation behaviour
- Accurate carry generation and propagation
- Correct comparator output generation
- Proper response to randomized test inputs

---

## Synthesis Results

Logic synthesis is performed using Quartus II.

Synthesis outputs include:
- RTL schematic
- Logic synthesis report

---

## Datasheet Reference

The functionality and operation modes of this ALU were studied using the Fairchild DM74LS181 datasheet.

Referenced Datasheet:
- DM74LS181 4-Bit Arithmetic Logic Unit 
---

## Applications

- Processor datapath design
- Arithmetic computation units
- Digital logic systems
- Embedded system design
- Educational VLSI projects
- Custom processor architecture development

---

## Author

Shaan Garg
