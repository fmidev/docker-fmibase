#!/bin/bash -ex

# Run inside container, test that yum cache is working
ls -l /var/cache/yum

yum update -y
test `find /var/cache/yum/ | wc -l` -gt 0

# Test installing something and verify it is still in cache
yum install -y openssh-clients
test `find /var/cache/yum/ -name openssh\*.rpm | wc -l` -gt 0


