# ===========================================================
# Questa Simulation Script for Register File Project
# Author: Hossam
# ===========================================================

# 🧹 Clean and prepare the working library
vdel -all
vlib work
vmap work work

# 🧱 Compile all design and testbench files (VHDL-2008)
vcom -2008 RegisterFile_DFF.vhd
vcom -2008 RegisterFile_Memory.vhd
vcom -2008 RegisterFile_TB.vhd

# 🚀 Load the testbench for simulation
vsim work.RegisterFile_TB

# 🌊 Add all signals to the waveform
add wave *

# ⏱️ Run full simulation (adjust time as you wish)
run -all

# 🔍 Zoom out to see the full waveform
wave zoom full
