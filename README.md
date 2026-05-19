# Academic Agent — 学术论文写作全流程助手

一站式学术写作 Agent，整合 13 个专业 skills + 2 个提示词库，覆盖从文献调研到最终投稿的完整生命周期。

## 特性

- **零门槛**：直接用自然语言描述需求，无需了解底层 skill 架构
- **全生命周期**：文献调研 → 选题 → 精读 → 综述 → 写作 → 图表 → 审稿 → 修改 → 定稿
- **中英双语**：完整支持简体中文、繁体中文、英文输入和输出
- **自动路由**：根据用户意图自动选择最优 skill + 模式组合
- **自包含**：克隆即用，无需额外安装依赖

## 快速开始

### 安装

```bash
git clone https://github.com/C0co-dress/academic-agent.git
cd academic-agent
bash install.sh
```

安装脚本会将 13 个 skills 符号链接到 `~/.claude/skills/` 目录。

### 使用

在 Claude Code 中直接用自然语言描述需求：

```
帮我写一篇关于AI对高等教育影响的论文
```

```
Read this paper and give me a Chinese-English side-by-side translation
```

```
帮我润色这段英文，目标是Nature风格
```

```
从文献调研到最终定稿，全程帮我
```

---

## 能力矩阵

| 能力域 | Skills / Prompts | 输入 → 输出 |
|--------|-----------------|------------|
| **文献检索** | nature-academic-search, deep-research | 关键词 → 文献池+注释 |
| **论文精读** | nature-reader | PDF/DOI → 中英对照全文 |
| **选题引导** | deep-research socratic | 模糊想法 → 明确研究问题 |
| **综述撰写** | deep-research, academic-paper | 文献池 → 综述论文 |
| **论文写作** | academic-paper, nature-writing | 研究成果 → 完整论文 |
| **中文润色** | polishing_prompts_library §1 | 中文草稿 → 正式学术中文 |
| **英文润色** | nature-polishing, polishing_prompts_library §2 | 英文草稿 → 顶会英文 |
| **去AI味** | polishing_prompts_library §3/§4 | AI味文本 → 自然人类写作 |
| **逻辑检查** | polishing_prompts_library §5 | 终稿 → 红线审查 |
| **翻译** | polishing_prompts_library §7 | 中文草稿 → 英文论文 |
| **图表生成** | nature-figure | 数据/描述 → 出版级图表 |
| **引用管理** | nature-citation | 段落 → CNS引用+格式验证 |
| **模拟审稿** | academic-paper-reviewer | 论文 → 5人审稿+修改路线图 |
| **回复审稿** | nature-response | 审稿意见 → 逐点回复信 |
| **数据声明** | nature-data | 论文 → FAIR数据声明 |
| **PPT制作** | nature-paper2ppt | 论文PDF → 中文组会PPT |
| **格式转换** | academic-paper format-convert | 论文 → LaTeX/DOCX/PDF |
| **全流程编排** | academic-pipeline | 起点材料 → 最终定稿 |

---

## 项目结构

```
academic-agent/
├── AGENT.md                          # Agent 主定义（详细版）
├── SKILL.md                          # Skill 定义（标准格式）
├── README.md                         # 本文件
├── install.sh                        # 一键安装脚本
├── UPDATE_POLICY.md                  # 更新安全策略
├── references/                       # 提示词库
│   ├── skills_chain_guide.md         # 完整 skills 链（Stage 0-9）
│   ├── polishing_prompts_library.md  # 润色/去AI味/翻译/逻辑检查
│   └── figure_generation_prompts.md  # 架构图/图表推荐/标题生成
└── skills/                           # 13 个下游 skills（自包含）
    ├── academic-paper/               # 论文写作（12-agent pipeline）
    ├── academic-paper-reviewer/      # 模拟审稿（5人独立审稿）
    ├── academic-pipeline/            # 全流程编排
    ├── deep-research/                # 深度研究（7种模式）
    ├── nature-academic-search/       # 多源文献检索
    ├── nature-citation/              # CNS引用管理
    ├── nature-data/                  # FAIR数据声明
    ├── nature-figure/                # 出版级图表
    ├── nature-paper2ppt/             # 论文PPT
    ├── nature-polishing/             # Nature风格润色
    ├── nature-reader/                # 论文精读
    ├── nature-response/              # 回复审稿
    ├── nature-writing/               # Nature风格写作
    └── shared/                       # 共享资源
```

---

## 触发关键词

