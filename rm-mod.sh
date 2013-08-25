#!/bin/bash

MODFILE=".gitmodules"
MODULES=$*

function die
{
    echo $*
    exit
}

function run
{
    $* || die "failed: $*"
}

function rmmod
{
    local MOD=$1
    local KEY_PATH="submodule.bundle/$MOD.path"
    local KEY_URL="submodule.bundle/$MOD.url"
    local KEY_IGNORE="submodule.bundle/$MOD.ignoxre"

    local MOD_PATH=`git config --file=$MODFILE --get $KEY_PATH`
    local MOD_URL=`git config --file=$MODFILE --get $KEY_URL`
    local MOD_IGN=`git config --file=$MODFILE --get $KEY_IGNORE`

    run git rm --cached $MOD_PATH
    run git config --file=$MODFILE --remove-section submodule.bundle/$MOD
    run git config --remove-section submodule.bundle/$MOD

    run git add .gitmodules

    rm -rf $MOD_PATH
}

for mod in $MODULES
do
    rmmod $mod
done
    
git commit -m "removed plugins" -m "$MODULES"
