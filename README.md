# Academic Agent — 学术论文写作全流程助手

组合整理了自己觉得好用的大佬们的论文写作类 skills，自己自用。

## 项目说明

本项目整合了 20+ 个学术论文写作相关的 Claude Code Skills，覆盖从文献调研到最终投稿的完整论文生命周期。所有 skills 来自以下开源项目，感恩大佬们的贡献：

| 上游仓库 | 作者 | 包含 Skills |
|---------|------|------------|
| [academic-research-skills](https://github.com/Imbad0202/academic-research-skills) | Imbad0202 | academic-paper, deep-research, academic-paper-reviewer, academic-pipeline |
| [nature-skills](https://github.com/Yuan1z0825/nature-skills) | Yuan1z0825 | nature-writing, nature-polishing, nature-figure, nature-reader, nature-citation, nature-response, nature-data, nature-paper2ppt, nature-academic-search |
| [AI-research-SKILLs](https://github.com/zechenzhangAGI/AI-research-SKILLs) | zechenzhangAGI | ml-paper-writing, academic-plotting, presenting-conference-talks, systems-paper-writing |
| [humanizer](https://github.com/blader/humanizer) | blader | humanizer |
| [skills](https://github.com/anthropics/skills) | Anthropic | doc-coauthoring, canvas-design |
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
├── AGENT.md                          # 整合 20+ skills 的独立 Agent 定义
├── README.md                         # 本文件
├── UPDATE_POLICY.md                  # 更新安全策略
├── install.sh                        # 一键部署脚本（符号链接到 ~/.claude/skills/）
├── references/                       # 自定义提示词库
│   ├── skills_chain_guide.md         # 完整论文写作 skills 链
│   ├── polishing_prompts_library.md  # 润色/去AI味/翻译 提示词
│   └── figure_generation_prompts.md  # 架构图/图表推荐/标题 提示词
└── skills/                           # 20 个下游 skills（直接打包，无子模块）
    ├── nature-*/                     # 9 nature skills
    ├── academic-paper/               # 12-agent 通用论文写作
    ├── deep-research/                # 13-agent 深度研究
    ├── academic-paper-reviewer/      # 5人模拟审稿
    ├── academic-pipeline/            # 10-stage 全流程编排
    ├── ml-paper-writing/             # ML 顶会论文写作
    ├── systems-paper-writing/        # 系统顶会论文写作
    ├── academic-plotting/            # ML 论文图表自动生成
    ├── presenting-conference-talks/  # 会议演讲 PPT
    ├── humanizer/                    # Wikipedia 去 AI 味
    ├── doc-coauthoring/              # 三阶段协作写文档
    └── canvas-design/                # 概念图/设计图生成
```

## 能力概览

| 阶段 | Skills | 输入 → 输出 |
|------|--------|------------|
| 文献调研 | nature-academic-search, deep-research | 关键词 → 文献池+注释 |
| 论文精读 | nature-reader | PDF/DOI → 中英对照全文 |
| 选题引导 | deep-research socratic | 模糊想法 → 明确研究问题 |
| 综述撰写 | deep-research systematic-review | 文献池 → PRISMA 综述 |
| ML论文写作 | ml-paper-writing | repo/结果 → NeurIPS/ICML/ICLR 论文 |
| 系统论文写作 | systems-paper-writing | repo/结果 → OSDI/SOSP/ASPLOS 论文 |
| 通用论文写作 | academic-paper full | 研究结果 → 完整论文 |
| 图表制作 | nature-figure, academic-plotting, canvas-design | 数据/描述 → 出版级图表 |
| 语言润色 | nature-polishing, polishing_prompts_library | 草稿 → 顶会级英文/中文 |
| 去AI味 | humanizer, polishing_prompts §3/§4 | AI文本 → 自然人写作 |
| 模拟审稿 | academic-paper-reviewer | 论文 → 5人审稿+修改路线图 |
| 回复审稿 | nature-response | 审稿意见 → 逐点回复信 |
| 公开演讲 | presenting-conference-talks | 论文 → Beamer PDF + PPTX |
| 全流程编排 | academic-pipeline | 起点材料 → 最终定稿 |

## 更新上游 Skills

下游 skills 以本地副本方式管理。更新方法：

```bash
# 重新克隆上游仓库
cd /tmp && git clone --depth 1 https://github.com/Yuan1z0825/nature-skills.git
# 将更新的 skills/ 目录覆盖到本项目
cp -r nature-skills/skills/* ~/.claude/skills/academic-agent/skills/
# 提交更新
cd ~/.claude/skills/academic-agent
git add skills/ && git commit -m "chore: update nature-skills" && git push
```

## 本地定制说明

- `AGENT.md`、`references/`、`README.md`、`install.sh` 为本地定制文件，保留在项目根目录
- 所有下游 skills 直接打包在 `skills/` 目录中
- `academic-paper/`、`deep-research/`、`academic-paper-reviewer/`、`academic-pipeline/` 已做简体中文化，不再跟随上游更新

## License

本项目整合了多个开源项目的 skills，各子模块遵循其原始许可证。自定义文件（AGENT.md, references/）遵循 MIT License。
