#!/bin/bash
INTERVAL=1800

Times=0
while true; do
  echo "It works"
  $ElBastionDelOlvido/Desktop/Sources/Scripts/ChangeWallpaper.sh
  sleep $INTERVAL
  if (( Times <= 5 )); then
    "$ElBastionDelOlvido/Desktop/Sources/Scripts/ChangeTheme.sh"
    Times=0
fi
done
