# Skills Chain Guide — 完整论文写作 Skills 链

从研究构思到最终投稿的完整 skills 调用链。每个阶段标注主要 skill、替代 skill、及模式选择建议。

---

## 全景图

```
[1.文献调研] → [2.确定选题] → [3.深入研读] → [4.综述撰写] → [5.创新点设计]
     ↓                                                    ↓
[6.实验/方法设计] → [7.数据分析与检验] → [8.论文撰写] → [9.图表制作]
                                                ↓
                       [10.审稿修改] ← [9.5 引用完善] ← ┘
                            ↓
                       [11.最终定稿与投稿]
```

---

## Stage 0: 文献调研（广泛检索与筛选）

目标：建立领域全景图，获取关键文献池。

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 多源检索 | `nature-academic-search` | WF1 多源检索 | PubMed + CrossRef + arXiv 同步搜索 |
| 引用追踪 | `nature-academic-search` | WF5 引用管理 | 参考文献管理、格式转换 |
| 深度调研 | `deep-research` | `full` / `lit-review` | 系统性文献回顾，带注释书目 |
| 快速概览 | `deep-research` | `quick` | 30分钟快速简报，适合初步了解 |

**推荐路径**: `nature-academic-search` (建立文献池) → `deep-research lit-review` (筛选与注释)

**中文文献补充**: `nature-academic-search` 不支持 CNKI/万方。如需中文学术文献，使用 `web-access` skill 手动检索知网。

---

## Stage 1: 确定选题（从模糊兴趣到明确 RQ）

目标：将模糊研究方向转化为可操作的研究问题。

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 苏格拉底引导 | `deep-research` | `socratic` | 5层引导对话，从模糊想法到明确RQ |
| 研究架构设计 | `deep-research` | Phase 1 | FINER 标准评分 + 方法论蓝图 |
| 魔鬼代言人检验 | `deep-research` | Checkpoint 1 | RQ 清晰度、可行性、范围检验 |

**推荐路径**: `deep-research socratic` → RQ Brief → 确认研究问题

**关键交付物**: RQ Brief (含 FINER 评分、子问题、范围边界)

---

## Stage 2: 深入研读（理解关键文献）

目标：精读核心文献，建立深度领域知识。

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 双语精读 | `nature-reader` | 默认（全文） | 中英对照全文阅读，保留图表和源锚点 |
| 论文评估 | `deep-research` | `review` | 对单篇论文进行编辑+魔鬼代言人审查 |
| 事实核查 | `deep-research` | `fact-check` | 验证论文中的关键声明 |

**推荐路径**: `nature-reader` (全文精读 5-10 篇核心论文) → `deep-research review` (评估关键论文的可信度)

---

## Stage 3: 综述撰写（Literature Review）

目标：产出可发表或可作为论文一部分的文献综述。

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 系统综述 | `deep-research` | `systematic-review` | PRISMA 2020 完整流程 + Meta-Analysis |
| 文献回顾论文 | `academic-paper` | `lit-review` | 注释书目+综合叙事 |
| 常规综述草稿 | `deep-research` | `lit-review` | 文献回顾 + 综合报告 |
| 引用补充 | `nature-citation` | 默认 | 为综述段落补充 CNS/Nature 系列引用 |

**推荐路径**:
- 系统综述论文: `deep-research systematic-review`
- 论文中的文献回顾章节: `academic-paper lit-review` 或 `academic-paper outline-only` (仅大纲)

---

## Stage 4: 创新点设计（Gap Analysis → Innovation）

目标：从文献缺口出发，设计有意义的创新点。

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 综合分析与缺口 | `deep-research` | Phase 3 (Synthesis) | 跨源综合 → 知识缺口分析 |
| 苏格拉底推进 | `deep-research` | `socratic` (Layer 4-5) | 视角转换→意义追问 |
| 魔鬼代言人 | `deep-research` | Checkpoint 2-3 | 逻辑链路验证、反证搜索 |
| 结构化写作 | `nature-writing` | Intake + Abstract | 将创新点转化为可发表的核心声明 |

**推荐路径**: `deep-research full` (Phase 3 synthesis) → `deep-research socratic` (Layer 4-5) → `nature-writing` (将创新点写成结构化草稿)

**关键交付物**: Innovation Statement（一句话核心论点 + 证据链 + 边界）

---

## Stage 5: 实验/方法设计

