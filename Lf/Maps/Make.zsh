cmd mks ${{
    printf "File's name : "
    read res
    if [ -z "$res" ]; then
        exit 0
    fi

    case "$res" in
        */) mkdir -p "$res" ;;
        *)  mkdir -p "$(dirname "$res")" && touch "$res" ;;
    esac
    
    lf -remote "send $id reload"
}}
map a mks
