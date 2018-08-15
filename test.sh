#!/bin/bash -ex

# Test outside of Jenkins, Jenkins may allow tests to be run as steps
cd `dirname $0`
mkdir -p tmp-yum-cache
docker run -v ${PWD}/tmp-yum-cache:/var/cache/yum -v ${PWD}:/work -w /work fmibase ./test-inside-container-1.sh
docker run -v ${PWD}/tmp-yum-cache:/var/cache/yum -v ${PWD}:/work -w /work fmibase ./test-inside-container-2.sh
rm -rf tmp-yum-cache

