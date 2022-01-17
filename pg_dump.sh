#!/usr/bin/env bash

DATABASE="dvdrental_5"
USERNAME="postgres"
GCP_HOSTNAME="10.5.96.3"
AWS_HOSTNAME=""
export PGPASSWORD=""

/home/13/bin/pg_dump -U $USERNAME -s -h $GCP_HOSTNAME -d $DATABASE > /tmp/db.dump
psql -U $USERNAME -h $AWS_HOSTNAME -d $DATABASE < /tmp/db.dump > /tmp/pgdump.log
echo "PG DUMP is completed"
rm -rf /tmp/db.dump
