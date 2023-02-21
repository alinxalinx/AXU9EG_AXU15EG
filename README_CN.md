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