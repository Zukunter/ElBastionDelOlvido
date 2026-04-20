#!/bin/bash

# --- CONFIGURACIÓN / KONFIGURATION ---
TEMP_FILE="/tmp/hypr_temp"
DEFAULT_TEMP=6550 # Este es el "65" que puedes cambiar / Dein Basiswert
STEP=50           # Cuánto sube o baja / Wie viel es steigt oder sinkt
MIN_TEMP=1000     # Límite de hyprsunset / Untergrenze
MAX_TEMP=20000    # Límite de hyprsunset / Obergrenze
# -------------------------------------

# Crear archivo si no existe / Datei erstellen, falls sie nicht existiert
[[ ! -f $TEMP_FILE ]] && echo $DEFAULT_TEMP >$TEMP_FILE

CURRENT=$(cat $TEMP_FILE)

case "$1" in
up)
  NEW=$((CURRENT + STEP))
  ;;
down)
  NEW=$((CURRENT - STEP))
  ;;
reset)
  NEW=$DEFAULT_TEMP
  ;;
*)
  exit 1
  ;;
esac

# Aplicar límites / Grenzen anwenden
if [ $NEW -gt $MAX_TEMP ]; then
  NEW=$MAX_TEMP
elif [ $NEW -lt $MIN_TEMP ]; then
  NEW=$MIN_TEMP
fi

# Guardar y ejecutar / Speichern und ausführen
echo $NEW >$TEMP_FILE
pkill hyprsunset
hyprsunset -t $NEW &

# Notificación / Benachrichtigung
notify-send -a "System" -u low -t 800 -h string:x-canonical-private-synchronous:hyprsunset "Temperatura: ${NEW}K"
