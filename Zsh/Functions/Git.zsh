alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --group-directories-first'


gpush() { 
    git push "$@" 
}
gadd() {
    git add "$@"
}
gcom(){
    git commit "$@"
}
gbranch() {
    git branch "$@"
}
gpull(){
    git pull "$@"
}
