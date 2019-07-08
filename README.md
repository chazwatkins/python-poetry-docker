# Poetry docker images

Poetry is a tool for dependency management and packaging in Python.

See the [website](https://poetry.eustace.io) for more information.

# How to use this image

## Create a `Dockerfile` in your Python app project

### Using the poetry `latest` release
```dockerfile
FROM chazw/poetry

WORKDIR /app
COPY . .

RUN poetry install --no-dev

CMD ["python", "./your-script.py"]
```

or for applications with a command-line interface:

```dockerfile
FROM chazw/poetry

WORKDIR /app
COPY . .

RUN poetry install --no-dev --develop .

CMD ["app-cli-name", "your-command"]
```

### Using the poetry `preview` release

_Current `preview` has issues with toggling off the creation of virtual environments inside of a docker container.  Reference [pull request](https://github.com/sdispater/poetry/pull/1180).  Typically we would run `poetry install ...`, but must instead export to `requirements.txt` as a workaround._

```dockerfile
FROM chazw/poetry:preview

WORKDIR /app
COPY . .

RUN poetry export -f requirements.txt --dev --without-hashes \
    && pip install --no-cache-dir -r requirements.txt -q

CMD ["python", "./your-script.py"]
```

or for applications with a command-line interface:

```dockerfile
FROM chazw/poetry:preview

WORKDIR /app
COPY . .

RUN poetry export -f requirements.txt --dev --without-hashes \
    && pip install --no-cache-dir -r requirements.txt -q \
    && pip install -q --no-cache-dir .

CMD ["app-cli-name", "your-command"]
```

# Image variants

The `poetry` images come in many variants for specific versions of `python` and the needed use case.

## `poetry:py<version>`

Default image for the latest version of `poetry` and `python`.

## `poetry:py<version>-slim`

Image for the latest version of `poetry` and `python` slim variant.

## `poetry:py<version>-preview`

Image for the preview version of `poetry` and latest version `python`.  Used for access latest features for `poetry` not yet in an official release.

## `poetry:py<version>-slim-preview`

Image for the preview version of `poetry` and latest version `python` slim variant.  Used for access latest features for `poetry` not yet in an official release.
