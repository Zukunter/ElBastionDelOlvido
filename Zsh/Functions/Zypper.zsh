function zin()
{
    sudo zypper in "$@"
}
function zrm()
{
	sudo zypper rm "$@"
}
function zdup()
{
	sudo zypper dup
}
function zsr(){
    zypper search "$@"
}
