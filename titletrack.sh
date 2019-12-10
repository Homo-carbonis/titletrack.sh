#!/bin/bash
if hash ffprobe 2>/dev/null; then
  probe=ffprobe
elif hash avprobe 2>/dev/null; then
  probe=avprobe
else
  echo >&2 "Requires either ffprobe or avprobe in PATH. (Usually included with ffmpeg)"
  exit 1
fi

for file in "$@"; do
  _title="$($probe -loglevel error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 "file:$file")"
  title="${_title%% }"
  _track="$($probe -loglevel error -show_entries format_tags=track -of default=noprint_wrappers=1:nokey=1 "file:$file")"
  ntracks="${_track##*/}"
  track="$(printf "%0${#ntracks}d" ${_track%%/*})"
  _format="$($probe -loglevel error -select_streams 0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "file:$file")"
  format="${_format%% }"
  newfile="$(dirname file)/$track - $title.$format"
  echo "$newfile"
  mv "$file" "$newfile"
done
