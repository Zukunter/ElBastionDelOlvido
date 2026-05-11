alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --group-directories-first'


function gpush() { 
    git push "$@" 
}
function gadd() {
    git add "$@"
}
function gcom(){
    git commit -m "$@"
}
function gbranch() {
    git branch "$@"
}
function gpull(){
    git pull "$@"
}
function gpush(){
    git push "$@"
}
