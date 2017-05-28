FROM jrbeverly/glibc:privileged
MAINTAINER jrbeverly

# Build Arguments
#
# Arguments used in the build process of the docker container.
ARG SCHEME
ARG TEXLIVE_URL

# Environment Variables
#
# Environment variables present in the docker container.
ENV PATH=/usr/local/texlive/bin/x86_64-linux:$PATH

# Provision
#
# Copy and execute provisioning scripts of the docker container.
COPY provision/install.sh /tmp/install.sh
RUN sh /tmp/install.sh && rm -rf /tmp/*

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

# User Arguments
#
# Arguments used in the user process of the docker container.
ARG USER

# User
#
# Configuration of the docker user for container execution.
USER ${USER}

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
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="texlive" \
    org.label-schema.description="Comprehensive TeX document production system." \
    org.label-schema.url="https://www.tug.org/texlive/" \
    org.label-schema.license="MIT" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://gitlab.com/jrbeverly-docker/docker-latex.git" \
    org.label-schema.version=$VERSION 