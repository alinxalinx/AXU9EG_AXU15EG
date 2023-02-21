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