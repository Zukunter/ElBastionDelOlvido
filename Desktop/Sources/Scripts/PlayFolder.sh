#!/bin/bash

CurrentTheme="$ElBastionDelOlvido/Desktop/Sources/Themes/CurrentTheme"
# Lanzamos TODOS los sonidos al mismo tiempo
for sound in "$CurrentTheme/Sounds"/*; do
        sleep 0.3
        pw-play --volume 1.5 "$sound" &
done
