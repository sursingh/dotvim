#!/bin/sh

git submodule update --init --recursive --remote

(cd bundle/youcompleteme; git submodule sync --recursive; git submodule update --init --recursive; python3 install.py)
