#!/bin/bash
SelectedWallpaper=$(find "$ElBastionDelOlvido/Desktop/Sources/Themes/CurrentTheme/Wallpapers" -maxdepth 1 -mindepth 1 -type f | shuf -n 1)
ln -sfn "$SelectedWallpaper" "$ElBastionDelOlvido/Desktop/Sources/Themes/CurrentWall" 
awww img "$SelectedWallpaper" \
    --transition-type grow \
    --transition-pos center \
    --transition-duration 30 \
    --transition-fps 60
$ElBastionDelOlvido/Desktop/Sources/Scripts/PlayFolder.sh
