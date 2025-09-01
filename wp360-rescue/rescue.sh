#!/usr/bin/env bash
usage() {
  cat <<EOF
Usage: $0 <take/restore>

This script allows you to back up or restore everything you need to make CODESYS realize it's actually running on the same device after reimaging.
Probably a whole lot more, but I'm working on it. Bear with me.

This script must be run as root, and it will create (or read) /backup.tgz and /mmcblk0.dump (which will usually be immediately deleted).
EOF
}
error() {
  echo "$2" >&2
  exit "$1"
}

stop_all() {
  systemctl stop codesysedge codesyscontrol codemeter codemeter-webadmin || error 4 "Could not stop CODESYS services (are you root?)"
}

targets=(
  /mmcblk0.dump
  /etc/fstab
  /etc/.fstab
  /boot/firmware/cmdline.txt
  /etc/codesyscontrol/
  /etc/codesysedge/
  /etc/machine-id
  /etc/ssh/ssh_host_ecdsa_key
  /etc/ssh/ssh_host_ed25519_key
  /etc/ssh/ssh_host_rsa_key
  /etc/ssh/ssh_host_ecdsa_key.pub
  /etc/ssh/ssh_host_ed25519_key.pub
  /etc/ssh/ssh_host_rsa_key.pub
  /etc/wibu/
  /var/lib/CodeMeter/
  /var/log/CodeMeter/
  /var/opt/codesys/
  /var/opt/codesysedge/
)

take() {
  stop_all

  sfdisk --dump /dev/mmcblk0 > /mmcblk0.dump || error 1 "Could not dump partition table"

  tar czf /backup.tgz -C / ${targets[@]} || error 2 "Could not create backup archive"

  rm /mmcblk0.dump || echo "Could not remove /mmcblk0.dump" >&2
}


restore() {
  stop_all

  tarcmd=(tar -xf /backup.tgz -C /)
  restore=()

  for i in ${!targets[@]}; do
    t="${targets[$i]}"
    while : ; do
      if [[ "$i" -lt 4 ]] ; then
        confirm=y
      else
        echo "Do you want to restore $t? [y/n]"
        read confirm
      fi
      case $confirm in
        y | Y)
          restore+=("${t:1}")
          break
          ;;

        n | N)
          break
          ;;

        *)
          echo "Invalid choice."
          ;;
      esac
    done
  done
  for t in ${restore[@]}; do
    if [[ "$t" != "${restore[0]}" ]] ; then
      echo rm "/$t"
      rm -r "$t" || error 3 "Could not remove file/folder"
    fi
  done

  ${tarcmd[@]} ${restore[@]} || error 2 "Could not restore backup archive"
  sfdisk /dev/mmcblk0 --force < /mmcblk0.dump || error 1 "Could not restore partition table"
  rm /mmcblk0.dump || echo "Could not remove /mmcblk0.dump" >&2
}

case "$1" in 
  take)
    take
    ;;

  restore)
    restore
    ;;

  *)
    usage
    ;;

esac
