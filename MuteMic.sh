#!/bin/bash
dbus-send --session --print-reply --dest=org.kde.kglobalaccel /component/kmix org.kde.kglobalaccel.Component.invokeShortcut string:"mic_mute"
volume_result=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep MUTED)

if [ "$volume_result" == "" ] ; then
    dbus-send --session --print-reply --dest=org.kde.kglobalaccel /component/kmix org.kde.kglobalaccel.Component.invokeShortcut string:"mic_mute"
fi

volume_result=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep MUTED)

if [ "$volume_result" == "" ] ; then
    notify-send ":O mic is NOT muted, CHECK SETTINGS O:"
fi

