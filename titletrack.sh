#!/bin/bash
for file in "$@"; do
  _title="$(ffprobe -loglevel error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 "file:$file")"
  title="${_title%% }"
  _track="$(ffprobe -loglevel error -show_entries format_tags=track -of default=noprint_wrappers=1:nokey=1 "file:$file")"
  ntracks="${_track##*/}"
  track="$(printf "%0${#ntracks}d" ${_track%%/*})"
  _format="$(ffprobe -loglevel error -select_streams 0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "file:$file")"
  format="${_format%% }"
  newfile="$(dirname file)/$track-$title.$format"
  echo "$newfile"
  mv "$file" "$newfile"
done
