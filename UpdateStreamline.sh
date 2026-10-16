#!/bin/bash

TARGET_FOLDER=$1
CURRENT_FOLDER=$(pwd)

for i in "$TARGET_FOLDER"/sl.*.dll; do
	BASENAME="$(basename "$i")"
	if [ -h "$i" ]; then
		echo "$BASENAME is already a symlink, skipping"
		continue
	fi
	if [ -f "$i" ] && [ -f "$CURRENT_FOLDER/$BASENAME" ]; then
		#echo "Current file $i"
		echo "Creating backup of $BASENAME"
		mv "$i" "$i.bak"
		if [ -f "$CURRENT_FOLDER/$BASENAME" ]; then
			ln -s "$CURRENT_FOLDER/$BASENAME" "$i"
		   else
			echo "File to symlink not found"
		fi
	fi
done

for i in "$TARGET_FOLDER"/sl.*.dll.bak; do
	if [ ! -e "${i%.bak}" ] && [ -e "$i" ]; then
		echo "Restoring file ${i%.bak}"
		echo "Seems symlink wasn't successful, restoring backups"
		mv "$i" "${i%.bak}"	
	fi
done
