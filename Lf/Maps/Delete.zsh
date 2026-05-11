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

