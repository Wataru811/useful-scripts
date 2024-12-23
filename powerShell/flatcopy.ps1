# コピー元とコピー先を指定
$sourcePath = "C:\コピー元フォルダ"
$destinationPath = "C:\コピー先フォルダ"

# 対象とする拡張子を指定
$extensions = @("*.jpg", "*.mp4", "*.mov")

# コピー先フォルダが存在しない場合は作成
if (-not (Test-Path -Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath | Out-Null
}

# 拡張子ごとにファイルを取得してコピー
foreach ($ext in $extensions) {
    Get-ChildItem -Path $sourcePath -Recurse -File -Filter $ext | ForEach-Object {
        $destinationFile = Join-Path -Path $destinationPath -ChildPath $_.Name
        Copy-Item -Path $_.FullName -Destination $destinationFile -Force
    }
}

