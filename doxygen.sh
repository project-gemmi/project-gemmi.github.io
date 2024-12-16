#!/bin/bash -eu

[ -L include ] || ln -s ../gemmi/include .
[ -d include/gemmi ] || { echo "no include/gemmi"; exit 1; }

echo  '/**' > headers.dox
sed '/^gemmi/s/^/\\file /;t;s/\./.\\ /g' ../gemmi/docs/headers.rst >> headers.dox
echo  '*/' >> headers.dox

doxygen
