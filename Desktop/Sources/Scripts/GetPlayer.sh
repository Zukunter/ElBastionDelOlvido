#!/bin/bash
  # We tell playerctl to prioritize spotify
  PLAYER=$(playerctl -p spotify,playerctld metadata --format "{{playerName}}" 2>/dev/null)


    playerctl -p spotify,playerctld metadata --format "{\"text\": \"{{title}}  {{artist}}\", \"alt\": \"{{playerName}}\", \"class\": \"$PLAYER\", \"tooltip\": \"{{artist}} - {{title}} ({{playerName}})\"}" 2>/dev/null
