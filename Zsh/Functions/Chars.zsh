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
alias x="exit"
