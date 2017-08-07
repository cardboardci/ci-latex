FROM jrbeverly/glibc:privileged

#
# Build Arguments
#
ARG SCHEME
ARG TEXLIVE_URL

#
# Environment Variables
#
ENV PATH=/usr/local/texlive/bin/x86_64-linux:$PATH

#
# Provision
#
COPY rootfs/ /

COPY provision/install.sh /tmp/install.sh
RUN sh /tmp/install.sh && rm -f /tmp/install.sh

# 
# Options
# 
WORKDIR /media
ENTRYPOINT []
CMD []

#
# User
#
ARG USER
USER $USER

#
# Metadata Arguments
#
ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

# Metadata
#
LABEL \
    maintainer="jrbeverly" \
    \
    org.label-schema.name="texlive" \
    org.label-schema.summary="An alpine image with different texlive schemes installed." \
    org.label-schema.description="Comprehensive TeX document production system." \
    org.label-schema.maintainer="jrbeverly" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.version=$VERSION \
    org.label-schema.url="https://www.tug.org/texlive/" \
    org.label-schema.license="MIT" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://gitlab.com/jrbeverly-docker/docker-latex" \
    org.label-schema.docker.cmd="docker run -v $(pwd):/media/ jrbeverly/latex:baseimage latexmk -pdf manual.tex" \
    \
    io.jrbeverly.project="latex" \
    io.jrbeverly.summary="A docker image with texlive $SCHEME installed, running as the $USER user." \
    io.jrbeverly.latex.meta.BUILD_DATE="The Date/Time the image was built." \
    io.jrbeverly.latex.meta.VERSION="Release identifier for the contents of the image." \
    io.jrbeverly.latex.meta.VCS_REF="Identifier for the version of the source code from which this image was built." \
    io.jrbeverly.latex.args.USER="Sets the [user](http://www.linfo.org/uid.html) to use when running the image." \
    io.jrbeverly.latex.args.SCHEME="The texlive scheme to be installed." \
    io.jrbeverly.latex.args.TEXLIVE_URL="The URL to the texlive base installer (install-tl)." \
    io.jrbeverly.latex.volume.media="/media/|The default working directory of the image."
