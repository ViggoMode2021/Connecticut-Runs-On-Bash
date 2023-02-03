#!/usr/bin/env bash

# Remember to configure AWS CLI

sudo tar -zcf /usr/local/bin/$(date +%Y%m%d).tar.gz -C /usr/local/ bin

aws s3api put-object --bucket vig-script-backups --key script-backup-$(date +%Y%m%d).tar.gz --body /usr/local/bin/$(date +%Y%m%d).tar.gz

# Crontab syntax: 0 0 */10 * * /usr/bin/env bash ./backup-to-aws >/dev/null 2>&1
