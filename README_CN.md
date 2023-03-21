# Xilinx Zynq UltraScale+ MPSoC 系列开发板AXU9EG、AXU15EG
## 开发板介绍
开发板的整个结构，继承了我们一贯的核心板+扩展板的模式来设计的。核心板和扩展板
之间使用高速板间连接器连接。AXU9EG使用核心板ACU9EG，AXU15EG使用核心板ACU15EG,
底板为核心板扩展了丰富的外围接口，其中包含 1 路 M.2 接口、1 路 DP 输出接口、4 路
USB3.0 接口、2 路千兆以太网接口、2 路光纤接口、2 路 SATA 接口、2 路 UART 接口、1 路
SD 卡接口、1 路 FMC 接口、2 路 CAN 总线接口，2 路 RS485 接口，1 路 MIPI 接口，1 路
40 针扩展口和一些按键 LED。
## 关键特征
### 核心板部分

| 核心板型号         |  ACU9CG              | ACU15EG              | 
|--------------------|----------------------|---------------------|
| 主芯片             |  XCZU9EG-2FFVB1156I   | XCZU15EG-2FFVB1156I   | 
| GPU+VCU            | no                   | no                  | 
| size               | 80x60mm              | 80x60mm             | 
| DDR4               |  4GB(PS),2GB(PL)      |  4GB(PS),2GB(PL)   |  
| QSPI FLASH         |  256MB                |  256MB               | 
| EMMC Flash         |  8GB                 |  8GB                |  
| 电压               | 12V                  | 12V                 | 
| 连接器(板对板)     | 4x120pins            | 4x120pins           | 
| Logic Cells        | 600K                 | 746K                | 
| flip-flops         | 548K                  |  682K              | 
| LUTs               |  274K                  |  341K                |
| Block RAM          | 32.1Mb               | 26.2Mb             | 
| CMTs               | 4                    | 4                   | 
| DSP                | 2520                  | 3528                | 
| GTH  16.3Gb/s      | 24                     | 24                    | 
### 底板部分
1. 1 路 M.2 接口，PCIEx1(ps),速率6Gbps 
2. 1 路DP输出接口，mini DP(ps)，最高支持4kx2k@30fps输出 
3. 4 路USB3.0接口，usb(ps),速率5.0Gbps,扁型 USB 接口(USB Type A) 
4. 2 路千兆以太网接口，jl2121,一路ps，一路pl,rgmii接口  
5. 2 个uart转usb，1个连到ps，1个连到pl
6. 1 个Micro SD 卡座(ps) 
7. 2 路SFP光纤接口，速率12.5Gbs
8. 2 路40针扩展口,2.54mm间距,1路5v,2 路3.3v,3 路gnd，IO 口 34 路。扩展口的 IO 电平标准为 3.3V 
9. 2 路 CAN 通信接口(ps) 
10. 2 路 485 通信接口(pl)
11. 1 路mipi接口（pl）,15PIN的FPC连接器，2个lane数据，1对时钟 
12. 1 个 FMC HPC
13. 1 个RTC实时时钟，32.768KHz无源时钟(ps)
14. EEPROM和温度传感器，1片 EEROM 4Kbit(2x256x8bit)(ps)，一片LM75温度芯片(ps)，精度为0.5度
15. 4 个led灯，1个双色指示灯，1个done指示灯，1个pl控制，1个ps控制
16. 3 个按键，1个复位按键 RESET 和 2 个用户按键  
17. 1 个四位拨码开关，板卡支持四种启动模式
18. 尺寸 180.0mm x 135.0mm
19. 电源12v/3A
# AXU9EG/AXU15EG 例程
## 例程描述
此项目为开发板出厂例程，支持板卡上的大部分外设。
## 开发环境及需求
* Vivado 2020.1
* AXU9EG/AXU15EG开发板
## 创建Vivado工程
* 下载最新的ZIP包。
* 创建新的工程文件夹.
* 解压下载的ZIP包到此工程文件夹中。
* 对于不同的开发板，请打开**\<archive extracted location\>/vivado/auto_create_project/project_info.tcl**文件，选择一个器件并且保存。

xczu9eg-ffvb1156-2-i适用于AXU9EG  
xczu15eg-ffvb1156-2-i适用于AXU15EG  
```
set devicePart "xczu9eg-ffvb1156-2-i"
#set devicePart "xczu15eg-ffvb1156-2-i"
set runs_jobs 5
```

有两种方法创建Vivado工程，如下所示：
### 利用Vivado tcl console创建Vivado工程
1. 打开Vivado软件并且利用**cd**命令进入"**auto_create_project**"目录，并回车
```
cd \<archive extracted location\>/vivado/auto_create_project
```
2. 输入 **source ./create_project.tcl** 并且回车
```
source ./create_project.tcl
```

### 利用bat创建Vivado工程
1. 在 "**auto_create_project**" 文件夹, 有个 "**create_project.bat**"文件, 右键以编辑模式打开，并且修改vivado路径为本主机vivado安装路径，保存并关闭。
```
CALL E:\XilinxVitis\Vivado\2020.1\bin\vivado.bat -mode batch -source create_project.tcl
PAUSE
```
2. 在Windows下双击bat文件即可。


更多信息, 请访问[ALINX网站] (https://www.alinx.com)
