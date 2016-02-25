#!/bin/bash

lock=" lock"
suspend=" suspend"
shutdown=" shutdown"
solo=" solo"
home=" home"
office=" office"
milieu=" milieu"

options="$lock
$suspend
$shutdown
$solo
$home
$office
$milieu"

opt=$(echo "$options" | rofi -dmenu -font "hermit 40" -sidebar-mode)

[ $? = 1 ] && exit

case $opt in
    $lock)
        i3lock
        ;;
    $suspend)
        i3lock
        systemctl suspend
        ;;
    $shutdown)
        systemctl poweroff
        ;;
    $solo)
        ~/.screenlayout/solo.sh
        ;;
    $home)
        ~/.screenlayout/casa.sh
        ;;
    $office)
        ~/.screenlayout/oficina.sh
        ;;
    $milieu)
        ~/.screenlayout/milieu.sh
        ;;
esac


