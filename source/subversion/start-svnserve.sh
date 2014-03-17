#!/ffp/bin/sh

# THANKS: KyleK

# PROVIDES: svnserve

. /ffp/etc/ffp.subr

REPOSITORY="/srv/svn/repos"

name="svnserve"
command="/ffp/bin/$name"
svnserve_flags="-d -r ${REPOSITORY}"
svnserve_user="nobody"
required_dirs=${REPOSITORY}

run_rc_command "$1"
