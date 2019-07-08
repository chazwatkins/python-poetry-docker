FROM python:3

LABEL maintainer="Chaz Watkins <chazwatkins@live.com>"

# -- Install Poetry and update configuration
RUN pip install poetry -q

WORKDIR /app

# -- Copy 
ONBUILD COPY . .

# -- Install dependencies:
ONBUILD RUN poetry build -f wheel -q \
    && pip install dist/*.whl -q \
    && rm -rf dist \
    && rm -rf $HOME/.cache