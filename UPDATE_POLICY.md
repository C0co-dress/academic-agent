# Update Policy — 更新安全策略

## 架构说明

```
academic-agent/                    ← 自包含仓库（克隆即用）
├── AGENT.md                       ← Agent 主定义
├── SKILL.md                       ← Skill 定义
├── README.md                      ← 安装与使用指南
├── install.sh                     ← 一键安装脚本
├── UPDATE_POLICY.md               ← 本文件
├── references/                    ← 提示词库
│   ├── skills_chain_guide.md
│   ├── polishing_prompts_library.md
│   └── figure_generation_prompts.md
└── skills/                        ← 13 个下游 skills（自包含）
    ├── academic-paper/
    ├── academic-paper-reviewer/
    ├── academic-pipeline/
    ├── deep-research/
    ├── nature-academic-search/
    ├── nature-citation/
    ├── nature-data/
    ├── nature-figure/
    ├── nature-paper2ppt/
    ├── nature-polishing/
    ├── nature-reader/
    ├── nature-response/
    ├── nature-writing/
    └── shared/

安装后（通过 install.sh）：
~/.claude/skills/
├── academic-agent/                ← 本仓库（符号链接或复制）
├── academic-paper/                ← 符号链接 → academic-agent/skills/academic-paper
├── deep-research/                 ← 符号链接 → academic-agent/skills/deep-research
├── academic-paper-reviewer/       ← 符号链接 → academic-agent/skills/academic-paper-reviewer
├── academic-pipeline/             ← 符号链接 → academic-agent/skills/academic-pipeline
├── nature-writing/                ← 符号链接 → academic-agent/skills/nature-writing
├── nature-polishing/              ← 符号链接 → academic-agent/skills/nature-polishing
├── nature-figure/                 ← 符号链接 → academic-agent/skills/nature-figure
├── nature-reader/                 ← 符号链接 → academic-agent/skills/nature-reader
├── nature-citation/               ← 符号链接 → academic-agent/skills/nature-citation
├── nature-response/               ← 符号链接 → academic-agent/skills/nature-response
├── nature-data/                   ← 符号链接 → academic-agent/skills/nature-data
├── nature-paper2ppt/              ← 符号链接 → academic-agent/skills/nature-paper2ppt
├── nature-academic-search/        ← 符号链接 → academic-agent/skills/nature-academic-search
└── shared/                        ← 符号链接 → academic-agent/skills/shared
```

## 文件清单

### 核心文件（本仓库）

| 文件 | 说明 |
|------|------|
| `AGENT.md` | 整合 13 skills 的独立 Agent 定义（详细版） |
| `SKILL.md` | Skill 定义（标准 Claude Code 格式） |
| `README.md` | 安装与使用指南 |
| `install.sh` | 一键安装脚本 |
| `UPDATE_POLICY.md` | 本文件 |
| `references/skills_chain_guide.md` | 完整论文写作 skills 链 |
| `references/polishing_prompts_library.md` | 润色/去AI味/翻译/逻辑检查提示词库 |
| `references/figure_generation_prompts.md` | 架构图/图表推荐/标题生成提示词库 |

### 下游 Skills（已包含在 skills/ 目录中）

| 目录 | 说明 |
|------|------|
| `skills/academic-paper/` | 论文写作（12-agent pipeline） |
| `skills/academic-paper-reviewer/` | 模拟审稿（5人独立审稿） |
| `skills/academic-pipeline/` | 全流程编排 |
| `skills/deep-research/` | 深度研究（7种模式） |
| `skills/nature-academic-search/` | 多源文献检索 |
| `skills/nature-citation/` | CNS引用管理 |
| `skills/nature-data/` | FAIR数据声明 |
| `skills/nature-figure/` | 出版级图表 |
| `skills/nature-paper2ppt/` | 论文PPT |
| `skills/nature-polishing/` | Nature风格润色 |
| `skills/nature-reader/` | 论文精读 |
| `skills/nature-response/` | 回复审稿 |
| `skills/nature-writing/` | Nature风格写作 |
| `skills/shared/` | 共享资源 |

## 更新操作指南

### 更新整个项目

```bash
cd academic-agent
git pull origin main
bash install.sh  # 重新创建符号链接
```

### 更新单个 skill

由于 skills 已包含在仓库中，更新需要修改 `skills/` 目录下的文件：

```bash
cd academic-agent
# 编辑 skills/nature-writing/SKILL.md 等文件
git add skills/
git commit -m "update: nature-writing skill"
```

### 从上游同步更新

如果需要从上游仓库同步最新版本：

```bash
# 以 nature-writing 为例
cd /tmp
git clone https://github.com/anthropics/nature-skills.git
cp -r nature-skills/skills/nature-writing/* ~/academic-agent/skills/nature-writing/
cd ~/academic-agent
git diff skills/nature-writing/
git add skills/nature-writing/
git commit -m "sync: nature-writing from upstream"
```

### 完全重建

```bash
cd academic-agent
git pull origin main
bash install.sh
```

## 设计决策

1. **自包含仓库**：所有 skills 包含在一个仓库中，克隆即用
2. **符号链接安装**：install.sh 创建符号链接到 ~/.claude/skills/，保持更新同步
3. **prompt 库放在 references/ 目录**：与 skills 分离，便于维护
4. **可选 skills 标记**：7 个可选 skills 在 AGENT.md 中用 ⚠️可选 标记
5. **中文支持完善**：添加了中文润色、去AI味、逻辑检查等提示词库
