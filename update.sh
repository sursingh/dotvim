#!/bin/sh

git submodule update --init --recursive --remote

(cd bundle/youcompleteme; git submodule update --recursive; python3 install.py)
