#!/usr/bin/env sh

main() {
  docker run \
    -v "$PWD":"$PWD" \
    -w "$PWD" \
    python:3.11-alpine python app.py
}

main $@

