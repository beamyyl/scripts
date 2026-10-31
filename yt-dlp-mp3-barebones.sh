#!/bin/bash
read -p "Paste link: " link
yt-dlp -x --audio-format mp3 --audio-quality 0 -P "$HOME/Downloads" --no-warnings "$link"
echo "Done"
