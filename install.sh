#!/usr/bin/env bash
# 譯神 / Awesome-Eason 一鍵安裝腳本
# 用法：curl -fsSL https://raw.githubusercontent.com/fishtvlvoe/Awesome-Eason/main/install.sh | bash
set -e

REPO_URL="https://github.com/fishtvlvoe/Awesome-Eason.git"

# curl | bash 執行時，標準輸入是腳本本身，互動輸入要改讀 /dev/tty
TTY="/dev/tty"
if [ ! -e "$TTY" ]; then
  TTY="/dev/stdin"
fi

say() { printf '%s\n' "$1"; }

check_git() {
  if ! command -v git >/dev/null 2>&1; then
    say "沒找到 git，先裝好 git 再回來跑這個腳本（Mac 打 xcode-select --install，其他系統看你的套件管理員）。"
    exit 1
  fi
}

install_to() {
  local target="$1"
  local label="$2"
  if [ -d "$target/.git" ]; then
    say "偵測到已經裝過 ${label}（在 ${target}），幫你更新到最新版本..."
    if git -C "$target" pull --ff-only >/dev/null 2>&1; then
      say "$label 更新完成。"
    else
      say "$label 更新失敗，可能是網路斷線或本地有改過檔案。手動處理：cd $target && git pull"
    fi
  else
    say "幫你把譯神裝到 ${label}（${target}）..."
    mkdir -p "$(dirname "$target")"
    if git clone --quiet "$REPO_URL" "$target" 2>/dev/null; then
      say "$label 裝好了。"
    else
      say "裝 $label 失敗，通常是網路不通或資料夾已存在但不是這個專案。手動處理：git clone $REPO_URL $target"
      return 1
    fi
  fi
  link_watermark_companion "$target" "$label"
}

# 把文字浮水印 companion 掛成獨立 skill，Agent 才找得到 SKILL.md
link_watermark_companion() {
  local skill_root="$1"
  local label="$2"
  local src="$skill_root/companions/text-watermark-cleaner-zh-tw"
  local dest
  dest="$(dirname "$skill_root")/text-watermark-cleaner-zh-tw"

  if [ ! -d "$src" ]; then
    say "這版譯神還沒帶浮水印選配，略過。"
    return 0
  fi

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    say "已有 ${dest}（不是連結），不動它。要用譯神內附版請先自己清掉那個資料夾。"
    return 0
  fi

  ln -sfn "$src" "$dest"
  say "浮水印選配已掛到 ${dest}（跟著 ${label}）。"
}

print_next_step() {
  local tool="$1"
  say ""
  say "下一步：打開 ${tool}，隨便打一句「小白模式，幫我解釋這個 bug」試試看，看它有沒有換一套講法回你。"
}

check_git

DETECTED=()
[ -d "$HOME/.claude" ] && DETECTED+=("claude")
{ [ -d "$HOME/.agents" ] || command -v codex >/dev/null 2>&1 || command -v opencode >/dev/null 2>&1; } && DETECTED+=("codex")
command -v cursor >/dev/null 2>&1 && DETECTED+=("cursor")

show_cursor_hint() {
  say ""
  say "Cursor 沒有一個全域資料夾能自動裝，改成手動兩步就好："
  say "1. 把這個 repo clone 下來：git clone $REPO_URL"
  say "2. 把裡面的 .cursorrules 複製到你自己專案的最上層資料夾，或把內容貼到 Cursor 設定的「Rules for AI」欄位"
}

manual_menu() {
  say ""
  say "沒偵測到你電腦上有裝 Claude Code / Cursor / Codex（或 OpenCode），你可以自己選一個："
  say "  1) Claude Code"
  say "  2) Cursor"
  say "  3) Codex / OpenCode"
  say "  4) 我用的是網頁版 AI（ChatGPT / Gemini / Claude.ai），不用裝腳本"
  printf '請輸入數字（1-4）：' > "$TTY" 2>/dev/null || printf '請輸入數字（1-4）：'
  read -r choice < "$TTY" 2>/dev/null || read -r choice
  case "$choice" in
    1)
      install_to "$HOME/.claude/skills/awesome-eason" "Claude Code"
      print_next_step "Claude Code"
      ;;
    2)
      show_cursor_hint
      ;;
    3)
      install_to "$HOME/.agents/skills/awesome-eason" "Codex / OpenCode"
      print_next_step "Codex 或 OpenCode"
      ;;
    4)
      say ""
      say "網頁版 AI 用這個網頁最快，點一下就複製好貼上：https://fishtvlvoe.github.io/Awesome-Eason/"
      ;;
    *)
      say "沒有這個選項，直接結束。有需要重跑這個腳本就好。"
      ;;
  esac
}

if [ "${#DETECTED[@]}" -eq 0 ]; then
  manual_menu
else
  for tool in "${DETECTED[@]}"; do
    case "$tool" in
      claude)
        install_to "$HOME/.claude/skills/awesome-eason" "Claude Code" && print_next_step "Claude Code"
        ;;
      codex)
        install_to "$HOME/.agents/skills/awesome-eason" "Codex / OpenCode" && print_next_step "Codex 或 OpenCode"
        ;;
      cursor)
        show_cursor_hint
        ;;
    esac
  done
fi

say ""
say "裝完了。用的是網頁版 AI（ChatGPT / Gemini / Claude.ai）沒被偵測到？直接開 https://fishtvlvoe.github.io/Awesome-Eason/ 一鍵複製貼上就好。"
