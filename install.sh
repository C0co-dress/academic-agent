#!/usr/bin/env bash
# Academic Agent — 一键安装脚本
# 将 skills/ 目录中的 13 个 skills 符号链接到 ~/.claude/skills/

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
TARGET_DIR="$HOME/.claude/skills"

# 颜色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info()  { echo -e "${GREEN}[INFO]${NC} $1"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

# 检查 skills 目录
if [ ! -d "$SKILLS_DIR" ]; then
    error "skills/ 目录不存在，请确保在 academic-agent 根目录下运行此脚本"
    exit 1
fi

# 创建目标目录
mkdir -p "$TARGET_DIR"

# 需要链接的 skills
SKILLS=(
    academic-paper
    academic-paper-reviewer
    academic-pipeline
    deep-research
    nature-academic-search
    nature-citation
    nature-data
    nature-figure
    nature-paper2ppt
    nature-polishing
    nature-reader
    nature-response
    nature-writing
    shared
)

installed=0
skipped=0

for skill in "${SKILLS[@]}"; do
    src="$SKILLS_DIR/$skill"
    dst="$TARGET_DIR/$skill"

    if [ ! -d "$src" ]; then
        warn "源目录不存在: $src"
        ((skipped++))
        continue
    fi

    if [ -L "$dst" ]; then
        # 已经是符号链接
        current_target="$(readlink "$dst")"
        if [ "$current_target" = "$src" ]; then
            info "已安装: $skill"
            ((skipped++))
            continue
        else
            warn "符号链接已存在但指向不同位置: $dst -> $current_target"
            read -p "是否覆盖? [y/N] " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                ln -sfn "$src" "$dst"
                info "已更新: $skill"
                ((installed++))
            else
                warn "跳过: $skill"
                ((skipped++))
            fi
        fi
    elif [ -d "$dst" ]; then
        # 目录已存在（不是符号链接）
        warn "目录已存在（非符号链接）: $dst"
        read -p "是否覆盖? [y/N] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "$dst"
            ln -s "$src" "$dst"
            info "已安装: $skill"
            ((installed++))
        else
            warn "跳过: $skill"
            ((skipped++))
        fi
    else
        ln -s "$src" "$dst"
        info "已安装: $skill"
        ((installed++))
    fi
done

echo ""
echo "========================================="
info "安装完成！"
info "已安装: $installed 个 skills"
info "跳过: $skipped 个 skills"
echo ""
info "使用方式：直接在 Claude Code 中输入自然语言需求即可"
info "例如：帮我写一篇关于AI的论文"
echo ""
info "可选 skills（需手动安装）："
echo "  - ml-paper-writing:      https://github.com/zechenzhangAGI/AI-research-SKILLs"
echo "  - systems-paper-writing: https://github.com/zechenzhangAGI/AI-research-SKILLs"
echo "  - academic-plotting:     https://github.com/zechenzhangAGI/AI-research-SKILLs"
echo "  - presenting-conference-talks: https://github.com/zechenzhangAGI/AI-research-SKILLs"
echo "  - humanizer:             https://github.com/blader/humanizer"
echo "  - doc-coauthoring:       https://github.com/anthropics/skills"
echo "  - canvas-design:         https://github.com/anthropics/skills"
echo "========================================="
