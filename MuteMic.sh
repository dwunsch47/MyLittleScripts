#!/bin/bash
sleep 1
volume_result=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep MUTED)
if [ "$volume_result" == "" ] ; then
    dbus-send --session --print-reply --dest=org.kde.kglobalaccel /component/kmix org.kde.kglobalaccel.Component.invokeShortcut string:"mic_mute"
    else
	exit 0
fi
sleep 1
volume_result=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep MUTED)
if [ "$volume_result" == "" ] ; then
    notify-send ":O mic is NOT muted, CHECK SETTINGS O:"
fi

