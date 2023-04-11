#!/usr/bin/env sh

# to fix steam leaving monitors on (inhibiting x dpms blanking)
# https://github.com/ValveSoftware/steam-for-linux/issues/5607#issuecomment-621983716
# install extra/xdg-dbus-proxy 


PIPE="/tmp/block-screensaver-inhibit-bus-$$"

XDG_CURRENT_DESKTOP=XFCE xdg-dbus-proxy "$DBUS_SESSION_BUS_ADDRESS" "$PIPE" --filter --call="org.freedesktop.DBus.*=*" --call="org.freedesktop.IBus.*=*" --call="org.freedesktop.portal.*=*" --call="com.feralinteractive.GameMode.*=*" --call="com.canonical.*=*" --broadcast="*=*" --call="org.kde.*=*" --call="org.gtk.*=*" &

DBUS_SESSION_BUS_ADDRESS="unix:path=$PIPE" "$@"
kill %1
