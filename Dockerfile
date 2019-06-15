FROM rust:1.35.0-slim-stretch

RUN apt-get update && apt-get install -y libssl-dev \
  pkg-config

RUN export USER=dirk  

WORKDIR /app