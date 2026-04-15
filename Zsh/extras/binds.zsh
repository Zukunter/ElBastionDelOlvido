# Home / End (Inicio y Fin)
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Delete (Suprimir)
bindkey '^[[3~' delete-char

# Ctrl + Flechas (Saltar palabras)
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Búsqueda inteligente con Flechas (Basado en lo que ya escribiste)
# Requiere el plugin zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Inform Ghostty (and other terminals) about the current directory
unsetopt AUTO_NAME_DIRS

# Define the function to send the OSC 7 sequence
osc7_cwd() {
  local pwd_quoted=${(q)PWD}
  printf "\e]7;file://%s%s\a" "$HOST" "$pwd_quoted"
}

# Run the function every time the prompt is shown
autoload -Uz add-zsh-hook
add-zsh-hook precmd osc7_cwd
