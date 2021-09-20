#!/usr/bin/env bash

# Make sure JDK version is 11 and srcML is installed.

GIT_REPO=https://github.com/JetBrains-Research/astminer
NUM_COMMITS_TO_BUILD=100

git clone $GIT_REPO -q
rm -rf errors_log_astminer.txt
cd astminer

for ((i=$NUM_COMMITS_TO_BUILD-1; i>=0; i--))
do
    info=`git checkout master~$i 2>&1 | sed -n "s/HEAD is now at /$i. /gp"`
    echo "$info"
    out=`./gradlew build 2>&1`
    if grep -q "BUILD SUCCESSFUL" <<< "$out"; then
        echo "BUILD OK"
    else
        echo "BUILD ERROR (for details see errors_log_astminer.txt)"
        echo "$info" >>../errors_log_astminer.txt
        echo "$out" >>../errors_log_astminer.txt
        echo "" >>../errors_log_astminer.txt
    fi
done

cd ..
rm -rf astminer
