#!/bin/bash -ex

# Run inside container, test that yum cache is working
ls -l /var/cache/yum

# Yum cache should be intact from previous test 1 even though the
# container was recreated
test `find /var/cache/yum/ | wc -l` -gt 0

# Test openssh is still in cache
test `find /var/cache/yum/ -name openssh\*.rpm | wc -l` -gt 0
# But is not installed
test ! -e /usr/bin/ssh


# Clean yum cache
# Thise can't be done outside container as we might not have root there
rm -rf /var/cache/yum/*





