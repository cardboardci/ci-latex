#!/bin/sh
set -e

# Variables
#
# Variables of the script.
SCRIPT=$(readlink -f "$0")
DIR="$(dirname $SCRIPT)"
ROOT_DIR="$(dirname $DIR)"

# Build
#
# Build the images.
cd $ROOT_DIR/versions
for filename in *
do
	echo "Building: $filename"
    
    cd $DIR
    make VERSION=${filename} release
done