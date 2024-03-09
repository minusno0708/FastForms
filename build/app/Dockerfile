FROM elixir:1.16.1-slim

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y make git gcc inotify-tools && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.7.7 --force && \
    mix deps.get && mix deps.compile
    