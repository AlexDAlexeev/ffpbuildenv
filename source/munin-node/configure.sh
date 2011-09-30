sed -i -e 's%USER       := munin%USER       := nobody%'  $S/Makefile.config
sed -i -e 's%GROUP      := munin%GROUP      := 501%' $S/Makefile.config
