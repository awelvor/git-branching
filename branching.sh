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
cat README
git add README
git commit -m 'commit 2'
git log
git status

echo "commit3" >>README
cat README
git add README
git commit -m 'commit 3'
git log
git status
echo "step1"

git branch testing
git checkout testing
echo "BRANCH TESTING"
echo "commit4" >>README
echo "commits 2,3,4"
cat README
git add README

git commit -m 'commit 4'
git log
git status
echo "BRANCH MAIN"
git checkout main
echo "retour en arriere: commits 2,3"
cat README

git log --oneline --decorate --graph --all
echo "BASIC BRANCHING AND MERGIN"
echo "c0" >index.html
git add index.html
git commit -m"add c0"
echo "c1" >> index.html
git add index.html
git commit -m"add c1"
echo "c2" >> index.html
git add index.html
git commit -m"add c2"
cat index.html

git checkout -b iss53
echo "Create new footer [issue 53]" >> index.html
git add index.html
git commit -m "git commit -a -m 'Create new footer [issue 53]'"
cat index.html
echo "RETOUR MAIN"
git checkout main
cat index.html

git checkout -b hotfix
echo 'Fix broken email address' >> index.html
git commit -a -m 'Fix broken email address'
git checkout master
git merge hotfix