### English
write paper, academic paper, research paper, paper outline, revise paper, literature review,
systematic review, meta-analysis, guide my research, polish my paper, de-AI, humanize,
reviewer response, peer review, manuscript review, paper figure, scientific figure,
data availability, paper presentation, paper PPT, format paper, translate paper,
check logic, proofread paper, academic writing

### 简体中文
写论文, 学术论文, 论文大纲, 写摘要, 修改论文, 文献回顾, 文献综述, 系统综述, 荟萃分析,
引导我写论文, 帮我规划论文, 润色论文, 去AI味, 审稿意见, 同行评审, 论文图表, 科学绘图,
数据可视化, 论文PPT, 组会汇报, 格式转换, 翻译论文, 逻辑检查, 论文校对, 学术写作,
研究方向, 选题, 实验设计, 数据分析, 回复审稿, AI声明, 引用格式

### 繁體中文
寫論文, 學術論文, 論文大綱, 寫摘要, 修改論文, 文獻回顧, 文獻綜述, 系統性回顧, 後設分析,
引導我寫論文, 幫我規劃論文, 潤色論文, 去AI味, 審稿意見, 同行評審, 論文圖表, 科學繪圖,
資料視覺化, 論文PPT, 組會匯報, 格式轉換, 翻譯論文, 邏輯檢查, 論文校對, 學術寫作,
研究方向, 選題, 實驗設計, 資料分析, 回覆審稿, AI聲明, 引用格式

---

## 可选 Skills

以下 skills 未包含在默认安装中，可根据需要手动安装：

| Skill | 用途 | 安装方式 |
|-------|------|---------|
| ml-paper-writing | ML顶会论文 (NeurIPS/ICML/ICLR) | [AI-research-SKILLs](https://github.com/zechenzhangAGI/AI-research-SKILLs) |
| systems-paper-writing | 系统顶会论文 (OSDI/SOSP/ASPLOS) | 同上 |
| academic-plotting | ML论文图表 | 同上 |
| presenting-conference-talks | 会议演讲PPT | 同上 |
| humanizer | 系统化去AI味 | [humanizer](https://github.com/blader/humanizer) |
| doc-coauthoring | 协作写文档 | [anthropics/skills](https://github.com/anthropics/skills) |
| canvas-design | 概念图/设计图 | 同上 |

---

## 工作流示例

### 从零开始写论文

```
用户: 我要研究AI对高等教育的影响，帮我从选题开始
→ deep-research socratic (引导选题)
→ nature-academic-search (文献检索)
→ deep-research lit-review (注释书目)
→ academic-paper plan (逐章规划)
→ academic-paper full (全文写作)
→ academic-paper-reviewer full (模拟审稿)
→ academic-paper revision (修改)
→ academic-paper format-convert (格式转换)
```

### 润色已有论文

```
用户: 帮我润色这段英文，目标是Nature风格
→ nature-polishing (Nature风格润色)
→ polishing_prompts_library §3 (去AI味)
→ polishing_prompts_library §5 (逻辑检查)
```

### 回复审稿意见

```
用户: 我收到了审稿意见，帮我回复
→ academic-paper revision-coach (解析审稿意见)
→ academic-paper revision (执行修改)
→ nature-response draft (生成回复信)
→ academic-paper-reviewer re-review (验证修改)
```

---

## 中文特别支持

| 功能 | 说明 |
|------|------|
| 中文触发 | 全部支持简体/繁体触发词 |
| 中文双语摘要 | zh-TW/zh-CN 可选 |
| 中文论文润色 | `polishing_prompts_library §1` |
| 中文去AI味 | `polishing_prompts_library §4` |
| 中文学术写作反模式检测 | `writing_quality_check.md §F` |
| 图表中文标签 | `nature-figure` CJK 字体方案 |
| 中文PPT | `nature-paper2ppt` 完善支持 |

---

## 更新

### 更新 nature-* 系列 skills

```bash
cd ~/.claude/skills/nature-writing   # 以 nature-writing 为例
git pull origin main
```

### 重新安装

```bash
cd academic-agent
bash install.sh
```

---

## 许可证

本项目整合了多个上游 skills，各 skill 的许可证请参见各自目录下的 LICENSE 文件。

## 相关项目

- [academic-research-skills](https://github.com/anthropics/academic-research-skills) — 论文写作/审稿/研究 skills
- [nature-skills](https://github.com/anthropics/nature-skills) — Nature 系列写作 skills
- [AI-research-SKILLs](https://github.com/zechenzhangAGI/AI-research-SKILLs) — ML/系统论文 skills
- [humanizer](https://github.com/blader/humanizer) — 去 AI 味工具
