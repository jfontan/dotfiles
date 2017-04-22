#!/bin/bash

sound_internal_id="analog-stereo"
sound_monitor_id="hdmi-stereo"
sound_bar_id="SoundBar"

lock=" lock"
suspend=" suspend"
shutdown=" shutdown"
solo=" solo"
home=" home"
office=" office"
sound_internal=" internal audio"
sound_monitor=" monitor audio"
sound_bar=" bar audio"

options="$lock
$suspend
$shutdown
$solo
$office
$sound_internal
$sound_monitor
$sound_bar"

opt=$(echo "$options" | rofi -dmenu -font "hermit 20" -sidebar-mode)

[ $? = 1 ] && exit

case $opt in
    $lock)
        # i3lock
        slock
        ;;
    $suspend)
        # i3lock
        # systemctl suspend
        slock systemctl suspend
        ;;
    $shutdown)
        systemctl poweroff
        ;;
    $solo)
        ~/.screenlayout/solo.sh
        i3-msg restart
        ;;
    $home)
        ~/.screenlayout/casa.sh
        i3-msg restart
        ;;
    $office)
        ~/.screenlayout/oficina.sh
        i3-msg restart
        ;;
    $sound_internal)
        ~/bin/change_sound_card "$sound_internal_id"
        ;;
    $sound_monitor)
        ~/bin/change_sound_card "$sound_monitor_id"
        ;;
    $sound_bar)
        ~/bin/change_sound_card "$sound_bar_id"
        ;;
esac


