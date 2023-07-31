#!/usr/bin/env bash
now=$(date +"%m-%d-%Y")
CONTAINER="docker-compose-postgres-sa_postgres_1"
DB="postgres"
TABLE="schools"
FILE="database-backups-${now}.csv"
sudo docker exec -u postgres ${CONTAINER} psql -d ${DB} -c "COPY ${TABLE} TO STDOUT WITH CSV HEADER " > ${FILE}
sudo mkdir -p db-backups
sudo mv ${FILE} db-backups
aws s3api put-object --bucket vig-db-backups --key /home/ubuntu/db-backups/${FILE} --body /home/ubuntu/db-backups/${FILE}
aws s3 ls s3://vig-db-backups --recursive --human-readable --summarize 
