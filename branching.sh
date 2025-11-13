#!/usr/bin/env bash

git init --object-format=sha1 --initial-branch=main
git config commit.gpgSign false
git config tag.gpgSign false
git config core.abbrev 5
export LANG=fr_FR.UTF-8
export LANGUAGE=$LANG
export GIT_AUTHOR_NAME=moi
export GIT_AUTHOR_EMAIL=moi@moi.com
export GIT_AUTHOR_DATE='1234567890 +0100'
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL
export GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE

git add README test.rb LICENSE
git commit -m 'commit 1'
git log
git status

echo "commit2" >>README
git add README
git commit -m 'commit 2'
git log
git status

echo "commit3" >>README
git add README
git commit -m 'commit 3'
git log
git status
