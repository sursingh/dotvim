#!/bin/sh

git submodule update --init --recursive --remote

(cd bundle/youcompleteme; git submodule update --init --depth 1 --recursive; python3 install.py)
