#!/bin/bash

AUTHFILE="${HOME}/fuse/encfs/.2auths"

if [ ! -f ${AUTHFILE} ]; then
  echo `zenity --password` | encfs -S -i 1 -o ro ~/ownCloud/Documents/encfs ~/fuse/encfs
#  echo "RET : $?"
  if [ $? != 0 ]; then
    echo "EncFs mount error."
    notify-send -i /usr/share/icons/gnome/32x32/status/dialog-error.png "EncFs mount error."
    exit -1
  fi
  echo "EncFs mount!"
else
  echo "EncFs ok."
fi

cat ${AUTHFILE} | while read LINE
do
  arr=( `echo ${LINE} | tr -s ',' ' '` );
#  echo ${arr[0]} : `oathtool --totp -b ${arr[1]}`
  notify-send -t 10000 -i /usr/share/icons/gnome/32x32/status/dialog-password.png ${arr[0]} "<span size=\"x-large\"><b>`oathtool --totp -b ${arr[1]}`</b></span>"
done

