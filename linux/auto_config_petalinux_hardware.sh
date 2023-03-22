#!/bin/sh

echo -e "\e[1;33mThis shell must be executed in the same level path as petalinux(a petalinux project named petalinux) and hardware(a path expanded as follow:hardware\board_model(for example:AXU3EG)\any_name_is_ok.xsa) !!!\e[0m"
echo -e "\e[1;33mThis shell must be executed in the same level path as petalinux(a petalinux project named petalinux) and hardware(a path expanded as follow:hardware\board_model(for example:AXU3EG)\any_name_is_ok.xsa) !!!\e[0m"
echo -e "\e[1;33mThis shell must be executed in the same level path as petalinux(a petalinux project named petalinux) and hardware(a path expanded as follow:hardware\board_model(for example:AXU3EG)\any_name_is_ok.xsa) !!!\e[0m"
echo
echo -e "\e[1;33m1 : AXU9EG\e[0m"
echo -e "\e[1;33m2 : AXU15EG\e[0m"
echo -e "\e[1;33mq : EXIT\e[0m"
echo -e -n "\e[1;32mPlease select your board model\e[0m\e[1;5;32m: \e[0m"
read BOARD_MODEL_INDEX

if [[ $BOARD_MODEL_INDEX -eq 1 ]];then
	BOARD_MODEL=AXU9EG
elif [[ $BOARD_MODEL_INDEX -eq 2 ]];then
	BOARD_MODEL=AXU15EG
elif [[ $BOARD_MODEL_INDEX == q ]];then
	exit
else
	echo -e "\e[1;31mInput parameter error\e[0m\n."
	exec "$0" "$@"
fi

cd ./petalinux
petalinux-config --get-hw-description ../hardware/$BOARD_MODEL --silentconfig
echo -e "\e[1;32m$BOARD_MODEL hardware set over\e[0m."

