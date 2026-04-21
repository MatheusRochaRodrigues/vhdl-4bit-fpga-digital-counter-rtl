# 📌 Project: 4-bit Counter using VHDL (FPGA / RTL Design)

## 📖 Overview  

This project implements a 4-bit counter using VHDL, targeting FPGA hardware.  
The design is based on fundamental digital logic concepts, including registers, adders, and combinational/sequential circuits.

The counter increments its value on each clock cycle and displays the result on a 7-segment display.  

---

## 🧠 Key Concepts

- RTL (Register Transfer Level) design  
- Digital logic design (flip-flops, registers, adders)  
- Sequential and combinational circuits  
- Hardware description using VHDL  
- FPGA-based implementation (Quartus Prime)  

---

## ⚙️ Architecture

The system is composed of:

- 4-bit Register (built using D Flip-Flops)  
- 4-bit Adder (constructed from full adders)  
- Control signals (clock and asynchronous clear)  
- 7-segment display decoder  

---

## 🔄 Data Flow

**Register → Adder (+1) → Register → Display**

- The register stores the current state  
- The adder increments the value  
- The result is fed back into the register  
- The output is displayed in hexadecimal  

---

## 🧩 Components

- `REG.vhd` → 4-bit register (flip-flops)  
- `neg_d.vhd` → D flip-flop with async clear  
- `soma.vhd` → 1-bit full adder  
- `Func_soma.vhd` → 4-bit adder  
- `DISPLAY.vhd` → 7-segment decoder  
- `cont7seg.vhd` → top-level module  

---

## 🛠 Tools

- Quartus Prime Lite Edition  
- FPGA development board (DE10-Lite)  

---

## 💡 Features

- Asynchronous clear input  
- Clock-driven counting  
- Hexadecimal display output  
- Modular RTL design  

---

## 🧠 What I Learned

- How to design hardware using VHDL  
- How data flows between registers in RTL systems  
- How arithmetic logic is implemented at the gate level  
- How to map high-level descriptions into real hardware (FPGA)  
