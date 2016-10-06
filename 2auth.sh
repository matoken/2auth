#!/bin/sh

AUTHFILE="${HOME}/fuse/encfs/.2auths"

if [ ! -f ${AUTHFILE} ]; then
  echo `zenity --password` | encfs -S -i 1 -o ro ~/ownCloud/Documents/encfs ~/fuse/encfs
#  echo "RET : $?"
  if [ $? != 0 ]; then
    echo "EncFs mount error."
    notify-send -i /usr/share/icons/gnome/32x32/status/dialog-error.png "EncFs mount error."
    exit 1
  fi
  echo "EncFs mount!"
else
  echo "EncFs ok."
fi

cat ${AUTHFILE} | while read LINE
do
  OIFS="${IFS}"; IFS=','
  set -- ${LINE}; IFS="${OIFS}"
  TOTP=`oathtool --totp -b ${2}`
  echo "${1} : ${TOTP}"
  notify-send -t 10000 -i /usr/share/icons/gnome/32x32/status/dialog-password.png ${1} "<span size=\"x-large\"><b>${TOTP}</b></span>"
done

