plugins_text="$ZDOTDIR/plugins/zsh_plugins.txt"
plugins_compiled="$ZDOTDIR/plugins/zsh_plugins.zsh"
plugins_antidote="$ZDOTDIR/plugins/antidote"


if [[ -d "$plugins_antidote" ]]; then

	if [[ ! -f "$plugins_compiled" || "$plugins_text" -nt "$plugins_compiled" ]]; then
	source "$plugins_antidote/antidote.zsh" 
	antidote bundle < "$plugins_text" >| "$plugins_compiled"
	fi
	source "$plugins_compiled"
fi

if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi
eval "$(zoxide init zsh)"


#Map each one in extra
extra="$ZDOTDIR/extras"

if [[ -d "$extra" ]]; then
    # Itera sobre cada archivo .zsh o .sh (puedes ajustar la extensión)
    for file in "$extra"/*.{zsh,sh}(N); do
        # El (N) es un "Null Glob" que evita errores si la carpeta está vacía
        source "$file"
    done
fi


# If we are on tty1, start Hyprland automatically
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec start-hyprland
fi
