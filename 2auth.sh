#!/bin/sh

ENCFS_DIR="${HOME}/ownCloud/Documents/encfs"
ENCFS_MOUNT="${HOME}/fuse/encfs"
AUTHFILE="${ENCFS_MOUNT}/.2auths"
FILTER="${1}"

if [ ! -f ${AUTHFILE} ]; then
  echo `zenity --password` | encfs -S -i 1 -o ro ${ENCFS_DIR} ${ENCFS_MOUNT}
  if [ $? != 0 ]; then
    echo "EncFs mount error."
    notify-send -i /usr/share/icons/gnome/32x32/status/dialog-error.png "EncFs mount error."
    exit 1
  fi
fi

cat ${AUTHFILE} | while read LINE
do
  OIFS="${IFS}"; IFS=','
  set -- ${LINE}; IFS="${OIFS}"
  if [ `echo "${1}" | grep -i "${FILTER}"` ] ; then
    TOTP=`oathtool --totp -b "${2}"`
    echo "${1} : ${TOTP}"
    notify-send -t 10000 -i /usr/share/icons/gnome/32x32/status/dialog-password.png ${1} "<span size=\"x-large\"><b>${TOTP}</b></span>"
  fi
done

