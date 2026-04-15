#!/bin/sh

# Die Datei, die gerade ausgewählt ist / The currently selected file
file=$1

bat --color=always --style=numbers --terminal-width="$2" "$file"
