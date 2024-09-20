#!/usr/bin/env bash

ffmpeg -i "$1" -codec copy "${1::-4}".mp4 -movflags +faststart
