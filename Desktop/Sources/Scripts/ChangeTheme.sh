#!/bin/bash
CurrentTheme="$ElBastionDelOlvido/Desktop/Sources/Themes/CurrentTheme"
ThemeDir="$ElBastionDelOlvido/Desktop/Sources/Themes"
echo "Dir : $ThemeDir"
echo "Theme : $(readlink $CurrentTheme)"

if [[ -L "$CurrentTheme" ]]; then
  ExcludedTheme=$(basename "$(readlink "$CurrentTheme")")
else
  ExcludedTheme="None"
fi

SelectedTheme=$(find "$ThemeDir" -maxdepth 1 -mindepth 1 -type d ! -name "$ExcludedTheme" | shuf -n 1)

ln -sfn "$SelectedTheme" "$CurrentTheme"


$ElBastionDelOlvido/Desktop/Sources/Scripts/PlayFolder.sh
$ElBastionDelOlvido/Desktop/Sources/Scripts/ChangeWallpaper.sh
