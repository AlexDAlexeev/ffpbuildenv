export folder=/mnt/HD_a2/tftp/jackxp
export driver=/mnt/HD_a2/tftp/inf
export dest=/mnt/HD_a2/tftp

cd $dest

#wxp.0
cp $folder/I386/STARTROM.N1\_ .
cabextract STARTROM.N1_
rm STARTROM.N1_
sed -i -e 's/NTLDR/XPLDR/gi' startrom.n12
mv startrom.n12 wxp.0

#XPLDR
cp $folder/I386/SETUPLDR.EX\_ .
cabextract SETUPLDR.EX\_ 
rm SETUPLDR.EX\_ 
sed -i -e 's/winnt\.sif/winxp.sif/gi' setupldr.exe
sed -i -e 's/ntdetect\.com/ntdetect.wxp/gi' setupldr.exe
mv setupldr.exe XPLDR

#NTDETECT.wxp
cp $folder/I386/NTDETECT.COM .
mv NTDETECT.COM ntdetect.wxp

python /ffp/share/ris-linux-0.4/infparser.py  $driver
python /ffp/share/ris-linux-0.4/modldr.py -p 4012 $dest/XPLDR
