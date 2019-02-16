#!/bin/bash
LANG=en_us_8859_1
BACKUPTIME=`date +%b-%d-%y-%H.%M` 

DIR=$BACKUPTIME 
DESTINATION=opengl-3d-simulator-$BACKUPTIME.tar.gz 
SOURCEFOLDER=./opengl/opengl-3d-simulator 
mkdir ./backup/$DIR
tar --exclude='.git' -cpzf $DESTINATION $SOURCEFOLDER #create the backup
mv $DESTINATION ./backup/$DIR

DESTINATION=frequency-visualiser-$BACKUPTIME.tar.gz 
SOURCEFOLDER=./sdl/frequency-visualiser/v3 
tar --exclude='.git' -cpzf $DESTINATION $SOURCEFOLDER
mv $DESTINATION ./backup/$DIR
