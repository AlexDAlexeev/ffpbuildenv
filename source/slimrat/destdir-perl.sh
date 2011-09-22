find $D/* -type f | xargs  sed -i -e 's%/usr/bin/perl%/ffp/bin/perl%' 
find $D/* -type f | xargs  sed -i -e 's%/usr/bin/env%/ffp/bin/env%' 
