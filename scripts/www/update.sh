#!/bin/bash

D=/mnt/md0/temp/ffpbuildenv/source
P=/mnt/md0/srv/www/pages/ffp/0.7/packages
C=PACKAGES.css
S=PACKAGES.html
T=PACKAGE_template.html
N=PACKAGENAME_template.html

echoerr() { echo "$@" 1>&2; }

for d in `ls -d $D/*/`; do
	PACKAGE_NAME=`echo $d | sed -e "s/\/$//" -e "s@^.*/@@g"`
    FILENAME=`../find-packages.sh $P $PACKAGE_NAME | sed -e 's@^.*/@@g'`

   [ "$FILENAME" = "MISSING" ] && continue

    DESCR=$d/DESCR
    HOMEPAGE=`cat $d/HOMEPAGE`

	H=`sed -e "s/__NAME__/$PACKAGE_NAME/g" \
	       -e "s/__FILE_NAME__/$FILENAME/g" \
	       -e "s@__HOMEPAGE__@$HOMEPAGE@g" \
	       -e '/__DESCRIPTION__/{r '$DESCR''$'\n''d;}' \
	       $T`
    
    COUNT=$((COUNT + 1))
	PACKAGE_NAMES="$PACKAGE_NAMES\n"`sed -e "s/__PACKAGE_NAME__/$PACKAGE_NAME/g" $N`
	PACKAGES="$PACKAGES$H"
		
	echoerr "$PACKAGE_NAME  $FILENAME"
done

sed -e '/__PACKAGE_CSS__/{r '$C''$'\n''d;}' \
    -e "s%__PACKAGES__%`echo "$PACKAGES" | awk '{printf("%s\\\\n", $0);}' | awk '{gsub(/&/, "\\\\\\\\&");printf $0}'`%" \
    -e "s%__PACKAGE_NAME_LIST__%`echo "$PACKAGE_NAMES" | awk '{printf("%s\\\\n", $0);}'`%" \
    -e "s%__PACKAGE_COUNT__%$COUNT%" \
    $S
