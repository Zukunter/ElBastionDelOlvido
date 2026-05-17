export PluginsDir="$ZDOTDIR/Plugins"
export STARSHIP_CONFIG="$PluginsDir/StarShip.toml"

# Start at Workspace
if [ -d "User/Workspace/" ]; then
    cd "$HOME/User/Workspace"
fi
# Load SetUp
source "$ZDOTDIR/Basics/SetUp.zsh"
# Load Functions, Binds and Basics
if [[ -d "$ZDOTDIR/Functions" ]]; then
  for file in "$ZDOTDIR/Functions"/*.{zsh,sh}(N); do
    source "$file"
  done
fi
source "$ZDOTDIR/Basics/Maps.zsh"
source "$ZDOTDIR/Basics/Exports.zsh"

