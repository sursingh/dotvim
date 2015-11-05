#!/bin/sh

git submodule foreach git pull origin master
git submodule foreach git diff --name-only --diff-filter=U
