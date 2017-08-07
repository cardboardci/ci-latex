#!/bin/sh
set -ex
cd /tmp/

# 
# Variables
#
FILE=/tmp/install-tl-unx.tar.gz

# 
# Installing texlive
#
apk --update --no-cache add gnupg perl wget
apk add --virtual build-dependencies tar xz fontconfig-dev curl

mkdir texlive 
cd texlive

curl -sSL ${TEXLIVE_URL} | tar xfz - -C . --strip-components=1
echo "selected_scheme ${SCHEME}" >> texlive.profile
echo "option_doc 0" >> texlive.profile
echo "option_src 0" >> texlive.profile
/tmp/texlive/install-tl --profile=/tmp/texlive/texlive.profile

mkdir -p /usr/local/texlive/bin/
ln -s /usr/local/texlive/*/bin/x86_64-linux /usr/local/texlive/bin/

apk del build-dependencies
rm -rf /tmp/* /var/tmp/* /var/cache/apk/*