目标：设计可检验创新点的实验方案。

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 方法蓝图 | `deep-research` | Phase 1 (Methodology) | 研究范式、方法选择、数据策略 |
| 预注册 | `deep-research` | templates | OSF 标准 21 项预注册模板 |
| 报告规范 | `deep-research` | references | EQUATOR 报告指南映射 |

**推荐路径**: `deep-research full` → Phase 1 Methodology Blueprint → 实验方案

---

## Stage 6: 数据分析与检验

目标：对实验/调查数据进行严谨统计分析。

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 统计测试选择 | `statistical-analysis` | 交互式 | 根据数据类型推荐检验方法 |
| 统计建模 | `statsmodels` | OLS/GLM/ARIMA | 回归分析、时间序列、计量模型 |
| 机器学习 | `scikit-learn` | 分类/回归/聚类 | 预测建模、特征重要性 |
| 生存分析 | `scikit-survival` | Cox/RSF/GBSA | 截尾数据、时间到事件分析 |
| 探索性分析 | `exploratory-data-analysis` | 自动检测 | 数据质量、分布、异常值 |

**推荐路径**: `exploratory-data-analysis` (初探) → `statistical-analysis` (选择检验) → `statsmodels` / `scikit-learn` (建模)

---

## Stage 6.5: 数据可视化与绘图

目标：将数据和实验结果转化为出版级图表。本阶段是 Stage 6（数据分析）→ Stage 7（论文撰写）的桥梁。

### 可视化 Skills 生态

| Skill | 定位 | 触发场景 |
|-------|------|---------|
| `exploratory-data-analysis` | 数据初探：格式检测、分布、异常值 | 拿到原始数据第一步 |
| `matplotlib` | 全定制 Python 绑图 | 需要极致控制或特殊图表 |
| `seaborn` | 统计绑图：热力图、箱线图、小提琴图 | 快速探索阶段 |
| `scientific-visualization` | 多面板期刊图：显著性标注、色盲友好 | 投稿前最终排版 |
| `academic-plotting` | ML论文图表自动生成：自动选类型+matplotlib/seaborn | ML会议论文图表 |
| `nature-figure` | Nature/顶会级图表：先定声明→再出图 | 高影响因子期刊核心图 |
| `canvas-design` | 概念图/设计图：设计哲学.md→单页PNG/PDF | 论文概念图、示意图 |

### 架构图与示意图

| 工具 | 说明 | 来源 |
|------|------|------|
| `figure_generation_prompts §1` | 论文架构图（方法框架/流程图） | awesome-ai-research-writing |
| `figure_generation_prompts §1 (EN)` | Nano Banana 优化版英文 prompt | 同上 |

### 图表推荐与标题

| 工具 | 说明 | 来源 |
|------|------|------|
| `figure_generation_prompts §2` | 根据实验数据推荐最佳图表类型 | 19 种标准学术图表库 |
| `figure_generation_prompts §3` | 中文描述→英文图标题 | 顶会格式规范 |
| `figure_generation_prompts §4` | 中文描述→英文表标题 | 顶会格式规范 |
| `figure_generation_prompts §5` | 实验数据→LaTeX 分析段落 | 数据→论文叙事 |

> `figure_generation_prompts` = `academic-agent/references/figure_generation_prompts.md`

### 推荐链

```
exploratory-data-analysis (数据初探)
    → seaborn/matplotlib (探索绑图)
    → nature-figure (正式出版图)
    → scientific-visualization (多面板排版)
    → figure_generation_prompts §3-4 (标题)
```

---

## Stage 7: 论文撰写（目标期刊导向）

目标：从研究结果到完整论文。

### 7a. 草稿撰写

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 全流程写作 | `academic-paper` | `full` | 12-agent 完整流水线 |
| 苏格拉底规划 | `academic-paper` | `plan` | 逐章引导规划 |
| ML 顶会论文 | `ml-paper-writing` | 默认 | NeurIPS/ICML/ICLR/ACL/AAAI/COLM 专用模板+booktabs+checklist |
| 系统顶会论文 | `systems-paper-writing` | 默认 | OSDI/SOSP/ASPLOS/NSDI/EuroSys 专用模板 |
| Nature 风格写作 | `nature-writing` | 按章节 | 从声明+证据出发的结构化写作 |
| 仅大纲 | `academic-paper` | `outline-only` | 详细大纲+证据映射 |
| 协作式写作 | `doc-coauthoring` | 三阶段 | 收集上下文→分节起草→读者测试 |

