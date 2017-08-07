#!/bin/sh

# Tests
#
# A set of common functions that should be tested on the docker image.

install()
{
    apk add --update zip >/dev/null 2>&1
}

tex_version()
{
    tex --version
}

small2e()
{
    (cd $BIN_DIR && latex small2e.tex)
}

sample2e()
{
    (cd $BIN_DIR && latex sample2e.tex)
}

scheme_version()
{
    latex --version
}