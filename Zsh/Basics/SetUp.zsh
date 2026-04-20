# source "$ZDOTDIR/Basics/Environment.zsh"
#export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="/home/Zukunter/.cargo/bin:/home/Zukunter/.local/bin:$PATH"
# Load Antidote
PluginsText="$PluginsDir/ListOfPlugins.txt"
PluginsCompiled="$PluginsDir/CompiledPlugins.zsh"
PluginsAntidote="$PluginsDir/antidote"

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

setopt CORRECT
setopt HIST_IGNORE_ALL_DUPS
setopt GLOB_DOTS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
