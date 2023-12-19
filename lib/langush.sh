# ref: locale/build.sh
if ! command -v "sdb" &> /dev/null ; then
    echo -e "sdb not found, please install it:\nsource: https://github.com/radareorg/sdb.git"
    exit 1
fi

langush.gettext() {
    if [[ -f "${1}" ]] ; then
        sdb "${1}" "${2}"
    fi
}