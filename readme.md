# Example project for Olimex iCE40HX1K-EVB

[Olimex ice40 evaluation Board](https://www.olimex.com/Products/FPGA/iCE40/iCE40HX1K-EVB/open-source-hardware)

## Compilation steps with icestorm toolchain
- Convert VHDL to Verilog with [vhd2vl](https://github.com/ldoolitt/vhd2vl)

- Compile verilog with [yosys](https://github.com/YosysHQ/yosys)

- Place & route with [arachne-pnr](https://github.com/cseed/arachne-pnr)

- Convert to bin with [icepack](https://github.com/cliffordwolf/icestorm)


## Run example
```
make
```