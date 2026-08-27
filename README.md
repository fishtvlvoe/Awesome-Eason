# 譯神｜Awesome-Eason

### 一個把「難懂的話」翻成「聽得懂的話」的 AI 小幫手

---

## 這東西是做什麼的？

你有沒有遇過這三種狀況：

1. 工程師或 AI 跟你解釋一個技術問題，每個字你都認得，湊在一起完全看不懂。
2. AI 幫你寫的文案，讀起來很厲害、很有氣勢，但你講不出它到底在說什麼。
3. 上面兩招都用過了，還是完全跟不上，只想按一個「救命鍵」重講一次。

**譯神** 就是為了解決這三件事做的工具。裝上它之後，你只要打一句關鍵字，AI 的回答方式就會自動換一套，改用你聽得懂的方式講話。

它有三個模式：

| 模式 | 用來做什麼 | 什麼時候用 |
| :--- | :--- | :--- |
| **小白模式** | 把技術問題講成生活比喻，先講結論、再給你下一步要按什麼按鈕 | 看不懂程式碼、架構、錯誤訊息的時候 |
| **說人話模式** | 把 AI 寫的空話、套話清掉，改成像真人打字給朋友看的口氣 | 文案、貼文、信件讀起來太假、太厲害的時候 |
| **翻譯模式** | 不管前面在講什麼，立刻停下來，用最白話重講一次，還會附一個生活對照 | 完全看不懂、還是不懂、連要問什麼都想不出來的時候 |


---

<!-- GODS-FAMILY:START -->
## 👑 「神」系列家族：彼此怎麼接力合作？

「神」系列不是各自為政的工具，而是一條從**商務接案、工程開發到成果交付**的完整流水線：

```text
┌─────────────────────────────────────────────────────────────────────────┐
│                       👑 「神」系列家族完整協同接力鏈                         │
└─────────────────────────────────────────────────────────────────────────┘

【第一棒：接案與商務需求】
  📋 案神 (Awesome-Anson) ➔ 丟進客戶會議逐字稿與資料，自動拆解需求、產出報價單與簡報。
         │
         ▼ (客戶成交，需求確認，交棒給工程總管)
【第二棒：自動化工程開發】
  🏗️ 蓋神 (Awesome-Gason) ➔ 把需求轉成 Spectra 規格，指揮多 Agent 在隔離房間寫碼與驗收。
         │
         ├─► 🗣️ 譯神 (Awesome-Eason) ➔ 過程中遇到看不懂的技術名詞？對外文案太假？
         │                               隨時叫「譯神」出來翻譯成白話、去 AI 味。
         │
         ├─► ⌨️ Key神 (Awesome-Keyson) ➔ 專案需註冊第三方平台、申請 API Key、填寫繁瑣企業表單？
         │                               貼上網址交給「Key神」安全自動填表，不用手打。
         │
         ▼ (系統開發完成，功能已驗收上線)
【第三棒：產品交付與行銷宣傳】
  🎬 剪神 (Awesome-Janson) ➔ 錄好的系統操作教學、發表會影片，一鍵自動精修成長片與爆款短影音。
```

### 家族成員倉庫速查

