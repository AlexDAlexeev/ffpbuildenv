def()
{
  SCRIPTNAME=$(basename "$1")
  if [ ! -a "$1" ]; then
    ln -sf $1 /sbin/${SCRIPTNAME}
  else
    rm /sbin/${SCRIPTNAME}
  fi
}

def /ffp/sbin/mount.davfs
def /ffp/sbin/umount.davfs