**选择逻辑**:
- 有完整研究结果，ML会议 → `ml-paper-writing`（含LaTeX模板+会议checklist）
- 有完整研究结果，系统会议 → `systems-paper-writing`（含段落级蓝图）
- 有完整研究结果，其他 → `academic-paper full` (一键全流程)
- 只有结果但不确定如何组织 → `nature-writing` (先写脚手架) → `academic-paper full`
- 只有模糊想法 → `academic-paper plan` (逐章引导)
- 需要交互式协作迭代 → `doc-coauthoring` (三阶段结构化协作)
- 目标 Nature/Science/Cell → `nature-writing` + `nature-polishing`

### 7b. 图表制作

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 数据初探 | `exploratory-data-analysis` | 自动 | 格式检测、质量指标、分布特征 |
| 探索绑图 | `seaborn` / `matplotlib` | 标准 | 热力图、箱线图、小提琴图、散点图 |
| ML论文自动绑图 | `academic-plotting` | 默认 | 自动选类型+matplotlib/seaborn生成 |
| 出版级图表 | `nature-figure` | Python/R | 先确定声明→证据链→再出图 |
| 多面板期刊图 | `scientific-visualization` | 多面板 | 显著性标注、色盲友好、期刊格式化 |
| 方法架构图 | `figure_generation_prompts §1` | — | 框架图、流程图、示意图 |
| 概念设计图 | `canvas-design` | 默认 | 设计哲学.md→单页PNG/PDF |
| 图表类型推荐 | `figure_generation_prompts §2` | — | 19 种标准学术图表库中推荐 |
| 图/表标题 | `figure_generation_prompts §3-4` | — | 中文描述→英文标题 |
| 论文配套PPT | `nature-paper2ppt` | 默认 | 中文 PPT 用于组会/答辩 |
| 会议演讲PPT | `presenting-conference-talks` | 默认 | Beamer PDF + PPTX + 演讲脚本 |

**推荐路径**: `exploratory-data-analysis` (初探) → `seaborn`/`matplotlib` (探索) → `nature-figure` (核心图表) → `scientific-visualization` (排版) → `figure_generation_prompts §3-4` (标题)

> `figure_generation_prompts` = `academic-agent/references/figure_generation_prompts.md`

### 7c. 引用完善

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| CNS 引用 | `nature-citation` | 默认 | 分段文本→CNS/Nature 系列引用映射 |
| 引用格式检查 | `academic-paper` | `citation-check` | 格式验证、DOI 核对 |

### 7d. 语言润色与精修

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 英文顶会润色 | `nature-polishing` / `polishing §2` | 英→英 | 句子级精修、顶会措辞 |
| 中文论文润色 | `polishing §1` | 中→中 | 口语化→正式学术中文 |
| 去AI味（英文） | `polishing §3` / `humanizer` | 英→英 | 消除AI写作痕迹 |
| 去AI味（中文） | `polishing §4` | 中→中 | 消除翻译腔和机器味 |
| 系统化去AI味 | `humanizer` | 默认 | Wikipedia 9维AI写作特征检测+修复 |
| 逻辑检查 | `polishing §5` | — | 终稿前一致性红线审查 |
| 翻译（中→英） | `polishing §7` | 中→英 | LaTeX/Word 学术翻译 |
| 缩写/扩写 | `polishing §6` | 英→英 | 微幅调整篇幅 |
| Nature 数据声明 | `nature-data` | 默认 | Nature-ready Data Availability 声明 |

> `polishing §N` = `academic-agent/references/polishing_prompts_library.md` 对应章节

**推荐最终路径 (Nature/CNS 目标)**:
```
nature-writing (结构草稿)
    → nature-figure (图表)
    → academic-paper full (完整论文+引用+双语摘要)
    → nature-polishing (语言精修)
    → nature-citation (CNS引用补充)
    → nature-data (数据声明)
    → academic-paper-reviewer (模拟审稿)
```

**推荐最终路径 (常规期刊)**:
```
academic-paper full (完整论文)
    → nature-figure (可选：图表)
    → nature-polishing (可选：语言润色)
    → academic-paper-reviewer (模拟审稿)
```

---

## Stage 8: 审稿修改

