FROM frolvlad/alpine-glibc
MAINTAINER jrbeverly

# Build Arguments
#
# Arguments used in the build process of the docker container.
ARG BUILD_DATE
ARG VERSION
ARG SCHEME='scheme-medium'

# Environment Variables
#
# Environment variables present in the docker container.
ENV PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH
ENV HOME=/

# Metadata
#
# The metadata of the image.
LABEL app="texlive"
LABEL description="Comprehensive TeX document production system"
LABEL version="${VERSION}"
LABEL build_date="${BUILD_DATE}"

# Provision
#
# Copy and execute provisioning scripts of the docker container.
COPY provision/install /tmp/install
RUN sh /tmp/install; sync; rm -rf /tmp/*

# Volumes
#
# Volumes exposed by the docker container
VOLUME /media

# Options
#
# Configuration options of the docker container
WORKDIR /media