# ffpbuildenv
Copied from http://nas-tweaks.net/106/compiling-software-for-the-fonz-fun_plug/

Fonz provides many pre-compiled packages for the NAS in his repository, but obviously cannot provide every package which someone out there might need. So to help users compile and link packages themselves, Fonz has created a complete software environment for building packages for the NAS device.

This ffpbuildenv environment consists of a few scripts and a standardized process for building software packages. It runs on the NAS itself, rather than requiring special cross-compilation tools on a PC. This helps guarantee full compatibility with the target system and ensures that the environment is familiar to developers with a Linux background.

The following tutorial builds on Fonz’s work, but also contains procedures and descriptions by Uli. User PeterH did his usual testing and polishing routine on this text.

## Preparations
Setup a fun_plug and install ALL packages available as described in the linked tutorial.

## Setup
ffpbuildenv can best be installed on one of the hard disks:
```
mkdir /mnt/HD_a2/ffpbuildenv
cd /mnt/HD_a2/ffpbuildenv
git clone https://github.com/Darkvater/ffpbuildenv .
```
These steps create a new directory on drive /mnt/HD_a2/ and copy the required files from Fonz’ repository using the [Subversion] (http://en.wikipedia.org/wiki/Subversion_(software)) version control system.


## General Use
### Chrooting to the build environment
To get a well-defined environment, you chroot to this directory using a script appropriately called chroot.sh:
```
cd /mnt/HD_a2/ffpbuildenv/
sh chroot.sh
cd /mnt/HD_a2/ffpbuildenv/source/
```
It makes the ffpbuildenv look like the root directory of the file system, at least for the current process. Note that the chroot step creates a new command shell running within your current command shell: if you later exit from the that shell, you end up back in the original shell.

### Downloading the distribution file
```
cd /mnt/HD_a2/ffpbuildenv/source/
./Make.sh -F <PACKAGENAME>
```

### Compiling a package
```
cd /mnt/HD_a2/ffpbuildenv/source/
./Make.sh <PACKAGENAME>
```
The compiled and packaged archive is placed in /mnt/HD_a2/ffpbuildenv/packages/ then. Errors are logged to /mnt/HD_a2/ffpbuildenv/build-logs/--.log

## Setting up a package
If you take a look into the directory of a package, you will see several files. In the following text, I will describe lighttpd if not stated otherwise.

### Required files
#### PR
Tells the Revision of the compiled package. E.g. if you compiled a package, forgot to include something and want to redo the package, e.g. the third version of php-5.2.6: php-5.2.6-3.tgz
```
1
```
#### PV
This is the version of the source code, e.g. lighttpd-1.4.20.tar.bz2
```
1.4.20
```
#### SRC_URI
Link to the source-file. You can use the following variables:
- $PV – Packageversion – Value from above
- $PN – Packagename – Value from above
- $P – Concatenated Variable: “Packagename-Packageversion” ($PN-$PV)
```
http://www.lighttpd.net/download/lighttpd-$PV.tar.bz2
```
This will result in http://www.lighttpd.net/download/lighttpd-1.4.20.tar.bz2

### Optional files
#### DESC
Describes the package. If present, it is shown during installation.
```
Lighttpd is a secure, speedy, compliant, and very flexible web-server
 which is designed and optimized for for high-performance environments.
 With a small memory footprint compared to other web-servers, effective
 management of the CPU-load, and advanced feature set (FastCGI, SCGI,
 Auth, Output-Compression, URL-Rewriting and many more) lighttpd is the
 perfect solution for every server that is suffering load problems.
 [pkgsrc]
```

#### HOMEPAGE
This is the general homepage of the program.
```
http://www.lighttpd.net/
```

#### doinst.sh
This file gets executed during the installation of a compiled package. Here you can add additional commands, like adding system accounts or printing additional information.

This file is not needed in lighttpd, the code below is from sudo
```
def()
{
        if [ ! -r "$1" ]; then
                mv $1.new $1
        elif cmp -s $1 $1.new; then
                rm $1.new
        fi
}
 
def ffp/etc/sudoers
```

#### configure.sh
This file is used for configuring the source code with other commands than ./configure. If it is not available ./configure with the optional configure_args (see below) will be run in the source directory.

This file is not needed in lighttpd, the code below is from openssl
```
    ./config \
        --prefix=$CPREFIX \
        --openssldir=$CSYSCONFDIR/ssl \
        zlib shared
```

#### configure_args
These arguments are used, if there is no configure.sh available in the directory. Only the part after ./configure is included!
```
--libdir=$CPREFIX/lib/$P
--program-prefix=""
--with-openssl
--with-pcre
--with-zlib
```

#### destdir.sh
Optional

This file is used for “make” on the source code. If it is not available,
```
make DESTDIR=$D install
```
will be used in the source directory.

This file is not needed in lighttpd, the code below is from screen
```
    make DESTDIR=$D install
    mkdir -p $D$CPREFIX/etc
    install -m 0644 etc/etcscreenrc $D$CPREFIX/etc/screenrc
```

#### destdir-*.sh
Additional actions like moving or adding files. * can be replaced by etc or whatever, they all are run after compilation.

This is the content of destdir-etc.sh:
```
mkdir -p $D$CPREFIX/etc/examples
cd $X/etc/examples
install -m 0644 -o root -g root \
        lighttpd.conf lighttpd.conf-with-php \
        $D$CPREFIX/etc/examples
```

#### start-*.sh
These files get installed into the directory “/ffp/start/” during the installation. These contain a starter file.

This is the content of start-kickwebs.sh:
```
#!/ffp/bin/sh
 
# PROVIDE: kickwebs
# REQUIRE: LOGIN
# BEFORE: lighttpd
 
. /ffp/etc/ffp.subr
name="kickwebs"
start_cmd="kickwebs_start"
stop_cmd=:
 
kickwebs_start()
{
        echo "Kicking webs ..."
        killall webs
}
 
run_rc_command "$1"
```
This is the content of start-lighttpd.sh:
```
#!/ffp/bin/sh
 
# PROVIDE: lighttpd
# REQUIRE: LOGIN
 
. /ffp/etc/ffp.subr
 
name="lighttpd"
command="/ffp/sbin/lighttpd"
lighttpd_flags="-f /ffp/etc/lighttpd.conf"
required_files="/ffp/etc/lighttpd.conf"
 
run_rc_command "$1"
```

## Walk-through
Install an editor (like nano), you will need one for editing the above files.
This walk-through will show you how to compile nano.
We start by changing to the correct directory:
```
>cd /mnt/HD_a2/ffpbuildenv/source/
```
Now we create the directory and change to it:
```
mkdir nano
cd nano
```
We open http://www.nano-editor.org/ for the latest stable version, which is 2.0.9. Open the file PV for the package version:
 And enter 2.0.9.

Reset PR, we do this process for the first time. Open PR:
 And enter 1.

Now we search for the [download-url] (http://www.nano-editor.org/download.php download-url). Is there a consistent way of numbering the releases? The example of nano shows us this numbering:
```
http://www.nano-editor.org/dist/v2.0/nano-2.0.6.tar.gz
http://www.nano-editor.org/dist/v2.0/nano-2.0.7.tar.gz
http://www.nano-editor.org/dist/v2.0/nano-2.0.8.tar.gz
http://www.nano-editor.org/dist/v2.0/nano-2.0.9.tar.gz
```
Do you see the similarity?
 If so, then we can substitute the version by using $PV:
```
http://www.nano-editor.org/dist/v2.0/nano-$PV.tar.gz
```
If not, you need to enter the url manually:
```
http://www.nano-editor.org/dist/v2.0/nano-2.0.9.tar.gz
```
Pull this URL to SRC_URI.

Now we fulfilled the requirements for compiling, but nano will fail in some sections with these settings due to missing libraries (spellchecker). So we need to add some configure arguments using configure_args:
```
--enable-nanorc
--enable-color
--enable-multibuffer
--disable-speller
```
Now everything is set for compiling. Now we chroot to the respective directory:
```
sh /mnt/HD_a2/ffpbuildenv/chroot.sh
cd /mnt/HD_a2/ffpbuildenv/source/
```
And run the download:
```
./Make.sh -F nano
```
And run the compilation:
```
./Make.sh nano
```
This will take a while. If you get you prompt back and the line above states “OK.” everything went fine and you will find the final package in /mnt/HD_a2/ffpbuildenv/packages/. Otherwise, you should check the log:
```
tail /mnt/HD_a2/ffpbuildenv/build-logs/nano*log
```
