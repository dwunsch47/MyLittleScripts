#!/bin/bash
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
volume_result=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep MUTED)

if [ "$volume_result" != "" ] ; then
    notify-send "^._.^ mic is MUTED ^._.^"
    else
        notify-send ":O mic is NOT muted O:"
fi
