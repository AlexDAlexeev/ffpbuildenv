make install PREFIX=$D/$CPREFIX
sed -i -e "s|$D||" $D/$CPREFIX/lib/ocaml/ld.conf
