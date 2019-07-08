FROM python:3

LABEL maintainer="Chaz Watkins <chazwatkins@live.com>"

# -- Install Pipenv:
RUN pip install -U --pre -q poetry

ONBUILD WORKDIR /app
ONBUILD COPY . .

ONBUILD RUN poetry build -f wheel -q \
    && pip install dist/*.whl -q \
    && rm -rf dist \
    && rm -rf $HOME/.cache