#!/bin/bash

M=MANIFEST.txt

rm -f $M
>$M

for f in *.t[gx]z; do

    echo $f

    cat >>$M <<EOF
++========================================
||
||   Package:  $(basename $f)
||
++========================================
EOF

    case "$f" in
      *tgz )
        tar tzvf $f >>$M
        ;;
      *txz )
        tar tJvf $f >>$M
        ;;
    esac
done

