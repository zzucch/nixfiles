#!/usr/bin/env bash

if [[ $# -ne 3 ]]; then
  echo "Usage: $0 <output_dir> <num_screenshots> <interval>"
  exit 1
fi

output_dir="$1"
num_screenshots="$2"
interval="$3"

mkdir -p "$output_dir"

colors=("ff0000" "00ff00" "0000ff")

swww clear 000000
swww clear 000000
swww clear 000000

sleep 3

for ((i=1; i<=num_screenshots; i++))
do
  current_color=${colors[$(( (i-1) % 3 ))]}
  swww clear "$current_color"
  swww clear "$current_color"

  sleep "$interval"

  filename="$output_dir/$i.png"

  grim "$filename"
done

swww clear 000000
swww clear 000000
echo "saved to $output_dir"
