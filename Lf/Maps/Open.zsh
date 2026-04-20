cmd basic-open ${{
    # Detecta el tipo de archivo (MIME)
    case $(file --dereference --mime-type "$f" -b) in
        video/*|audio/*)
            nohup mpv "$f" > /dev/null 2> /dev/null & ;;
        image/*)
            nohup mpv "$f" > /dev/null 2> /dev/null & ;;
        *)
            nvim "$f" ;;
    esac
}}
map <enter> basic-open

cmd quick-command ${{
  wtype "!"
}}
map <tab> quick-command


cmd give ${{
    chmod +x "$f"
}}
map G give
cmd void ${{
   sudo echo "" > "$f"
  }}
map E void
