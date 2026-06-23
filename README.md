# Academic Agent — 学术论文写作全流程助手

组合整理了自己觉得好用的大佬们的论文写作+数据分析+建模 skills，自用。

## 项目说明

v2.0.0 整合了 50 个学术相关 skills，覆盖从文献调研→数据分析→建模→写作→图表→投稿的完整生命周期。所有 skills 来自以下开源项目：

| 上游仓库 | 作者 | 包含 Skills |
|---------|------|------------|
| [academic-research-skills](https://github.com/Imbad0202/academic-research-skills) | Imbad0202 | academic-paper, deep-research, academic-paper-reviewer, academic-pipeline |
| [nature-skills](https://github.com/Yuan1z0825/nature-skills) | Yuan1z0825 | nature-writing, nature-polishing, nature-figure, nature-reader, nature-citation, nature-response, nature-data, nature-paper2ppt, nature-academic-search |
| [AI-research-SKILLs](https://github.com/zechenzhangAGI/AI-research-SKILLs) | zechenzhangAGI | ml-paper-writing, academic-plotting, presenting-conference-talks, systems-paper-writing |
| [scientific-agent-skills](https://github.com/K-Dense-AI/scientific-agent-skills) | K-Dense-AI | scikit-learn, pytorch-lightning, transformers, torch-geometric, stable-baselines3, pufferlib, pymc, pymoo, seaborn, matplotlib, statsmodels, statistical-analysis, scikit-survival, aeon, timesfm-forecasting, umap-learn, networkx, polars, dask, vaex, shap, scientific-visualization, exploratory-data-analysis, geomaster, geopandas, markdown-mermaid-writing, infographics |
| [humanizer](https://github.com/blader/humanizer) | blader | humanizer |
| [skills](https://github.com/anthropics/skills) | Anthropic | doc-coauthoring, canvas-design |
| [guizang-ppt-skill](https://github.com/op7418/guizang-ppt-skill) | op7418 | guizang-ppt-skill |
| [frontend-slides-editable](https://github.com/archlizheng/frontend-slides-editable) | archlizheng | frontend-slides-editable |
| [harness-anything](https://github.com/yb2460/harness-anything) | yb2460 | harness-anything (WPS/Illustrator/Photoshop) |
| [awesome-ai-research-writing](https://github.com/Leey21/awesome-ai-research-writing) | Leey21 | 提示词库（已整合为 references/ 下的 prompt libraries） |

## 快速开始

```bash
# 1. 克隆本项目
git clone https://github.com/C0co-dress/academic-agent.git
cd academic-agent

# 2. 运行安装脚本（创建符号链接到 Claude Code skills 目录）
bash install.sh

# 3. 重启 Claude Code，Agent 自动生效
```

## 项目结构

```
academic-agent/
├── AGENT.md                          # 整合 50 skills 的独立 Agent 路由编排
├── README.md                         # 本文件
├── UPDATE_POLICY.md                  # 更新安全策略
├── install.sh                        # 一键部署脚本
├── references/                       # 自定义提示词库
│   ├── skills_chain_guide.md         # 11 阶段完整 skills 链
│   ├── polishing_prompts_library.md  # 润色/去AI味/翻译 提示词
│   └── figure_generation_prompts.md  # 架构图/图表推荐/标题 提示词
└── skills/                           # 50 个下游 skills

 核心学术 (20):                      图表可视化 (8):
 ├── academic-paper                   ├── matplotlib
 ├── deep-research                    ├── seaborn
 ├── academic-paper-reviewer          ├── scientific-visualization
 ├── academic-pipeline                ├── nature-figure
 ├── nature-academic-search           ├── canvas-design
 ├── nature-citation                  ├── infographics
 ├── nature-data                      ├── markdown-mermaid-writing
 ├── nature-figure                    ├── guizang-ppt-skill
 ├── nature-paper2ppt                 └── frontend-slides-editable
 ├── nature-polishing
 ├── nature-reader                    数据分析 (7):
 ├── nature-response                  ├── scikit-learn
 ├── nature-writing                   ├── statistical-analysis
 ├── ml-paper-writing                 ├── statsmodels
 ├── systems-paper-writing            ├── exploratory-data-analysis
 ├── academic-plotting                ├── pymc
 ├── presenting-conference-talks      ├── scikit-survival
 ├── humanizer                        └── shap
 ├── doc-coauthoring
 ├── canvas-design                    大数据 (3):
 └── harness-anything                 ├── dask
                                      ├── polars
 ML/DL (8):                           └── vaex
 ├── pytorch-lightning
 ├── transformers                     网络地理 (3):
 ├── torch-geometric                  ├── networkx
 ├── stable-baselines3                ├── geomaster
 ├── pufferlib                        └── geopandas
 ├── aeon
 ├── timesfm-forecasting              优化 (1):
 └── umap-learn                       └── pymoo
```

## 能力概览

| 阶段 | Skills | 输入 → 输出 |
|------|--------|------------|
| 文献调研 | nature-academic-search, deep-research, web-access | 关键词 → 文献池+注释 |
| 论文精读 | nature-reader | PDF/DOI → 中英对照全文 |
| 选题引导 | deep-research socratic | 模糊想法 → 明确研究问题 |
| 综述撰写 | deep-research systematic-review | 文献池 → PRISMA 综述 |
| 数据分析 | exploratory-data-analysis, statistical-analysis, statsmodels | 原始数据 → 统计报告 |
| 高级建模 | pymc, scikit-survival, aeon, timesfm-forecasting, shap, umap-learn | 数据 → 贝叶斯/生存/时序/可解释性分析 |
| 网络与地理 | networkx, torch-geometric, geomaster, geopandas | 关系/空间数据 → 图分析/GIS |
| 大数据处理 | dask, polars, vaex | 超内存数据 → 清洗后 DataFrame |
| ML/DL训练 | scikit-learn, pytorch-lightning, transformers, stable-baselines3 | 数据 → 模型+训练 |
| 优化 | pymoo | 多目标 → Pareto 前沿 |
| 论文写作 | academic-paper full, nature-writing, ml-paper-writing, systems-paper-writing | 研究结果 → 完整论文 |
| 图表制作 | nature-figure, academic-plotting, scientific-visualization, canvas-design, infographics | 数据/描述 → 出版级图表 |
| 流程图 | markdown-mermaid-writing | 文本 → 24种图表类型 |
| 语言润色 | nature-polishing, polishing_prompts_library | 草稿 → 顶会级英文/中文 |
| 去AI味 | humanizer, polishing_prompts §3/§4 | AI文本 → 自然人写作 |
| 模拟审稿 | academic-paper-reviewer | 论文 → 5人审稿+修改路线图 |
| 回复审稿 | nature-response | 审稿意见 → 逐点回复信 |
| 演讲PPT | presenting-conference-talks, nature-paper2ppt, guizang-ppt-skill | 论文 → Beamer/PPTX/网页PPT |
| WPS操控 | harness-anything | 命令行 → 桌面Office自动化 |
| 全流程编排 | academic-pipeline | 起点材料 → 最终定稿 |

## 版本历史

| 版本 | 日期 | 变更 |
|------|------|------|
| v2.0.0 | 2026-06-24 | 新增 30 个 skills（scientific-agent-skills + guizang-ppt + harness-anything 等），覆盖数据分析/建模/ML/DL/地理空间全方法论 |
| v1.0.0 | 2026-05-19 | 初始版本，整合 20 个学术写作核心 skills |

## 本地定制说明

- `AGENT.md`、`references/`、`README.md`、`install.sh` 为本地定制文件
- 自制 skills（academic-agent）维护在 `skills/` 顶层目录
- `academic-paper/`、`deep-research/`、`academic-paper-reviewer/`、`academic-pipeline/` 已做简体中文化

## License

本项目整合了多个开源项目的 skills，各子模块遵循其原始许可证。自定义文件（AGENT.md, references/）遵循 MIT License。
