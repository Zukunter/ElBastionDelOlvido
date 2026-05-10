# Load SetUp
source "$ZDOTDIR/Basics/SetUp.zsh"
# Load Functions, Binds and Basics
if [[ -d "$ZDOTDIR/Functions" ]]; then
  for file in "$ZDOTDIR/Functions"/*.{zsh,sh}(N); do
    source "$file"
  done
fi
source "$ZDOTDIR/Basics/Maps.zsh"
#Set Up Lf
lf(){
    command lf --config "$ElBastionDelOlvido/Lf/Start.zsh" "$@"
}
# echo "Current Workspaces : "
# ls
