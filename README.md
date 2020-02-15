Small script for syncing a list of directories and files to a specified location.

Purpose is to run this periodically with cron to keep important files stored at a single place, which then can be backed up to an external location like Nextcloud, Dropbox or the like.

Uses plain cp for single files and rsync for directories.

Example cron job for running the script every 30 minutes:

    30 * * * * backup-files.sh sync myfileslist mytargetdir >/dev/null 2>&1

