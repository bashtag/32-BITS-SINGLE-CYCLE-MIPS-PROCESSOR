# 32-Bit MIPS Processor Project

This project presents a structural VHDL implementation of a 32-bit MIPS processor, adhering to the Harvard architecture for instruction storage. Utilizing a custom assembler, the processor interprets assembly code, converting it into binary instructions stored in `instructions.mem`. The project integrates the ALU design from a previous project and manages data through `instructions.mem`, `registers.mem`, and `memory.mem`.

## Project Structure

- **multiplexers**: Contains multiplexer modules for ALU control and MIPS.
- **output_files**: Generated files post-compilation.
- **processor_modules**: The core modules of the MIPS processor including the ALU, control unit, and instruction block.
- **simulation**: Directory for simulation-related files, including testbenches and memory files.
- **testbenches**: Testbench files for simulating the processor.
- **mipsV_assembler.py**: Python assembler script for converting `.asm` files to binary format.

Backup files with the `.bak` extension are also provided.

## Assembler Usage

To convert assembly code in `program.asm` to binary:

1. Run `mipsV_assembler.py`.
2. The binary code will be output to `instructions.mem` within the simulation folder.

## Simulation Files

- `instructions.mem`: Binary instruction memory file.
- `registers.mem`: Binary register file containing the initial state of registers.
- `memory.mem`: Binary file representing the main memory contents.

## Simulation

The MIPS processor can be simulated using a testbench that loads the binary files.

### Steps for Simulation:

1. Ensure all `.mem` files are updated with the initial values for simulation.
2. Run the testbench file specific to your simulation environment.
3. Observe the simulation results for expected processor behavior.

## Project Information

Detailed information about opcodes, function codes, and specific restrictions are provided in the accompanying PDF documentation.

## Contributing

Contributions to the MIPS processor design are welcome. If you wish to contribute, please fork the repository, make your changes, and submit a pull request with your updates.

## License

This MIPS Processor project is open-sourced under the MIT License. See the LICENSE file for more details.
