FROM frolvlad/alpine-glibc
MAINTAINER jrbeverly

# Build Arguments
#
# Arguments used in the build process of the docker container.
ARG SCHEME

# Environment Variables
#
# Environment variables present in the docker container.
ENV HOME=/
ENV PATH=/usr/local/texlive/2016/bin/x86_64-linux:$PATH

# Provision
#
# Copy and execute provisioning scripts of the docker container.
COPY provision/install /tmp/install
RUN sh /tmp/install && rm -rf /tmp/*

# Volumes
#
# Volumes exposed by the docker container.
VOLUME /media

# Options
#
# Configuration options of the docker container.
WORKDIR /media
ENTRYPOINT []
CMD []

# Metadata Arguments
#
# Arguments used for the metadata of the docker container.
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

# Metadata 
#
# The metadata of the image.
LABEL \
    org.label-schema.name="texlive" \
    org.label-schema.description="Comprehensive TeX document production system." \
    org.label-schema.url="https://www.tug.org/texlive/" \
    org.label-schema.vendor="TeX User Groups" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.license="MIT" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vcs-url="https://gitlab.com/jrbeverly-docker/docker-latex.git" \
    org.label-schema.ci-build-url="https://gitlab.com/jrbeverly-docker/docker-latex/commits/master" \
    org.label-schema.version="${VERSION}" \
    org.label-schema.build-date="${BUILD_DATE}" \
    io.gitlab.jrbeverly.user="${DUID}" \
    io.gitlab.jrbeverly.group="${DGID}" \