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
  find "$SOURCE_PATH" -type f -iname "*.$ext" | while read -r file; do
    # 元のファイル名と拡張子を取得
    base_name=$(basename "$file")
    name="${base_name%.*}"  # 拡張子を除いたファイル名
    extension="${base_name##*.}"

    # コピー先ファイルパスを生成
    dest_file="$DESTINATION_PATH/$base_name"
    counter=1

    # 同名ファイルが存在する場合にサフィックスを追加
    while [ -e "$dest_file" ]; do
      dest_file="$DESTINATION_PATH/${name}($counter).$extension"
      counter=$((counter + 1))
    done

    # ファイルをコピー
    cp "$file" "$dest_file"
  done
done

echo "Copy completed."

