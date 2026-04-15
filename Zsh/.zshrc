source "$ZDOTDIR/Basics/Environment.zsh"

# Load Antidote
PluginsText="$PluginsDir/ListOfPlugins.txt"
PluginsCompiled="$PluginsDir/CompiledPlugins.zsh"
PluginsAntidote="$PluginsDir/Antidote"

if [[ -d "$PluginsAntidote" ]]; then

  if [[ ! -f "$PluginsCompiled" || "$PluginsText" -nt "$PluginsCompiled" ]]; then
    source "$PluginsAntidote/antidote.zsh"
    antidote bundle <"$PluginsText" >|"$PluginsCompiled"
  fi
  source "$PluginsCompiled"
fi
# Load StarShip
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi
eval "$(zoxide init zsh)"

# Load Functions, Binds and Basics
if [[ -d "$ZDOTDIR/Functions" ]]; then
  for file in "$ZDOTDIR/Functions"/*.{zsh,sh}(N); do
    source "$file"
  done
fi
source "$ZDOTDIR/Alias.zsh"
source "$ZDOTDIR/Basics/GlobalSets.zsh"
source "$ZDOTDIR/Basics/Maps.zsh"

# If we are on tty1, start Hyprland automatically
# if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
# exec start
# fi
