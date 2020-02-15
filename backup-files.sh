#!/bin/bash
set -euo pipefail

# Copy/sync a list of files and directories to another directory.

filelist=$2
backupdest=$3


if [[ "$#" -eq 0 ]]; then
  ${0} help
elif [[ "$1" == "help" ]]; then
  echo "usage: $(basename ${0}) sync <file with list of files and dirs to backup> <destination dir>"
elif [[ "$1" == "sync" ]]; then

  if [ ! -d "${backupdest}" ]; then
    echo "Backup destination ${backupdest} does not exist"
    exit 1
  fi

  # todo: check if a sync is still running, if yes, quit

  while IFS= read -r srcitem; do

  if [ -d "${srcitem}" ]; then
    rsync --archive --delete --ignore-errors \
      --exclude={.env/,.venv/,venv/} \
      "${srcitem%/}" "${backupdest}"
  elif [ -f "${srcitem}" ]; then
    cp "${srcitem}" "${backupdest}"
  fi
  
  done < "${filelist}"

else
  echo "unknown command: $@" >&2
  exit 1
fi
