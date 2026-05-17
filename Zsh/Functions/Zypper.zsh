function zyin()
{
    sudo zypper in "$@"
}
function zyrm()
{
	sudo zypper rm "$@"
}
function zydup()
{
	sudo zypper dup
}
function zysr(){
    zypper search "$@"
}
function snapperClean() {
    for SNAP in $(sudo snapper list | awk 'NR>2 {print $1,$8}' | grep -v "yes" | awk '{print $1}'); do
        sudo snapper delete $SNAP
    done
}

