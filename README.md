# Dockerized Latex
[![Build Status](https://gitlab.com/jrbeverly-docker/docker-latex/badges/master/build.svg)](https://gitlab.com/jrbeverly-docker/docker-latex/commits/master) [![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?maxAge=2592000)](https://gitlab.com/jrbeverly-docker/docker-latex/blob/master/LICENSE) [![Alpine v3.5](https://img.shields.io/badge/alpine-3.5-green.svg?maxAge=2592000)](https://alpinelinux.org/posts/Alpine-3.5.0-released.html)

Comprehensive TeX document production system for use as a continuous integration image.

## Usage

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

## Build Tags

Build arguments used in the system.

| Tag | Description |
| --- | ----------- |
| basic | A basic scheme (plain and latex) image with packages of `scheme-basic`. |
| context | A ConTeXt scheme image with packages of `scheme-basic`. |
| full | A full scheme (everything) image with packages of `scheme-basic`. |
| gust | A GUST TeX Live scheme image with packages of `scheme-basic`. |
| medium | A medium scheme (small + more packages and languages) image with packages of `scheme-basic`. |
| minimal | A minimal scheme (plain only) image with packages of `scheme-basic`. |
| small | A small scheme (basic + xetex, metapost, a few languages) image with packages of `scheme-basic`. |
| tetex | A teTeX scheme (more than medium, but nowhere near full) image with packages of `scheme-basic`. |
| xml | A XML scheme image with packages of `scheme-basic`. |

## Build Arguments

Build arguments used in the system.

| Variable | Default | Description |
| ---------- | -------- | --------------- |
| BUILD_DATE | - | The date which the image was built. |
| VERSION | - | The version of the image. |

## Environment Variables

Environment variables used in the system.

| Variable | Default | Description |
| ---------- | -------- | --------------- |
| HOME | / | The pathname of the user's home directory. |
| PATH | /usr/local/texlive/2016/bin/x86_64-linux | The pathname of the texlive binaries. |