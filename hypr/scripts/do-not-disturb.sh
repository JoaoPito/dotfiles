#!/usr/bin/env bash

# Do not disturb toggle and notifications
# João Pito, 2023

if [ "$1" = "toggle" ];then
	# ACTIVE equals to 1 if do not disturb is active, empty otherwise
	ACTIVE=$(makoctl mode | grep do-not-disturb | sed 's/do-not-disturb/1/g')
	if [ -z "$ACTIVE" ]; then
		notify-send -w "󰂛 Modo não perturbe" "Ativo" -u low
		makoctl mode -a do-not-disturb > /dev/null
		echo "󰂛"
	else
		makoctl mode -r do-not-disturb > /dev/null
		notify-send "󰂚 Modo não perturbe" "Desativado" -u low
	fi
else
	echo $(makoctl mode | grep do-not-disturb | sed 's/.*/󰂛/')
fi


