# Dockerized Latex
[![MIT License][license-badge]][license][![Alpine][alpine-badge]][alpine]

## Summary

Comprehensive TeX document production system for use as a continuous integration image.

## Usage

You can use this image locally with `docker run`, calling `latexmk` as such:

```console
docker run -v /media:/media jrbeverly/latex latexmk -pdf manual.tex
```

### Gitlab
You can add a build job with `.gitlab-ci.yml`

```yaml
compile_pdf:
  image: jrbeverly/latex
  script:
    - latexmk -pdf manual.tex
  artifacts:
    paths:
      - manual.pdf
```

## Image Tags

Build tags available with the image `jrbeverly/latex:{TAG}`.

| Tag | Status | Description |
| --- | ------ | ----------- |
| [master](/../tree/master) | [![build status](/../badges/master/build.svg)](/../commits/master) | A full scheme (everything) image with packages of scheme-full. |
| [basic](/../tree/scheme-basic) | [![build status](/../badges/scheme-basic/build.svg)](/../commits/scheme-basic) | A basic scheme (plain and latex) image with packages of scheme-basic. |
| [context](/../tree/scheme-context) | [![build status](/../badges/scheme-context/build.svg)](/../commits/scheme-context) | A ConTeXt scheme image with packages of scheme-context. |
| [full](/../tree/scheme-full) | [![build status](/../badges/scheme-full/build.svg)](/../commits/scheme-full) | A full scheme (everything) image with packages of scheme-full. |
| [gust](/../tree/scheme-gust) | [![build status](/../badges/scheme-gust/build.svg)](/../commits/scheme-gust) | A GUST TeX Live scheme image with packages of scheme-gust. |
| [medium](/../tree/scheme-medium) | [![build status](/../badges/scheme-medium/build.svg)](/../commits/scheme-medium) | A medium scheme (small + more packages and languages) image with packages of scheme-medium. |
| [tetex](/../tree/scheme-tetex) | [![build status](/../badges/scheme-tetex/build.svg)](/../commits/scheme-tetex) | A teTeX scheme (more than medium, but nowhere near full) image with packages of scheme-tetex. |
| [xml](/../tree/scheme-xml) | [![build status](/../badges/scheme-xml/build.svg)](/../commits/scheme-xml) | A XML scheme image with packages of scheme-xml. |

## Components
### Build Arguments

Build arguments used in the system.

| Variable | Default | Description |
| -------- | ------- | ----------- |
| BUILD_DATE | see [`Makefile`](Makefile.image.variable) | The date which the image was built. |
| VERSION | see [`Makefile`](Makefile.image.variable) | The version of the image. |

### Volumes

Volumes exposed by the docker container.

| Volume | Description |
| --------------------------| ------------- |
| /media | A directory for making use of latex build |

### Environment Variables

Environment variables used in the system.

| Variable | Default | Description |
| -------- | ------- | ----------- |
| HOME | / | The pathname of the user's home directory. |
| PATH | /usr/local/texlive/*/bin/x86_64-linux | The pathname of the texlive binaries. |

## Build Process

To build the docker image, use the included makefile.

```
make build
```

You can also build the image manually, but it is recommended to use the makefile to ensure all build arguments are provided.

```
docker build \
		--build-arg BUILD_DATE="$(date)" \
		--build-arg VERSION="${VERSION}" \
		--pull -t ${IMAGE}:${TAG} .
```

[license-badge]: https://img.shields.io/badge/license-MIT-blue.svg?maxAge=2592000
[license]: LICENSE
[alpine-badge]: https://img.shields.io/badge/alpine-3.5-green.svg?maxAge=2592000
[alpine]: https://alpinelinux.org/posts/Alpine-3.5.0-released.html