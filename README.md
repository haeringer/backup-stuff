## backup-stuff

Small rsync wrapper script for syncing a list of directories and files to a specified location.


### Purpose

Syncing or backing up a whole user home directory often includes lots of unneeded files and can be overkill in terms of space, while still missing files which may be scattered across the system (e.g. global config files in `/etc`)

`backup-stuff` can be run periodically via cron to keep important files stored at a single place, which then can be synced to an external location like Nextcloud, Dropbox or the like.


### Usage

Write the files and directories line by line into the source file:

```
/home/example/.tmux.conf
/home/example/.config/Code/User/keybindings.json
/home/example/Documents
/etc/default/tlp
/etc/apt/sources.list
/etc/apt/sources.list.d
...
```

Example cron job for running the script every 30 minutes:

    30 * * * * backup-stuff sync mysourcelist mytargetdir >/dev/null 2>&1

