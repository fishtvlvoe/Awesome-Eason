# 文字浮水印（選配）

跟「說人話／去 AI 味」分開。前者改語氣；這份處理肉眼看不到的 Unicode／文字型標記。

## 何時啟用

使用者說以下任一：

• 去文字浮水印

• 清理不可見字元

• 清除 AI provenance

• 檢查有沒有文字浮水印／zero-width

• 先檢查再決定要不要清

發文、交稿前想掃一輪隱形字元時也可主動問一次（只問一次）。

## 預設做到哪

• 預設：`inspect` → 必要時 `layer-a`（清不可見字元，保留原檔，產出 `*.cleaned.*`）

• 不要預設做 Layer B（統計式改寫）。要做必須使用者明確同意，且只能標 best-effort

• 不要宣稱「已通過 AI 偵測」或「證明是人類寫的」

## 腳本位置

Companion skill：`companions/text-watermark-cleaner-zh-tw/`

macOS／Linux：

```bash
bash companions/text-watermark-cleaner-zh-tw/scripts/run-text-watermark.sh inspect ./draft.md --json
bash companions/text-watermark-cleaner-zh-tw/scripts/run-text-watermark.sh clean ./draft.md --stats
```

細節與邊界見 companion 的 `SKILL.md`、`NOTICE.md`。
