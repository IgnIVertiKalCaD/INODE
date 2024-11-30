#!/bin/bash

# Проверка, что передана директория для поиска
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Директория для поиска
SEARCH_DIR="$1"

# Рекурсивный поиск файлов с расширением .nix и применение команды nixpkgs-fmt
find "$SEARCH_DIR" -type f -name "*.nix" | while read -r file; do
  echo "Formatting $file"
  nixpkgs-fmt "$file"
done
