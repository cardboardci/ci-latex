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