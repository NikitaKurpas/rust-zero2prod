#!/bin/bash
set -eo pipefail

DB_NAME_REGEX='^([0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12})$'
POSTGRES_USER="${POSTGRES_USER:=postgres}"
POSTGRES_HOST="${POSTGRES_HOST:=postgres}"
export PGPASSWORD="${POSTGRES_PASSWORD:=postgres}"
# list all databases
psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -c "\l" | \
    # select only the database names
    awk -F'|' '{print $1}' | \
    # trim spaces from start and end of each line
    awk '{$1=$1};1' | \
    # filter out only test databases (those with uuid v4 name)
    grep -E "$DB_NAME_REGEX" | \
    # drop each database
    xargs -I {} psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -c "DROP DATABASE \"{}\";"

echo "Test databases have been dropped."