#!/bin/sh

# Variables
#
# Variables of the script.
SCRIPT=$(readlink -f "$0")
DIR="$(dirname $SCRIPT)"
ROOT_DIR="$(dirname $DIR)"
BIN_DIR="${DIR}/target"

# Tests
#
# The functions that test certain functionality.

function install()
{
    apk add --update zip >/dev/null 2>&1
}

function version()
{
    tex --version
}

function small2e()
{
    (cd $BIN_DIR && latex small2e.tex)
}

function sample2e()
{
    (cd $BIN_DIR && latex sample2e.tex)
}

function scheme_version()
{
    latex --version
}

# Test Runner
#
# Runs the tests.
(
    function assertEquals()
    {
        msg=$1
        expected=$2
        actual=$3

        if [ "$expected" != "$actual" ]; then
            echo "$msg: FAILED: EXPECTED=$expected ACTUAL=$actual"
        else
            echo "$msg: PASSED"
        fi
    }

    echo "Testing image for privileged."
    mkdir -p $BIN_DIR
    (
      RESULT=$(install)
      assertEquals "install to image" 0 $?
    )

    (
      RESULT=$(version)
      assertEquals "tex is installed" 0 $?
    )

    (
      RESULT=$(small2e)
      assertEquals "a small2e tex is built" 0 $?
    )
    
    (
      RESULT=$(sample2e)
      assertEquals "a sample2e tex is built" 0 $?
    )

    (
      RESULT=$(scheme_version)
      assertEquals "scheme tex is tested" 0 $?
    )
)