目标：拿到审稿意见（真实或模拟）后进行修改。

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| 模拟审稿 | `academic-paper-reviewer` | `full` | 5人审稿（EIC+3审稿人+魔鬼代言人） |
| 解析真实审稿 | `academic-paper` | `revision-coach` | 将审稿意见转为修订路线图 |
| 执行修改 | `academic-paper` | `revision` | 逐条修改+修订追踪 |
| 回复审稿 | `nature-response` | `draft` / `audit` | 逐点回复信+修改清单 |
| 验证修改 | `academic-paper-reviewer` | `re-review` | 验证修改是否解决审稿意见 |

**推荐路径**:
```
academic-paper-reviewer full (模拟审稿)
    → academic-paper revision (修改)
    → nature-response draft (回复信)
    → academic-paper-reviewer re-review (验证)
```

**处理真实审稿意见时**:
```
academic-paper revision-coach (解析审稿) 
    → academic-paper revision (修改)
    → nature-response draft (回复信)
```

---

## Stage 9: 最终定稿与投稿

| 步骤 | Skill | 模式 | 说明 |
|------|-------|------|------|
| AI 披露声明 | `academic-paper` | `disclosure` | 期刊特定 AI 使用声明 |
| 格式转换 | `academic-paper` | `format-convert` | LaTeX/DOCX/PDF 输出 |
| 引用格式转换 | `academic-paper` | `format-convert` | APA/Chicago/MLA/IEEE/Vancouver 互转 |

---

## 一键全流程: academic-pipeline

如果你不想手动协调各个 skill，使用 `academic-pipeline`:

```
academic-pipeline 自动编排:
  Stage 1: RESEARCH    → deep-research
  Stage 2: WRITE       → academic-paper
  Stage 2.5: INTEGRITY → 完整性验证
  Stage 3: REVIEW      → academic-paper-reviewer
  Stage 4: REVISE      → academic-paper revision
  Stage 3': RE-REVIEW  → academic-paper-reviewer re-review
  Stage 4.5: FINAL INTEGRITY → 最终验证
  Stage 5: FINALIZE    → academic-paper format-convert
  Stage 6: PROCESS SUMMARY → 过程记录
```

**Pipeline 覆盖的是 Stage 7-9（论文撰写→定稿）**。Stage 0-6（文献调研→数据分析）是 pipeline 的上游，使用本指南的独立 skill 组合。

完整链路:

```
Stage 0-3: 文献调研→选题→研读→综述
    (nature-academic-search / deep-research / nature-reader)
    ↓
Stage 4-6: 创新点→实验→数据分析
    (deep-research / nature-writing / statistical-analysis / scikit-learn)
    ↓
Stage 7-9: 论文撰写→审稿→定稿
    (academic-pipeline 一键编排)
```

---

## 场景速查表

| 你的情况 | 推荐入口 | 下一步 |
|----------|---------|--------|
| 完全从零开始，没有方向 | `deep-research socratic` | Stage 1 |
| 有大致方向，需要查文献 | `deep-research full` | Stage 0→1 |
| 已有文献池，需要写综述 | `academic-paper lit-review` | Stage 3 |
| 有研究结果，需要写论文 | `academic-pipeline` | Stage 7 |
| 有论文初稿，需要润色 | `nature-polishing` | Stage 7d |
| 有论文，需要模拟审稿 | `academic-paper-reviewer full` | Stage 8 |
| 收到真实审稿意见 | `academic-paper revision-coach` | Stage 8 |
| 需要做 PPT 组会汇报 | `nature-paper2ppt` | — |
| 目标 Nature/Science/Cell | `nature-writing` → 按 Stage 7 最终路径 | Stage 7 |
| 中文论文投稿（国内期刊） | `academic-paper full` (zh-CN body) | Stage 7 |
| 中文学术PPT | `nature-paper2ppt` (简体中文输出) | — |
| ML顶会投稿 (NeurIPS/ICML) | `ml-paper-writing` | Stage 7a |
| 系统顶会投稿 (OSDI/ASPLOS) | `systems-paper-writing` | Stage 7a |
| 会议演讲 (Beamer/PPTX) | `presenting-conference-talks` | Stage 7b |
| 论文概念图/示意图 | `canvas-design` | Stage 6.5 |
| ML论文图表自动生成 | `academic-plotting` | Stage 7b |
| 系统化去AI味 | `humanizer` | Stage 7d |
| 交互式协作写文档 | `doc-coauthoring` | Stage 7a |
