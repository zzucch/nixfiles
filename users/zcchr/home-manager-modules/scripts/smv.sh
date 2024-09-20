#!/usr/bin/env bash

src_dir="$HOME/Downloads"
dst_dir="$HOME/mn/subs"

if [ ! -d "$src_dir" ]; then
	echo "source directory does not exist"
	exit 1
fi

if [ ! -d "$dst_dir" ]; then
	echo "destination directory does not exist"
	exit 1
fi

find "$src_dir" -type f \
	\( -name '*.srt' -o -name '*.ass' \) \
	-exec mv -t "$dst_dir" '{}' +

echo "done"
