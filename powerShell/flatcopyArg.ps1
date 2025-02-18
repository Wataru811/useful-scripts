param (
    [string]$sourcePath,        # コピー元フォルダ
    [string]$destinationPath    # コピー先フォルダ
)

# 対象とする拡張子を指定
$extensions = @("*.jpg", "*.mp4", "*.mov")

# 引数のバリデーション
if (-not (Test-Path -Path $sourcePath)) {
    Write-Host "エラー: コピー元フォルダが存在しません。"
    exit
}

if (-not (Test-Path -Path $destinationPath)) {
    Write-Host "コピー先フォルダが存在しません。作成します。"
    New-Item -ItemType Directory -Path $destinationPath | Out-Null
}

# 拡張子ごとにファイルを取得してコピー
foreach ($ext in $extensions) {
    Get-ChildItem -Path $sourcePath -Recurse -File -Filter $ext | ForEach-Object {
        $destinationFile = Join-Path -Path $destinationPath -ChildPath $_.Name
        try {
            Copy-Item -Path $_.FullName -Destination $destinationFile -Force -ErrorAction Stop
        } catch {
            Write-Host "Error copying file: $_.FullName - $($_.Exception.Message)"
        }
    }
}

Write-Host "コピーが完了しました。"
