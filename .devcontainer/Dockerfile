FROM mcr.microsoft.com/devcontainers/rust:1-bookworm

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends lld clang postgresql-client

RUN cargo install cargo-tarpaulin cargo-watch cargo-expand cargo-udeps

RUN cargo install --version="~0.7" sqlx-cli --no-default-features \
  --features rustls,postgres
