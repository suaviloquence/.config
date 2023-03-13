#!/usr/bin/env sh
INFO="$(apcaccess status)"

if echo "$INFO" | grep "ONLINE" > /dev/null
	then
		echo "ﮣ "
	else
		CHARGE="$(echo "$INFO" | grep BCHARGE | sed 's/BCHARGE  : \([0-9.]\+\) Percent/\1/g')"
		echo "%{F#bf616a} $CHARGE%%{F-}"
fi


