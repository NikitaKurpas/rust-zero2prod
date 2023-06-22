FROM mcr.microsoft.com/devcontainers/rust:0-1-bullseye

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends lld clang postgresql-client

RUN cargo install --version="~0.6" sqlx-cli --no-default-features \
  --features rustls,postgres