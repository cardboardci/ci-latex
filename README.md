# Dockerized Latex
[![Build Status][ci-badge]][ci][![MIT License][license-badge]][license][![Alpine][alpine-badge]][alpine]

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

## Image Tags

Build tags available with the image `jrbeverly/latex:{TAG}`.

<table>
  <tr>
    <th width="7%">Tag</th>
    <th width="10%">Status</th> 
    <th>Description</th>
  </tr>
  <tr>
    <td><a href="/../tree/master">master</a></td>
    <td><a href="/../commits/master"><img alt="Build Status" src="/../badges/master/build.svg"/></a></td>
    <td>A basic scheme (plain and latex) image with packages of default.</td>
  </tr>
  <tr>
    <td><a href="/../tree/scheme-basic">basic</a></td>
    <td><a href="/../commits/scheme-basic"><img alt="Build Status" src="/../badges/scheme-basic/build.svg"/></a></td>
    <td>A basic scheme (plain and latex) image with packages of scheme-basic.</td>
  </tr>
  <tr>
    <td><a href="/../tree/scheme-context">context</a></td>
    <td><a href="/../commits/scheme-context"><img alt="Build Status" src="/../badges/scheme-context/build.svg"/></a></td>
    <td>A ConTeXt scheme image with packages of scheme-context.</td> 
  </tr>
  <tr>
    <td><a href="/../tree/scheme-full">full</a></td>
    <td><a href="/../commits/scheme-full"><img alt="Build Status" src="/../badges/scheme-full/build.svg"/></a></td>
    <td>A full scheme (everything) image with packages of scheme-full.</td> 
  </tr>
  <tr>
    <td><a href="/../tree/scheme-gust">gust</a></td>
    <td><a href="/../commits/scheme-gust"><img alt="Build Status" src="/../badges/scheme-gust/build.svg"/></a></td>
    <td>A GUST TeX Live scheme image with packages of scheme-gust.</td>
  </tr>
  <tr>
    <td><a href="/../tree/scheme-medium">medium</a></td>
    <td><a href="/../commits/scheme-medium"><img alt="Build Status" src="/../badges/scheme-medium/build.svg"/></a></td>
    <td>A medium scheme (small + more packages and languages) image with packages of scheme-medium.</td>
  </tr>
  <tr>
    <td><a href="/../tree/scheme-tetex">tetex</a></td>
    <td><a href="/../commits/scheme-tetex"><img alt="Build Status" src="/../badges/scheme-tetex/build.svg"/></a></td>
    <td>A teTeX scheme (more than medium, but nowhere near full) image with packages of scheme-tetex.</td>
  </tr>
  <tr>
    <td><a href="/../tree/scheme-xml">xml</a></td>
    <td><a href="/../commits/scheme-xml"><img alt="Build Status" src="/../badges/scheme-xml/build.svg"/></a></td>
    <td>A XML scheme image with packages of scheme-xml.</td>
  </tr>
</table>


## Components
### Build Arguments

Build arguments used in the system.

| Variable | Default | Description |
| -------- | ------- | ----------- |
| BUILD_DATE | - | The date which the image was built. |
| VERSION | - | The version of the image. |

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
| PATH | /usr/local/texlive/2016/bin/x86_64-linux | The pathname of the texlive binaries. |

[ci-badge]: /../badges/master/build.svg
[ci]: /../commits/master
[license-badge]: https://img.shields.io/badge/license-MIT-blue.svg?maxAge=2592000
[license]: LICENSE
[alpine-badge]: https://img.shields.io/badge/alpine-3.5-green.svg?maxAge=2592000
[alpine]: https://alpinelinux.org/posts/Alpine-3.5.0-released.html