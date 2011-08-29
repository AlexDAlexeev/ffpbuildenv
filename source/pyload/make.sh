find . -name "*.py" | xargs  sed -i -e 's%/usr/bin/env%/ffp/bin/env%'  $S/*.py
