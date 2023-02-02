#!/usr/bin/env bash

mkdir -p -- "$script-backuos"

tar -zcf usr/local/bin/script-backups/backup-$(date +%Y%m%d).tar.gz -C usr/local/ bin
