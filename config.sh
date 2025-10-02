#!/bin/bash

# Prompt for the media folder path
read -p "Enter the media folder path: " media_path

# Create the required folder structure
mkdir -p "$media_path/MOVIES/Downloads"
mkdir -p "$media_path/MOVIES/Movies"
mkdir -p "$media_path/TVSHOWS/Downloads"
mkdir -p "$media_path/TVSHOWS/TVShows"

echo "✅ Media folders created successfully at: $media_path"

echo "🚀 Folder creation complete!"
