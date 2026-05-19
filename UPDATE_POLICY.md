# Update Policy — 更新安全策略

## 架构说明

```
.claude/skills/
├── academic-agent/              ← 本地独立目录（本目录），不归任何 git 仓库管理
│   ├── AGENT.md                 ← 独立 Agent 入口
│   ├── UPDATE_POLICY.md         ← 本文件
│   └── references/              ← 所有本地自定义文件
│       ├── skills_chain_guide.md
│       ├── polishing_prompts_library.md
│       └── figure_generation_prompts.md
│
├── academic-paper/              ← academic-research-skills 克隆（不再更新）
├── deep-research/               ← academic-research-skills 克隆（不再更新）
├── academic-paper-reviewer/     ← academic-research-skills 克隆（不再更新）
├── academic-pipeline/           ← academic-research-skills 克隆（不再更新）
│
├── nature-writing/              ← 可能接收上游更新
├── nature-polishing/            ← 可能接收上游更新
├── nature-figure/               ← 可能接收上游更新
├── nature-reader/               ← 可能接收上游更新
├── nature-citation/             ← 可能接收上游更新
├── nature-response/             ← 可能接收上游更新
├── nature-data/                 ← 可能接收上游更新
├── nature-paper2ppt/            ← 可能接收上游更新
└── nature-academic-search/      ← 可能接收上游更新
```

## 本地定制清单

以下文件位于 `academic-agent/`，不受任何 git 仓库影响：

| 文件 | 说明 |
|------|------|
| `AGENT.md` | 整合 13+ skills 的独立 Agent 定义 |
| `UPDATE_POLICY.md` | 本文件 |
| `references/skills_chain_guide.md` | 完整论文写作 skills 链 |
| `references/polishing_prompts_library.md` | 润色/去AI味/翻译/逻辑检查提示词库 |
| `references/figure_generation_prompts.md` | 架构图/图表推荐/标题生成提示词库 |

以下文件已内嵌到上游 skill 目录中（所属仓库不再更新，安全）：

| 文件 | 所在仓库 | 状态 |
|------|---------|------|
| `academic-paper/references/writing_quality_check.md` | academic-research-skills | 永不更新，安全 |
| `academic-paper/SKILL.md` | academic-research-skills | 永不更新，已修改 |
| `academic-pipeline/SKILL.md` | academic-research-skills | 永不更新，已修改 |
| `deep-research/SKILL.md` | academic-research-skills | 永不更新，已修改 |
| `academic-paper-reviewer/SKILL.md` | academic-research-skills | 永不更新，已修改 |

以下文件在上游 skill 目录中，**可能被更新覆盖**：

| 文件 | 所属仓库 | 风险 |
|------|---------|------|
| `nature-citation/SKILL.md` | nature-* repo | 低风险（仅新增了 MCP Tool Integration 小节） |
| `nature-figure/SKILL.md` | nature-* repo | 低风险（仅新增了 Chinese font config 小节） |

## 更新操作指南

### 更新 nature-* 系列 skill

```bash
cd ~/.claude/skills/nature-writing   # 以 nature-writing 为例
git pull origin main
```

更新后检查事项：
1. 确认 `academic-agent/AGENT.md` 中的路由表仍然正确
2. 确认 `academic-agent/references/skills_chain_guide.md` 中的 skill 名称和模式未变
3. 如有 API 变更，更新 AGENT.md 相应章节

### 恢复 nature-citation 或 nature-figure 的本地修改

如果 `git pull` 覆盖了本地修改（概率极低），从 git reflog 恢复：

```bash
cd ~/.claude/skills/nature-citation
git reflog                         # 找到 pull 前的 commit hash
git show <hash>:SKILL.md           # 查看旧版内容
git checkout <hash> -- SKILL.md    # 恢复文件
```

或在 pull 前先备份：

```bash
cp SKILL.md SKILL.md.backup
git pull origin main
# 如有冲突，从 SKILL.md.backup 手动合并修改
```

### 完全重建

由于所有核心文件都在 `academic-agent/`（本地独立目录），即使所有上游仓库删除重建：
1. `academic-agent/` 目录不受影响
2. 重新 `git clone` + 符号链接上游 skills
3. Agent 自动恢复工作

## 设计决策

1. **academic-agent/ 不归任何 git 仓库**：保证 100% 更新安全
2. **prompt 库放在 agent 内**：独立于上游 skill 更新周期
3. **上游 skill 仅做最小侵入修改**：nature-citation/nature-figure 仅在 SKILL.md 末尾追加内容，git merge 冲突概率极低
4. **不再更新的仓库内修改是安全的**：academic-paper/deep-research/reviewer/pipeline 的 SKILL.md 修改永久有效