* 📋 **[案神 Awesome-Anson](https://github.com/fishtvlvoe/Awesome-Anson)**：接案分析、商務報價、合約拆解與提案簡報架構
* 🏗️ **[蓋神 Awesome-Gason](https://github.com/fishtvlvoe/Awesome-Gason)**：Spectra SDD 全自動開發總管（規格→TDD→多代理派工→CR→驗收）
* 🎨 **[網頁設計師 Awesome-website-design](https://github.com/fishtvlvoe/Awesome-website-design)**：網頁企劃與部署執行者，整合 frontend-design、impeccable 等工具產出 HTML mockup 並自己部署上線
* 🗣️ **[譯神 Awesome-Eason](https://github.com/fishtvlvoe/Awesome-Eason)**（本倉庫）：小白技術降維、台灣繁中去 AI 味與翻譯急救
* ⌨️ **[Key神 Awesome-Keyson](https://github.com/fishtvlvoe/Awesome-Keyson)**：自動 Key 單、智慧語意對齊與跨平台表單自動填寫
* 📊 **[待神 Awesome-Dyson](https://github.com/fishtvlvoe/Awesome-Dyson)**：跨專案開發儀表板：固定網址看現況、進度、待確認事項與歷史紀錄，換 CLI/AI 接手不用重新對焦
* 🎬 **[剪神 Awesome-Janson](https://github.com/fishtvlvoe/Awesome-Janson)**：全能 AI 影片剪輯 Agent（長片精修、爆款短影音與動效）
<!-- GODS-FAMILY:END -->

---
## 你打什麼，它回什麼（實際例子）

### 例子 1：技術問題聽不懂 → 打「小白模式」

**你打：**
> 小白模式，幫我解釋這個 bug

**AI 原本會回你（看不懂）：**
> 我們在處理 checkout endpoint 時發現因缺乏 Row-level lock 導致併發下庫存扣減出現 Race condition，進而引發 Deadlock 異常。

**裝了譯神之後會回你（看得懂）：**
> **發生什麼事**：這就像兩個人在超商同時伸手拿最後一包洋芋片，店員刷了兩次條碼，電腦卡住不知道該賣給誰。
> **我們做了什麼**：加了一個「排隊拿號碼牌」的機制，先搶到的人先拿，晚一步的人會被告知「已售完」。
> **你現在要做的事**：點一下〔測試訂購〕按鈕，確認賣完之後畫面有沒有正常顯示「已售完」。

### 例子 2：文案太假、太 AI → 打「說人話」

**你打：**
> 說人話，幫我改這段文案

**AI 原本會寫成（太假）：**
> 在當今瞬息萬變的數位時代，這款工具的誕生無疑標誌著工作效率的重大飛躍，能為團隊賦能並優化整個業務閉環。

**裝了譯神之後會改成（像真人寫的）：**
> 工作節奏越來越快，這款工具幫團隊省下很多重複手動的步驟，流程也順很多。如果你的團隊常被雜事卡住，值得試試看。

### 例子 3：上面都聽不懂 → 打「翻譯模式」

**你打：**
> 看不懂，說人話

**發生的事：**
不管 AI 前一句在講技術還是在改文案，都會立刻停下來，換成小學五年級也看得懂的說法，再搭一個生活對照，重新講一次剛才那段話，最後只問你一句：「這樣有比較清楚嗎？」

---

## 怎麼裝、打什麼字會啟動

### 第一步：安裝

**用網頁版 AI（ChatGPT、Gemini、Claude.ai 這種要打開網站用的）→ 開這個網頁，一鍵複製貼上**

👉 **[fishtvlvoe.github.io/Awesome-Eason](https://fishtvlvoe.github.io/Awesome-Eason/)**

點一下「一鍵複製 Prompt」按鈕，內容就複製好了，網頁上還會告訴你 ChatGPT／Gemini／Claude.ai 各自要貼到哪個欄位（自訂指令、系統提示這些不同 AI 叫法不同的東西，功能都一樣：讓它記住固定規則）。

<details>
<summary>沒辦法開網頁？照這個手動版一樣能裝</summary>

1. 打開 [`prompts/system-prompt.md`](prompts/system-prompt.md)，把裡面全部內容複製起來
2. 貼到你那套 AI 的「自訂指令」「Custom Instructions」「System Prompt」「Project Instructions」（不同 AI 叫法不同，功能都一樣：讓它記住固定規則）
3. 存檔，之後每次對話它都會照這套規則講話
</details>

**如果你用的是 Claude Code / Cursor / Codex 這種要在終端機（Terminal，就是打指令那個黑色視窗）裝「外掛」的工具**，一行指令自動幫你偵測、裝好，比貼上網頁版還省事：

```bash
curl -fsSL https://raw.githubusercontent.com/fishtvlvoe/Awesome-Eason/main/install.sh | bash
```

這行指令會自動抓你電腦上裝了 Claude Code 還是 Codex／OpenCode，自動裝到對的地方；裝過了會自動更新，不會重複裝。Cursor 沒有「裝一次全部生效」的地方，指令跑完會告訴你手動兩步怎麼做。

<details>
<summary>想自己控制裝去哪裡？或不想跑一鍵指令，展開看手動版</summary>

<details>
<summary>Claude Code 使用者</summary>

把下面這行貼到終端機（Terminal）執行一次就好，之後每次開 Claude Code 都會自動生效：
```bash
git clone https://github.com/fishtvlvoe/Awesome-Eason.git ~/.claude/skills/awesome-eason
```
</details>

<details>
<summary>Cursor 使用者</summary>

把專案裡的 [`.cursorrules`](.cursorrules) 這個檔案複製到你自己的專案最上層資料夾，或把裡面的內容貼到 Cursor 的「Settings → Rules for AI」欄位。
</details>

<details>
<summary>Codex / OpenCode 使用者</summary>

```bash
git clone https://github.com/fishtvlvoe/Awesome-Eason.git ~/.agents/skills/awesome-eason
```
</details>

</details>

### 第二步：打關鍵字啟動

不用背指令，打這些日常會講的話就會自動切換：

| 想要的效果 | 打這句話 |
| :--- | :--- |
| 技術東西聽不懂 | 「我看不懂」、「說大白話」、「小白模式」 |
| 文案改自然一點 | 「說人話」、「幫這段去 AI 味」、「改自然」 |
| 只想知道哪裡怪，先不要動手改 | 「先標問題不要改」 |
| 檢查／清文字隱形標記 | 「去文字浮水印」、「清理不可見字元」、「檢查有沒有文字浮水印」 |
| **上面都試過還是不懂，要救命鍵** | 「看不懂，說人話」、「完全看不懂」、「還是不懂」 |
| **連要打什麼都不知道** | 「請教我怎麼用你」，它會直接帶你 |

---

## 剛裝好？照抄這四句就能用

不用自己想怎麼問，遇到下面的狀況，照抄那句話貼上去就好。不管你裝在哪一套 AI，這四句都通用：

1. **AI 講的東西你看不懂（小白模式）**
   打：「請用小白模式解釋你剛才這個 bug。」
2. **你自己打了一大段亂亂的東西，想整理成能發的文案（說人話模式）**
   打：「說人話，幫我修改這段文案。」
3. **AI 吐出一大串程式碼或專業術語，你完全看不懂也聽不懂（翻譯模式）**
   打：「看不懂，說人話。」
4. **連要問什麼都想不出來（翻譯模式）**
   打：「請教我怎麼用你。」它會自己帶你，不用你先搞懂規則。

---

## 資料夾裡有什麼（給想深入研究的人看）

- [`SKILL.md`](SKILL.md)：這個 Agent 的完整行為規則
- [`.cursorrules`](.cursorrules)：給 Cursor 用的規則檔
- [`install.sh`](install.sh)：CLI 一鍵安裝腳本，自動偵測裝去 Claude Code 還是 Codex／OpenCode（也會掛上浮水印選配）
- [`companions/text-watermark-cleaner-zh-tw/`](companions/text-watermark-cleaner-zh-tw/)：選配——檢查／清理文字隱形標記（來源見該目錄 `NOTICE.md`）
- [`docs/index.html`](docs/index.html)：網頁版一鍵複製頁面的原始碼（就是 [fishtvlvoe.github.io/Awesome-Eason](https://fishtvlvoe.github.io/Awesome-Eason/) 這個網站）
- [`references/tech-plain-talk.md`](references/tech-plain-talk.md)：技術轉生活比喻的對照庫
- [`references/adhd-guardrails.md`](references/adhd-guardrails.md)：降低閱讀負擔的輸出規則
- [`references/ai-patterns.md`](references/ai-patterns.md)：AI 常見套話特徵清單
- [`references/taiwan-glossary.md`](references/taiwan-glossary.md)：台灣用語與標點對照表
- [`references/text-watermark.md`](references/text-watermark.md)：文字浮水印選配怎麼觸發、做到哪
- [`prompts/`](prompts/)：網頁版、Cursor 版用的提示詞原稿

---

## 授權

[MIT License](LICENSE)，歡迎 Fork、提 PR、擴充比喻庫。

文字浮水印選配另含上游 MIT 組件，授權與出處見 [`companions/text-watermark-cleaner-zh-tw/NOTICE.md`](companions/text-watermark-cleaner-zh-tw/NOTICE.md)。
