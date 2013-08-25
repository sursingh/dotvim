#!/bin/bash

git pull --rebase
git submodule update --init

# pathogen updates the tag files in the plugin directories. 
# Due to this git assumes that we have local changes.
# 
# This scripts set the "ignore = untracked" to ignore all new files. 
# This needs to be run everytime a new submodule is added

git submodule --quiet foreach echo \$name \
    | xargs -n1 -I{} git config --file .gitmodules submodule.{}.ignore untracked

