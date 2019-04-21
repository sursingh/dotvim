#!/bin/sh

git submodule update --init --rebase --remote

(cd bundle/youcompleteme; git submodule update --recursive; python3 install.py)
