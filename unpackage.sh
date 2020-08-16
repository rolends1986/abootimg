#!/bin/bash
pos=`grep -P -a -b -m 1 --only-matching '\x1F\x8B\x08' zImage1 | cut -f 1 -d :`
echo "Extracting gzip'd kernel image from file: zImage (start = $pos)"
 
if [ ! -z $pos ]; then
echo "Dumping compressed image"
dd if=zImage of=zImage_unpacked.gz bs=1 skip=$pos 2>/dev/null >/dev/null
echo "Unzipping compressed image"
gunzip -qf zImage_unpacked.gz
fi
