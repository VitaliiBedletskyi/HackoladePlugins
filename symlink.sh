#!/bin/bash

PLUGIN_NAME=$1

if [ $# -eq 0 ]; then
    echo "Error: Plugin name '$PLUGIN_NAME' does not specified."
    exit 1
fi

SOURCE_PATH="$(dirname "$(realpath "$0")")/$PLUGIN_NAME"
DESTINATION_PATH="$HOME/.hackolade/plugins/${PLUGIN_NAME%/}"

if [ ! -e "$SOURCE_PATH" ]; then
    echo "Error: Plugin folder '$SOURCE_PATH' does not exist."
    exit 1
fi

if [[ -L "$DESTINATION_PATH" ]]; then
  rm "$DESTINATION_PATH"
fi

if [ -d $DESTINATION_PATH ]; then
  rm -rf "$DESTINATION_PATH"
fi

ln -sf "$SOURCE_PATH" "$DESTINATION_PATH"

echo "Symbolic link created:"
echo "Source: $SOURCE_PATH"
echo "Link: $DESTINATION_PATH"