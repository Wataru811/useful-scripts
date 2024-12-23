#!/bin/bash

# 引数チェック
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 source_directory destination_directory"
  exit 1
fi

# コピー元とコピー先を取得
SOURCE_PATH="$1"
DESTINATION_PATH="$2"

# 対象とする拡張子を指定
EXTENSIONS=("jpg" "mp4" "mov")

# コピー先ディレクトリを作成（存在しない場合）
if [ ! -d "$DESTINATION_PATH" ]; then
  mkdir -p "$DESTINATION_PATH"
fi

# 指定した拡張子のファイルをコピー
for ext in "${EXTENSIONS[@]}"; do
  find "$SOURCE_PATH" -type f -iname "*.$ext" -exec cp -f {} "$DESTINATION_PATH" \;
done

echo "Copy completed."
