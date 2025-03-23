#!/bin/bash
# Backup a directory and store it in a backup folder with a timestamp
SOURCE="/path/to/important/data"
DEST="/path/to/backup/location"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
tar -czvf $DEST/backup_$TIMESTAMP.tar.gz $SOURCE
echo "Backup completed: $DEST/backup_$TIMESTAMP.tar.gz"
