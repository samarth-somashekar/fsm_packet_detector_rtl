# FSM-Based Packet Detector (RTL Project)

This project implements a simple 4-state FSM that detects a specific 3-byte packet sequence (0xAA → 0x55 → 0xF0). When the pattern is detected, the output `Y` is asserted for 1 clock cycle.

## 🔧 Modules
- `packet_detector.v`: RTL implementation of the FSM
- `packet_detector_tb.v`: Testbench applying stimulus and observing output

## 🎯 Detection Pattern
```
X = 0xAA → 0x55 → 0xF0 → Y = 1
```

## 📦 How to Run

### Simulation (Icarus Verilog)
```bash
iverilog -gsystem-verilog -o packet.vvp packet_detector.v packet_detector_tb.v
vvp packet.vvp
gtkwave packet.vcd
```

## ✨ Author
Samarth Somashekar – ECE @ PES University | VLSI + FFVD Enthusiast
