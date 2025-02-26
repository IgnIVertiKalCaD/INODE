#!/bin/bash

hostname=$(hostname -s)

if [ -z "$1" ]; then
    echo "Github push on branch"
    echo $hostname
    sh scripts/reinit.sh && sh scripts/git_commit.sh && git push origin $hostname
    exit 1
else
    sh scripts/reinit.sh && sh scripts/git_commit.sh && git push origin $1
fi

