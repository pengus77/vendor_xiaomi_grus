#!/bin/bash

FILES="/media/ivan/android/lineage-17/device/xiaomi/grus/proprietary-files.txt"

for i in $(cat $FILES)
do
	FILE="$i"
	CHECK=$(echo "$i" | grep "^\-.*$")
	if [ x"$CHECK" != "x" ]
	then
		FILE=$(echo "$i" | tail -c +2 | head -c -1)
	fi

	FILE=$(basename "$FILE")
	TEST=$(find ./ -name "$FILE" >/dev/null 2>&1)
#	echo "$? - $FILE"
	if [ $? -eq 0 ]
	then
		echo "FOUND: $FILE"
	else
		echo "NOT FOUND: $FILE"
	fi
done
