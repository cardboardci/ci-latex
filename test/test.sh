#!/bin/sh
set -ex

tex --version

latex small2e.tex
latex sample2e.tex