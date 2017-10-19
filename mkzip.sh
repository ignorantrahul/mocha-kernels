#!/bin/bash
# simple bash script for making zip

RDIR=$(pwd)

zImage="$RDIR/build/arch/arm/boot/zImage"
FWR="$RDIR/build/lib/firmware"
MOD="$RDIR/build/lib/modules"
TV="$RDIR/build/thevirus"
ZS="Thevirus_kernel_flasher-signed.zip"

if [ -d $TV ]; then
 echo "you have already cloned"
else
 echo "Downloading required files...."
git clone https://github.com/RahulTheVirus/kernel_flasher.git $TV

  fi

if [ -d $MOD ]; then
     rm -rf $TV/src/*
    cp -R $MOD/*/* $TV/src/ 
         
      fi 
     
if [ -f $zImage ]; then
      rm -rf $TV/src/zImage
     cp $zImage $TV/src/zImage
      
      fi
      
if [ -d $FWR ]; then
    chmod 777 $TV/src/firmware
      rm -rf $TV/firmware
      cp -R $FWR $TV/src/
      
      fi

 cd $TV
 
 ./build.sh
 
 if [ -f $TV/sign/$ZS ]; then
    chmod 777 $TV/sign/$ZS
    cp -R $TV/sign/$ZS $RDIR/$ZS
echo "collect zip from ${RDIR}"
   
    fi
