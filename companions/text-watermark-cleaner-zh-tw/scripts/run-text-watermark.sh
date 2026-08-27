#!/usr/bin/env bash
# macOS / Linux 入口：對應上游 run-text-watermark.ps1（Layer A inspect / clean）
set -euo pipefail

usage() {
  cat <<'EOF'
用法：
  run-text-watermark.sh inspect <input> [--json] [--aggressive] [--stylometry] [--strip-emoji-glue]
  run-text-watermark.sh clean <input> [--output PATH] [--stats] [--aggressive] [--nfkc] [--normalize-spaces] [--strip-emoji-glue] [--strip-bidi]

預設 clean 會寫出 *.cleaned.*，不覆寫原檔。
預設不正規化空白（等同 PowerShell wrapper 的保守模式）。
EOF
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ] || [ $# -lt 2 ]; then
  usage
  exit 1
fi

MODE="$1"
INPUT="$2"
shift 2

SCRIPT_ROOT="$(cd "$(dirname "$0")" && pwd)"
PYTHON_BIN="${PYTHON_BIN:-python3}"

if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  echo "找不到 $PYTHON_BIN，請先安裝 Python 3。" >&2
  exit 127
fi

if [ ! -f "$INPUT" ]; then
  echo "找不到輸入檔：$INPUT" >&2
  exit 2
fi

case "$MODE" in
  inspect|Inspect)
    ARGS=("$SCRIPT_ROOT/inspect_text.py")
    while [ $# -gt 0 ]; do
      case "$1" in
        --json|--aggressive|--stylometry|--strip-emoji-glue) ARGS+=("$1") ;;
        *)
          echo "inspect 不認識的參數：$1" >&2
          exit 2
          ;;
      esac
      shift
    done
    ARGS+=("$INPUT")
    exec "$PYTHON_BIN" -X utf8 "${ARGS[@]}"
    ;;
  clean|Clean)
    OUTPUT=""
    STATS=0
    AGGRESSIVE=0
    NFKC=0
    NORMALIZE_SPACES=0
    STRIP_EMOJI=0
    STRIP_BIDI=0
    while [ $# -gt 0 ]; do
      case "$1" in
        --output)
          OUTPUT="${2:-}"
          shift
          ;;
        --stats) STATS=1 ;;
        --aggressive) AGGRESSIVE=1 ;;
        --nfkc) NFKC=1 ;;
        --normalize-spaces) NORMALIZE_SPACES=1 ;;
        --strip-emoji-glue) STRIP_EMOJI=1 ;;
        --strip-bidi) STRIP_BIDI=1 ;;
        *)
          echo "clean 不認識的參數：$1" >&2
          exit 2
          ;;
      esac
      shift
    done

    if [ -z "$OUTPUT" ]; then
      dir="$(dirname "$INPUT")"
      base="$(basename "$INPUT")"
      name="${base%.*}"
      ext=""
      if [ "$base" != "$name" ]; then
        ext=".${base##*.}"
      fi
      OUTPUT="${dir}/${name}.cleaned${ext}"
    fi

    ARGS=("$SCRIPT_ROOT/clean_text.py" --output "$OUTPUT")
    if [ "$NORMALIZE_SPACES" -eq 0 ]; then
      ARGS+=(--no-normalize-spaces)
    fi
    if [ "$AGGRESSIVE" -eq 1 ]; then
      ARGS+=(--aggressive-homoglyphs)
    fi
    if [ "$NFKC" -eq 1 ]; then
      ARGS+=(--nfkc)
    fi
    if [ "$STRIP_EMOJI" -eq 1 ]; then
      ARGS+=(--strip-emoji-glue)
    fi
    if [ "$STRIP_BIDI" -eq 1 ]; then
      ARGS+=(--strip-bidi)
    fi
    if [ "$STATS" -eq 1 ]; then
      ARGS+=(--stats)
    fi
    ARGS+=("$INPUT")
    exec "$PYTHON_BIN" -X utf8 "${ARGS[@]}"
    ;;
  *)
    echo "Mode 只能是 inspect 或 clean，收到：$MODE" >&2
    usage
    exit 2
    ;;
esac
