#!/usr/bin/env bash

# Make sure JDK version is 11 and maven is installed.
# You must also start MongoDB for tests.
# On some systems in some timezones ISO Date tests may fail.
# (Mentioned here https://github.com/MorphiaOrg/morphia/pull/1572)

GIT_REPO=https://github.com/MorphiaOrg/morphia
NUM_COMMITS_TO_BUILD=100

git clone $GIT_REPO -q
rm -rf errors_log_morphia.txt
cd morphia

for ((i=$NUM_COMMITS_TO_BUILD-1; i>=0; i--))
do
    info=`git checkout master~$i 2>&1 | sed -n "s/HEAD is now at /$i. /gp"`
    echo "$info"
    out=`mvn install 2>&1`
    if grep -q "BUILD SUCCESS" <<< "$out"; then
        echo "BUILD OK"
    else
        echo "BUILD ERROR (for details see errors_log_morphia.txt)"
        echo "$info" >>../errors_log_morphia.txt
        echo "$out" >>../errors_log_morphia.txt
        echo "" >>../errors_log_morphia.txt
    fi
done

cd ..
rm -rf morphia
