cmd delete-safe ${{
    count=$(printf "%s\n" $fx | wc -l)

    printf "Delete $count item(s)? [a/n]: "
    read res

    if [ "$res" = "a" ] || [ "$res" = "A" ]; then
        # Recorre cada archivo de forma segura
        while IFS= read -r f; do
            rm -rf -- "$f"
        done <<EOF
$fx
EOF

        lf -remote "send $id reload"
        echo "Deleted."
    else
        echo "Canceled."
    fi
}}

map D delete-safe

