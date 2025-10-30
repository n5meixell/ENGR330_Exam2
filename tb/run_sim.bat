@echo off
setlocal

REM --- Added the Vivado tools to the path ---
set VIVADO_BIN=C:\Xilinx\Vivado\2018.2\bin
set PATH=%VIVADO_BIN%;%PATH%

echo.
echo --- Verilog Files ---
call xvlog.bat -sv "C:\Users\meix5579\OneDrive - University of St. Thomas\Desktop\Adder-Test2\adder_rtl\CLA_adder.v"
call xvlog.bat -sv "C:\Users\meix5579\OneDrive - University of St. Thomas\Desktop\Adder-Test2\adder_rtl\prefix_adder.v"
call xvlog.bat -sv "C:\Users\meix5579\OneDrive - University of St. Thomas\Desktop\Adder-Test2\adder_rtl\RCA.v"
call xvlog.bat -sv "C:\Users\meix5579\OneDrive - University of St. Thomas\Desktop\Adder-Test2\tb\tb_adders.v"

echo.
echo --- Getting the design ---
call xelab.bat tb_adders -debug typical -s sim_tb

echo.
echo --- Running the simulation ---
call xsim.bat sim_tb -runall

echo.
echo Done Running
pause
