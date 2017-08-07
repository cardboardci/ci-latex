#!/bin/sh

#
# Variables
#
SCRIPT=$(readlink -f "$0")
DIR="$(dirname $SCRIPT)"
DIR_TESTS="$(dirname $(dirname $DIR))"

DIR_LIBRARY="${DIR_TESTS}/lib"
DIR_RESOURCES="${DIR_TESTS}/resources"
DIR_TARGET="${DIR_TESTS}/target"

#
# Tests
#
. $DIR_LIBRARY/testbase.sh
. $DIR_LIBRARY/functions.sh

# 
# Test Runner
#
(
    rm -rf $DIR_TARGET
    mkdir -p $DIR_TARGET
    
    (
      RESULT=$(install)
      assertNotEquals "cannot install to image" 0 $?
    )

    (
      RESULT=$(tex_version)
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