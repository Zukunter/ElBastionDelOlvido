cmd delete-safe ${{
    # Zählt die ausgewählten Dateien / Counts selected files
    count=$(echo "$fx" | wc -w)
    
    # Fragt nach Bestätigung / Asks for confirmation
    printf "Delete $count item(s)? [a/n]: "
    read res
    
    if [ "$res" = "a" ] || [ "$res" = "A" ]; then
        # Nutze 'rm -rf' (Vorsicht!) oder besser 'trash'
        # Use 'rm -rf' (Caution!) or preferably 'trash'
        rm -rf $fx
        
        # UI aktualisieren / Refresh UI
        lf -remote "send $id reload"
        echo "Deleted."
    else
        echo "Canceled."
    fi
}}

map D delete-safe

cmd file_to_dir %{{
    # Guardar el nombre del archivo actual / Den aktuellen Dateinamen speichern
    filename=$(basename "$f")

    # Opción A: Borrar el archivo y crear carpeta
    # Option A: Datei löschen und Ordner erstellen
    rm "$f"
    mkdir -p "$filename"
    
    # Opción B: Si prefieres MOVER el archivo dentro de la nueva carpeta
    # (Descomenta la línea de abajo y comenta la de arriba si prefieres esto)
    # Option B: Wenn du die Datei lieber in den neuen Ordner VERSCHIEBEN möchtest
    # (Entkommentiere die untere Zeile und kommentiere die obere aus, falls erwünscht)
    # mkdir -p "$filename" && mv "$f" "$filename/"
}}

map F file_to_dir
