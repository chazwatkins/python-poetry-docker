FROM python:3.7.3-slim

LABEL maintainer="Chaz Watkins <chazwatkins@live.com>"

RUN apt-get update -y \
    && apt-get install curl -y \
    && curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python \
    && mv "$HOME/.poetry" "/.poetry"

ENV PATH="/.poetry/bin:$PATH"