# Xilinx Zynq UltraScale+ MPSoC Series Development Board AXU9EG、AXU15EG
## Introduction to Development Board
The entire structure of the development board is designed based on our consistent core board+extension board pattern. Core board and expansion board
High speed inter board connectors are used for connection. The AXU9EG uses the core board ACU9EG, and the AXU15EG uses the core board ACU15EG,
The backplane expands a variety of peripheral interfaces for the core board, including one M.2 interface, one DP output interface, and four channels
USB 3.0 interface, 2-way Gigabit Ethernet interface, 2-way optical fiber interface, 2-way SATA interface, 2-way UART interface, 1-way
SD card interface, 1 channel FMC interface, 2 channels CAN bus interface, 2 channels RS485 interface, 1 channel MIPI interface, 1 channel
40 pin expansion port and some key LEDs.
## Key Features
### Core Board part
| name of core board         |  ACU9CG              | ACU15EG              | 
|--------------------|----------------------|---------------------|
| ZYNQ              |  XCZU9EG-2FFVB1156I   | XCZU15EG-2FFVB1156I   | 
| GPU+VCU            | no                   | no                  | 
| size               | 80x60mm              | 80x60mm             | 
| DDR4               |  4GB(PS),2GB(PL)      |  4GB(PS),2GB(PL)   |  
| QSPI FLASH         |  256MB                |  256MB               | 
| EMMC Flash         |  8GB                 |  8GB                |  
| voltage               | 12V                  | 12V                 | 
| connectors(b2b)    | 4x120pins            | 4x120pins           | 
| Logic Cells        | 600K                 | 746K                | 
| flip-flops         | 548K                  |  682K              | 
| LUTs               |  274K                  |  341K                |
| Block RAM          | 32.1Mb               | 26.2Mb             | 
| CMTs               | 4                    | 4                   | 
| DSP                | 2520                  | 3528                | 
| GTH  16.3Gb/s      | 24                     | 24                    | 
### Bottom Board part
1. 1-way M.2 interface, PCIEx1 (ps), speed 6Gbps
1 channel DP output interface, mini DP (ps), maximum support 4kx2k@30fps Output
3. 4-way USB 3.0 interface, USB (ps), speed 5.0Gbps, flat USB interface (USB Type A)
4. 2-way Gigabit Ethernet interface, jl2121, 1-way ps, 1-way pl, rgmii interface
5. Two uarts to usb, one connected to ps, and one connected to pl
6. 1 Micro SD card holder (ps)
7. 2-way SFP optical fiber interface, with a speed of 12.5Gbs
8. Two 40-pin expansion ports, 2.54mm spacing, one 5v, two 3.3v, three gnd, and 34 IO ports. The IO level standard of the expansion port is 3.3V
9. 2-way CAN communication interface (ps)
10. 2-way 485 communication interface (PL)
11. 1-way mipi interface (pl), 15PIN FPC connector, 2 lane data, 1 pair of clocks
12. 1 FMC HPC
13. One RTC real-time clock, 32.768KHz passive clock (ps)
14. EEPROM and temperature sensor, one EEROM 4Kbit (2x256x8bit) (ps), one LM75 temperature chip (ps), with an accuracy of 0.5 degrees
15. Four LED lights, one dual color indicator light, one Done indicator light, one PL control, and one PS control
16. Three buttons, one reset button RESET, and two user buttons
17. One 4-digit dial switch, and the board supports four startup modes
18. Size 180.0mm x 135.0mm
19. Power supply 12v/3A
# AXU9EG/AXU15EG Demo Project
## Description
This is vivado factory demo project for ALINX board.
## Requirement
* Vivado 2020.1
* AXU9EG/AXU15EG Development Board
## Create Vivado Project
* Download recent release ZIP archive.
* Create new project folder.
* Extract the download ZIP to the new project folder.
* For different development board, please open **\<archive extracted location\>/vivado/auto_create_project/project_info.tcl**
Choose one devicePart and save.

xczu9eg-ffvb1156-2-i is for AXU9EG  
xczu15eg-ffvb1156-2-i is for AXU15EG  
```
set devicePart "xczu9eg-ffvb1156-2-i"
#set devicePart "xczu15eg-ffvb1156-2-i"
set runs_jobs 5
```

There are two methods to create vivado project as below:
### Create Vivado Project in Vivado tcl console
1. Open Vivado software and switch to "**auto_create_project**" path with **cd** command and **Enter**
```
cd \<archive extracted location\>/vivado/auto_create_project
```
2. Type **source ./create_project.tcl** and **Enter**
```
source ./create_project.tcl
```

### Create Vivado Project using bat
1. In "**auto_create_project**" folder, there is "**create_project.bat**", open it in edit mode, and change to your own vivado software installation path. Save and close.
```
CALL E:\XilinxVitis\Vivado\2020.1\bin\vivado.bat -mode batch -source create_project.tcl
PAUSE
```
2. Double click bat file in Windows environment


For more information, please post on the [ALINX Website] (https://www.alinx.com/en).
