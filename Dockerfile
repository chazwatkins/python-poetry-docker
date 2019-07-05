FROM python:3

LABEL maintainer="Chaz Watkins <chazwatkins@live.com>"

# -- Install Pipenv:
RUN pip install --pre poetry

WORKDIR /app

# -- Copy 
ONBUILD COPY pyproject.toml pyproject.toml
ONBUILD COPY poetry.lock poetry.lock

# -- Install dependencies:
ONBUILD RUN poetry export -f requirements.txt \
    && pip install -q -r requirements.txt