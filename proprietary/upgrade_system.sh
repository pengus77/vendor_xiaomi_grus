#!/bin/bash

rm -f not_found.log

for i in app bin etc framework lib lib64 priv-app
do 
	for k in $(find $i)
	do 
		FILE="/home/ivan/Desktop/grus_9.11.21/system/system/$k"; 
		if [ -e "$FILE" ]
		then
			if [ -f "$FILE" ]
			then
				cp "$FILE" "$k"
			fi
		else
			echo $FILE NOT FOUND >> not_found.log
		fi
	done 
done
