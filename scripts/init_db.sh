#!/usr/bin/env bash
set -eo pipefail

if ! [ -x "$(command -v sqlx)" ]; then
  echo >&2 "Error: sqlx is not installed."
  echo >&2 "Use:"
  echo >&2 "    cargo install --version='~0.6' sqlx-cli --no-default-features --features rustls,postgres"
  echo >&2 "to install it."
  exit 1
fi

POSTGRES_USER=${POSTGRES_USER:=postgres}
POSTGRES_PASSWORD="${POSTGRES_PASSWORD:=postgres}"
POSTGRES_DB="${POSTGRES_DB:=newsletter}"
POSTGRES_HOST="${POSTGRES_HOST:=postgres}"
POSTGRES_PORT="${POSTGRES_PORT:=5432}"
DATABASE_URL=postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}
export DATABASE_URL

sqlx database create
sqlx migrate run

echo "Postgres has been migrated, ready to go!"
