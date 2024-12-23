#!/bin/bash

# 引数チェック
if [ "$#" -lt 3 ]; then
  echo "Usage: $0 source_directory destination_directory extensions (e.g., jpg mp4 mov)"
  exit 1
fi

# コピー元とコピー先を取得
SOURCE_PATH="$1"
DESTINATION_PATH="$2"
shift 2
EXTENSIONS=("$@")  # 残りの引数を拡張子として取得

# コピー先ディレクトリを作成（存在しない場合）
if [ ! -d "$DESTINATION_PATH" ]; then
  mkdir -p "$DESTINATION_PATH"
fi

# 指定した拡張子のファイルをコピー
for ext in "${EXTENSIONS[@]}"; do
  find "$SOURCE_PATH" -type f -iname "*.$ext" -exec cp -f {} "$DESTINATION_PATH" \;
done

echo "Copy completed."
