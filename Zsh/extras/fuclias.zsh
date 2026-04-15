alias hyprlock='~/.config/hypr/hyprland/scripts/randomlock.sh && hyprlock'
alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --group-directories-first'
alias x="exit"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function c() {
    local clear_at_end=false

    # 1. Detectar si el último argumento es "c"
    if [[ "${@: -1}" == "c" ]]; then
        clear_at_end=true
        # Quitamos la 'c' de los argumentos para que no se pase al comando
        set -- "${@:1:$#-1}"
    fi

    # 2. Primer clear
    clear

    # 3. Ejecutar el comando solo si hay argumentos restantes
    # Usamos "$@" con comillas para preservar espacios en los argumentos
    if [[ $# -gt 0 ]]; then
        "$@"
    fi

    # 4. Si había una 'c' al final, limpiar después de que el comando termine
    if [[ "$clear_at_end" == "true" ]]; then
        clear
    fi
}


function zyin()
{
	sudo zypper in "$1"
}
function zyrm()
{
	sudo zypper rm "$1"
}
function zydup()
{
	sudo zypper dup
}
# Funktion für "cd on quit"
lf() {
    tmp="$(mktemp)"
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ] && [ "$dir" != "$(pwd)" ]; then
            cd "$dir"
        fi
    fi
}
