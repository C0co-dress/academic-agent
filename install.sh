#!/usr/bin/env bash
# Academic Agent — 一键部署脚本
# 将所有 skills 通过符号链接部署到 Claude Code skills 目录

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="${CLAUDESKILLS:-$HOME/.claude/skills}"

echo "╔══════════════════════════════════════╗"
echo "║   Academic Agent — Skills 部署      ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "源目录: $SCRIPT_DIR"
echo "目标目录: $SKILLS_DIR"
echo ""

# 确认
read -rp "→ 是否继续部署？(y/N) " CONFIRM
if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "已取消。"
    exit 0
fi

echo ""

# 创建 skills 目录
mkdir -p "$SKILLS_DIR"

# 辅助函数：创建符号链接
link_skill() {
    local name="$1"
    local src="$SCRIPT_DIR/skills/$name"

    if [ ! -d "$src" ]; then
        echo "  ⚠ SKIP $name（源目录不存在: $src）"
        return
    fi

    local dest="$SKILLS_DIR/$name"
    if [ -L "$dest" ] || [ -d "$dest" ]; then
        echo "  ✓ EXISTS $name"
    else
        ln -s "$src" "$dest"
        echo "  + LINKED $name"
    fi
}

echo "创建符号链接..."

# --- Academic Agent 自身 ---
if [ -L "$SKILLS_DIR/academic-agent" ] || [ -d "$SKILLS_DIR/academic-agent" ]; then
    echo "  ✓ EXISTS academic-agent"
else
    ln -s "$SCRIPT_DIR" "$SKILLS_DIR/academic-agent"
    echo "  + LINKED academic-agent"
fi

# --- 20 个 skills ---
SKILLS=(
    # nature-skills
    nature-writing nature-polishing nature-figure nature-reader
    nature-citation nature-response nature-data nature-paper2ppt
    nature-academic-search
    # academic-research-skills
    academic-paper deep-research academic-paper-reviewer academic-pipeline
    # AI-research-SKILLs (20-ml-paper-writing)
    ml-paper-writing academic-plotting presenting-conference-talks systems-paper-writing
    # humanizer
    humanizer
    # anthropic-skills
    doc-coauthoring canvas-design
)

COUNT=0
for skill in "${SKILLS[@]}"; do
    link_skill "$skill"
    ((COUNT++))
done

echo ""
echo "══════════════════════════════════════"
echo "  部署完成！共处理 $COUNT 个 skills"
echo "  重启 Claude Code 即可使用。"
echo "══════════════════════════════════════"
