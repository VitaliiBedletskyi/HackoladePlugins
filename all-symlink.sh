#!/bin/bash

# Iterate through folders in the current directory
for PLUGIN_NAME in */; do
  # Check if the item is a directory
  if [ -d "$PLUGIN_NAME" ]; then
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

    echo -e "Symbolic link created: $SOURCE_PATH -> $DESTINATION_PATH"

  fi
done
