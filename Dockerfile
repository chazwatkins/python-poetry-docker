FROM python:3

LABEL maintainer="Chaz Watkins <chazwatkins@live.com>"

# -- Install Poetry and update configuration
RUN pip install poetry \
    && poetry config settings.virtualenvs.create false

WORKDIR /app

# -- Copy 
ONBUILD COPY . .

# -- Install dependencies:
ONBUILD RUN poetry install --no-dev -q