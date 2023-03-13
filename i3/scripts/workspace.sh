#!/usr/bin/env sh


FOCUSED=$(i3-msg -t get_workspaces | jq '.[] | select(.focused) | .num')
BASE=$((("$FOCUSED" - 1) / 10 * 10))


if [ "$1" = "--invert" ]; then
	BASE=$((("$BASE" + 10) % 20));
	shift
fi

WORKSPACE_NUM=$(("$BASE" + "$2"))

case "$2" in
	"1") 
		WORKSPACE_NAME="i"
		;;
	"2") 
		WORKSPACE_NAME="ii"
		;;
	"3")
		WORKSPACE_NAME="iii"
		;;
	"4")
		WORKSPACE_NAME="iv"
		;;
	"5")
		WORKSPACE_NAME="v"
		;;
	"6")
		WORKSPACE_NAME="vi"
		;;
	"7")
		WORKSPACE_NAME="vii"
		;;
	"8")
		WORKSPACE_NAME="viii"
		;;
	"9")
		WORKSPACE_NAME="ix"
		;;
	"10")
		WORKSPACE_NAME="x"
		;;
esac

WORKSPACE="\"$WORKSPACE_NUM: $WORKSPACE_NAME\""

case "$1" in
	"switch")
		i3-msg "workspace $WORKSPACE"
		;;
	"move")
		i3-msg "move container to workspace $WORKSPACE" 
		;;
esac

