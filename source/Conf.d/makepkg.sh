#!/bin/sh
die()
{
    cat >&2 <<EOF
$@
EOF
    exit 1
}

[ $# -eq 1 ] || die "Usage: $0 <package-file>"
[ -e "$1" ] && rm -f "$1"
mkdir -p $(dirname "$1")
tar cf - --exclude=.svn --exclude=.git --exclude=CVS --exclude=\*~ . | gzip -cv -9 >$1.tgz
tar cf - --exclude=.svn --exclude=.git --exclude=CVS --exclude=\*~ . | xz -cv >$1.txz
