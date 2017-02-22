# Dockerized Latex
[![Image][image-badge]][image-link]
[![License][license-badge]][license-link]
[![Build][build-badge]][build-link]

---

 * [Summary](#summary)
 * [Usage](#usage)
 * [Components](#components)
 * [Build Process](#build-process)
 * [Labels](#labels)
 * [User and Group Mapping](#user-and-group-mapping)

## Summary

Comprehensive TeX document production system for use as a continuous integration image.

## Usage

You can use this image locally with `docker run`, calling `latexmk` as such:

```console
docker run -v /media:/media jrbeverly/latex:full latexmk -pdf manual.tex
```

You must include the tag for the latex scheme when calling either `docker run` or using in a build job.  This specifies which scheme of latex you are using.

### Gitlab

You can add a build job with `.gitlab-ci.yml`

```yaml
compile_pdf:
  image: jrbeverly/latex:full
  script:
    - latexmk -pdf manual.tex
  artifacts:
    paths:
      - manual.pdf
```

## Image Tags

Build tags available with the image `jrbeverly/latex:{TAG}`.

| Tag | Details | Description |
| --- | ------ | ----------- |
| [![Version basic][basic-badge]][basic-link] | [![Image basic][basic-image-badge]][basic-link] | A basic scheme (plain and latex) image with packages of scheme-basic. |
| [![Version context][context-badge]][context-link] | [![Image context][context-image-badge]][context-link] | A ConTeXt scheme image with packages of scheme-context. |
| [![Version full][full-badge]][full-link] | [![Image full][full-image-badge]][full-link]| A full scheme (everything) image with packages of scheme-full. |
| [![Version gust][gust-badge]][gust-link] | [![Image gust][gust-image-badge]][gust-link] | A GUST TeX Live scheme image with packages of scheme-gust. |
| [![Version medium][medium-badge]][medium-link] |[![Image medium][medium-image-badge]][medium-link] | A medium scheme (small + more packages and languages) image with packages of scheme-medium. |
| [![Version tetex][tetex-badge]][tetex-link] | [![Image tetex][tetex-image-badge]][tetex-link] | A teTeX scheme (more than medium, but nowhere near full) image with packages of scheme-tetex. |
| [![Version xml][xml-badge]][xml-link] | [![Image xml][xml-image-badge]][xml-link] | A XML scheme image with packages of scheme-xml. |

## Components

### Metadata Arguments

Metadata build arguments used in the system, the follow the [Label Schema Convention](http://label-schema.org).

| Variable | Value | Description |
| -------- | ----- |------------ |
| BUILD_DATE | see [metadata.variable](Makefile.metadata.variable) | The Date/Time the image was built. |
| VERSION | see [metadata.variable](Makefile.metadata.variable) | Release identifier for the contents of the image. |
| VCS_REF | see [metadata.variable](Makefile.metadata.variable) | Identifier for the version of the source code from which this image was built. |

### Build Arguments

Build arguments used in the system.

| Variable | Default | Description |
| -------- | ------- | ----------- |
| SCHEME | see [app.variable](Makefile.app.variable) | Sets the latex scheme to be installed. |
| DUID | see [user.variable](Makefile.user.variable) | The [user id](http://www.linfo.org/uid.html) of the docker user. |
| DGID | see [user.variable](Makefile.user.variable) | The [group id](http://www.linfo.org/uid.html) of the docker user's group. |
| USER | see [Makefile](Makefile) | Sets the [user](http://www.linfo.org/uid.html) to use when running the image. |

### Volumes

Volumes exposed by the docker container.[^1]

| Volume | Description |
| --------------------------| ------------- |
| /media/ | A directory for making use of latex build. |

### Environment Variables

Environment variables used in the system.

| Variable | Default | Description |
| -------- | ------- | ----------- |
| HOME | / | The pathname of the user's home directory. |
| PATH | /usr/local/texlive/*/bin/x86_64-linux | The pathname of the texlive binaries. |

## Build Process

To build the docker image, use the included [`Makefile`](Makefile). It is recommended to use the makefile to ensure all build arguments are provided.

```
make baseimage
make privileged
```

You can also build the image manually, as visible in [`Makefile`](Makefile).  However this is discouraged as the makefile ensures all build arguments are properly formatted.

## Labels

The docker image follows the [Label Schema Convention](http://label-schema.org).  The values in the namespace can be accessed by the following command:

```console
docker inspect -f '{{ index .Config.Labels "org.label-schema.LABEL" }}' IMAGE
```

The label namespace `io.gitlab.jrbeverly` is common among `jrbeverly-docker` images and is a loosely structured set of values.  The values in the namespace can be accessed by the following command:

```console
docker inspect -f '{{ index .Config.Labels "io.gitlab.jrbeverly.LABEL" }}' IMAGE
```

## User and Group Mapping

All processes within the docker container will be run as the **docker user**, a non-root user.  The **docker user** is created on build with the user id `DUID` and a member of a group with group id `DGID`.  

Any permissions on the host operating system (OS) associated with either the user (`DUID`) or group (`DGID`) will be associated with the docker user.  The values of `DUID` and `DGID` are visible in the [Build Arguments](#build-arguments), and can be accessed by the commands:

```console
docker inspect -f '{{ index .Config.Labels "io.gitlab.jrbeverly.user" }}' IMAGE
docker inspect -f '{{ index .Config.Labels "io.gitlab.jrbeverly.group" }}' IMAGE
```

The notation of the build variables is short form for docker user id (`DUID`) and docker group id (`DGID`). 

[^1]: It is necessary to ensure that the **docker user** (`DUID`) has permission to access volumes. (see [User / Group Identifiers](#user-and-group-mapping))

[build-badge]: https://img.shields.io/badge/build-pipelines-brightgreen.svg?maxAge=2592000
[build-link]: https://gitlab.com/jrbeverly-docker/docker-latex/pipelines?scope=branches

[license-badge]: https://images.microbadger.com/badges/license/jrbeverly/latex.svg
[license-link]: https://microbadger.com/images/jrbeverly/latex "Get your own license badge on microbadger.com"

[image-badge]: https://img.shields.io/badge/alpine-3.5-orange.svg?maxAge=2592000
[image-link]: https://hub.docker.com/r/frolvlad/alpine-glibc/

[basic-badge]: https://images.microbadger.com/badges/version/jrbeverly/latex:basic.svg
[basic-image-badge]: https://images.microbadger.com/badges/image/jrbeverly/latex:basic.svg
[basic-link]: https://microbadger.com/images/jrbeverly/latex:basic "Get your own version badge on microbadger.com"

[context-badge]: https://images.microbadger.com/badges/version/jrbeverly/latex:context.svg
[context-image-badge]: https://images.microbadger.com/badges/image/jrbeverly/latex:context.svg
[context-link]: https://microbadger.com/images/jrbeverly/latex:context "Get your own version badge on microbadger.com"

[full-badge]: https://images.microbadger.com/badges/version/jrbeverly/latex:full.svg
[full-image-badge]: https://images.microbadger.com/badges/image/jrbeverly/latex:full.svg
[full-link]: https://microbadger.com/images/jrbeverly/latex:full "Get your own version badge on microbadger.com"

[gust-badge]: https://images.microbadger.com/badges/version/jrbeverly/latex:gust.svg
[gust-image-badge]: https://images.microbadger.com/badges/image/jrbeverly/latex:gust.svg
[gust-link]: https://microbadger.com/images/jrbeverly/latex:gust "Get your own version badge on microbadger.com"

[medium-badge]: https://images.microbadger.com/badges/version/jrbeverly/latex:medium.svg
[medium-image-badge]: https://images.microbadger.com/badges/image/jrbeverly/latex:medium.svg
[medium-link]: https://microbadger.com/images/jrbeverly/latex:medium "Get your own version badge on microbadger.com"

[tetex-badge]: https://images.microbadger.com/badges/version/jrbeverly/latex:tetex.svg
[tetex-image-badge]: https://images.microbadger.com/badges/image/jrbeverly/latex:tetex.svg
[tetex-link]: https://microbadger.com/images/jrbeverly/latex:tetex "Get your own version badge on microbadger.com"

[xml-badge]: https://images.microbadger.com/badges/version/jrbeverly/latex:xml.svg
[xml-image-badge]: https://images.microbadger.com/badges/image/jrbeverly/latex:xml.svg
[xml-link]: https://microbadger.com/images/jrbeverly/latex:xml "Get your own version badge on microbadger.com"