#!/bin/bash

usage()
{
    cat <<EOF
Find package files

Usage: $(basename $0) directory package-names...

EOF
    exit 2
}

[ $# -ge 2 ] || usage
test -d "$1" || usage

d=$(readlink -f "$1")
shift

# check_file ls-pattern egrep-pattern
check_file()
{
    _cmd="cd $d; ls -1 $1 2>/dev/null"
    test -n "$2" && \
        _cmd="$_cmd | egrep '$2'"
    _cmd="$_cmd | tail -n 1"
    _file=$(eval $_cmd)
    test -f "$d/$_file" && echo $d/$_file
}
while [ $# -gt 0 ]; do

    # PN-PV-arm-PR.t[gx]z
    # PN-PV-PR.t[gx]z
    # PN-PV-PR.t[gx]z
    # PN-PV.t[gx]z
    # PN.t[gx]z

    check_file "$1" || \
    check_file "$1.t[gx]z" || \
    check_file "$1-*.t[gx]z" "^$1-[^-]+\.t[gx]z" || \
    check_file "$1-*.t[gx]z" "^$1-[^-]+-[^-]+\.t[gx]z" || \
    check_file "$1-*.t[gx]z" "^$1-[^-]+-arm-[^-]+\.t[gx]z" || \
    echo "MISSING"

    shift 1
done

