Author: Nathan Meixell
Instructor: Prof. Hassan Salamy
University Of St. Thomas

Overview
Implement and compare 3 different parameterized N-bit adder architectures in veirlog. 
With a goal in studying the tradeoffs in performance and complexity for cost.

Adder-Types
Ripple -Carry Adder (RCA): Simple
Carry-Lookahead Adder (CLA)" 4-bit CLA blocks with connection of ripple logic
Prefix Adder -  High-Speed & high cost computation that is added in parallel.

Requirements for Adders: Ateast two of the adders use structural logic, and one uses behavioral. In this repository the
RCA and CLA use structural while the Prefix uses behavioral.

The repository structure:
adder_rtl/
  RCA.v
  CLA_adder.v
  prefix.v
tb/
  tb_adders.v
  run_sim.bat
results/
results.md
8_16_bit_width.png
32_64_bit_width.png
