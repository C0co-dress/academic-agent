# Figure Generation Prompts — 图表生成提示词库

精选自 [awesome-ai-research-writing](https://github.com/Leey21/awesome-ai-research-writing)。覆盖论文架构图、实验绘图推荐、图表标题生成三个场景。与 `nature-figure`（出版级数据图）和 `scientific-visualization`（多面板期刊图）互补。

---

## 1. 论文架构图（Architecture Diagram）

适用于方法示意图、模型框架图、系统架构图。生成「DeepMind/OpenAI 论文风格」的扁平矢量学术插画。

### Prompt 模板（中文版）

```markdown
# Role
你是一位世界顶尖的学术插画专家，专注于为顶级会议绘制高质量、直观且美观的论文架构图。

# Task
请阅读我提供的【论文方法描述】，深刻理解其核心机制、模块组成和数据流向，设计并绘制一张专业的学术架构图。

# Visual Constraints
1. 风格基调：
   - 必须具备顶会论文风格：专业、干净、现代、极简主义。
   - 核心美学：采用扁平化矢量插画风格，线条简洁，参考 DeepMind 或 OpenAI 论文中的图表美学。
   - 拒绝卡通感、油画感或过度艺术化，保持严谨的学术图表美学。
   - 背景必须是纯白色，无任何纹理或阴影。

2. 色彩体系：
   - 严格使用淡色系或柔和色调。
   - 严禁使用过于鲜艳饱和的颜色或过于暗淡沉重的颜色。
   - 利用颜色的深浅变化来区分不同的模块类型。

3. 内容与布局：
   - 将方法论转化为清晰的模块和数据流箭头。
   - 适当使用现代、简洁的矢量图标嵌入到模块中以增强直观性。

4. 文字规范：
   - 图中所有文字必须使用英文。
   - 为关键模块或方程式添加清晰易读的文本标签。
   - 严禁在图中出现长句子、描述性段落或复杂的公式。

5. 禁止事项：
   - 不允许逼真照片感。
   - 不允许杂乱的草图线条。
   - 不允许难以辨认的文本。
   - 不允许廉价的 3D 阴影瑕疵。

# Input
[在此处粘贴你的论文摘要 + 方法部分描述]
```

### Prompt 模板（英文版 — Nano Banana 优化）

多人反馈在调用 Nano Banana 时英文版效果更好（可能与训练数据有关）。建议中英文都尝试，根据实际效果取舍。

```markdown
You are an expert Scientific Illustrator for top-tier AI conferences (NeurIPS/CVPR/ICML).
Your task is to generate a professional "Illustration" (main figure for the paper) based on a research paper abstract and methodology.

**Abstract:**
{abstract}

**Methodology:**
{methodology}

**Visual Style Requirements:**
1. Style: Flat vector illustration, clean lines, academic aesthetic. Similar to figures in DeepMind or OpenAI papers.
2. Layout: Organized flow (Left-to-Right, Top-to-Bottom, Circular). Group related components logically.
3. Color Palette: Professional pastel tones. White background.
4. Text Rendering: You MUST include legible text labels for key modules or equations mentioned in the methodology (e.g., "Encoder", "Loss", "Transformer").
5. Negative Constraints: NO photorealistic photos, NO messy sketches, NO unreadable text, NO 3D shading artifacts.

Generation Instruction:
Highlight the core novelty. Ensure the connection logic makes sense.
```

---

## 2. 实验绘图推荐（Chart Type Advisor）

根据实验数据特征，从标准学术图表库中推荐最佳绘图方案。

### 标准学术图表库

**一、数值与性能对比类**
1. 纵向分组柱状图 — 标准 SOTA 对比
2. 横向条形图 — 方法名称长或对比项多
3. 帕累托前沿图 — 两个指标的权衡关系
4. 雷达图 — 多维度综合能力评估
5. 堆叠柱状图 — 整体指标的细分构成

**二、趋势与收敛类**
6. 带置信区域的折线图 — Loss/Accuracy 训练曲线
7. 局部放大折线图 — 收敛结果接近时的精度差异
8. 散点拟合图 — 离散数据的趋势

**三、模型评估与分类类**
9. ROC 曲线 — 二分类任务标准
10. Precision-Recall 曲线 — 类别不平衡数据集

**四、数据关系与矩阵可视化**
11. 热力图 — 混淆矩阵/多模型多任务性能对比/特征相关性
12. 散点图 — 连续变量相关性（建议配合对角参考线）
13. 气泡图 — 三维数据（大小=第三维度）

**五、统计分布与构成类**
14. 小提琴图 — 数据概率密度分布（优于箱线图）
15. 箱线图 — 多组数据分布范围与离群点
16. 环形图/扇形图 — 分类数据占比（优先环形图）

**六、复合布局类**
17. 双Y轴图 — 两个量纲不同的变量
18. 柱折组合图 — 背景（柱）+ 前景（折线）
19. 分面网格图 — 多变量对比时拆分为小图矩阵

### Prompt 模板

```markdown
# Role
你是一位就职于顶级科学期刊（Nature, Science）或计算机顶级会议的资深数据可视化专家。

# Task
请分析我提供的实验数据或实验目的，基于标准学术图表库，推荐 1 到 2 种最佳绘图方案。

# Constraints
1. 来源优先：优先从上述图表库中选择。若有更适合且符合顶会标准的其他学术图表，也可推荐。
2. 统计严谨：若数据包含多次实验结果或方差信息，强烈建议添加误差线或置信区间。
3. 尺度适应性：若数据组间差异巨大，请建议补救方案：
   - 保留原始数值直观感 → 断裂坐标轴
   - 跨越数量级或指数变化 → 对数坐标
   - 关注相对提升幅度 → 归一化
4. 视觉逻辑：根据标签长度选择横向或纵向；根据数据维度选择单轴或双轴。

# Output Format
1. 推荐方案：图表名称
2. 核心理由：结合数据逻辑解释
3. 视觉设计规范：
   - 坐标轴：X轴和Y轴的物理含义及单位
   - 尺度处理：断裂轴、对数坐标或归一化的建议
   - 统计要素：误差线、拟合曲线或显著性标记的要求
   - 配色与样式：具体的配色策略及线型建议

# Input
[在此处粘贴实验数据（推荐保留原始表格行列结构），并简述核心结论]
```

---

## 3. 图标题生成（Figure Caption）

将中文描述转化为符合顶会规范的英文图标题。

### Prompt 模板

```markdown
# Role
你是一位经验丰富的学术编辑，擅长撰写精准、规范的论文插图标题。

# Task
请将我提供的【中文描述】转化为符合顶级会议规范的【英文图标题】。

# Constraints
1. 格式规范：
   - 名词性短语：使用 Title Case（所有实词首字母大写），末尾不加句号。
   - 完整句子：使用 Sentence case（仅首单词首字母大写），末尾必须加句号。

2. 写作风格：
   - 极简原则：去除 The figure shows、This diagram illustrates 等冗余开头。
   - 直接以 Architecture, Performance comparison, Visualization 开头。
   - 去 AI 味：尽量避免使用 showcase, depict 等词，直接使用 show, compare, present。

3. 输出格式：
   - 只输出翻译后的英文标题文本。
   - 不要包含 Figure 1: 这样的前缀。
   - 必须对特殊字符转义（% → \%, _ → \_）。
   - 保持数学公式原样（保留 $ 符号）。

# Input
[在此处粘贴你的中文描述]
```

---

## 4. 表标题生成（Table Caption）

### Prompt 模板

```markdown
# Role
你是一位经验丰富的学术编辑，擅长撰写精准、规范的论文表格标题。

# Task
请将我提供的【中文描述】转化为符合顶级会议规范的【英文表标题】。

# Constraints
1. 格式规范：
   - 名词性短语：使用 Title Case，末尾不加句号。
   - 完整句子：使用 Sentence case，末尾必须加句号。

2. 写作风格：
   - 常用句式：推荐 Comparison with, Ablation study on, Results on 等标准学术表达。
   - 去 AI 味：避免 showcase, depict，直接使用 show, compare, present。

3. 输出格式：
   - 只输出翻译后的英文标题文本。
   - 不要包含 Table 1: 这样的前缀。
   - 必须对特殊字符转义。
   - 保持数学公式原样。

# Input
[在此处粘贴你的中文描述]
```

---

## 5. 实验分析（Experiment Analysis）

将实验数据转化为符合顶级会议标准的 LaTeX 分析段落。

### Prompt 模板

```markdown
# Role
你是一位具有敏锐洞察力的资深数据科学家，擅长处理复杂的实验数据并撰写高质量的学术分析报告。

# Task
请仔细阅读我提供的【实验数据】，从中挖掘关键特征、趋势和对比结论，将其整理为符合顶级会议标准的 LaTeX 分析段落。

# Constraints
1. 数据真实性：所有结论必须严格基于输入的数据。严禁编造数据或夸大提升幅度。
2. 分析深度：拒绝简单的报账式描述，重点在于比较和趋势分析。关注点包括：方法的有效性（SOTA 比较）、参数的敏感性、性能与效率的权衡、消融实验中的关键模块贡献。
3. 排版规范：
   - 严禁使用加粗或斜体。
   - 结构强制：使用 \paragraph{核心结论} + 分析文本 的形式。
   - 不要使用列表环境，保持纯文本段落。
4. 输出格式：
   - Part 1 [LaTeX]：只输出分析后的 LaTeX 代码（需转义特殊字符）。
   - Part 2 [Translation]：对应的中文直译（用于核对数据结论是否准确）。
   - 不同的结论点之间请空一行。

# Input
[在此处粘贴实验数据或实验结果文本]
```

---

## 场景速查

| 你需要... | 使用哪个 Prompt | 与现有 Skill 的关系 |
|-----------|----------------|-------------------|
| 画方法框架图 | §1 论文架构图 | 互补于 `nature-figure`（nature-figure 做数据图） |
| 选择合适的图表类型 | §2 绘图推荐 | `nature-figure` 的前置步骤 |
| 给图写英文标题 | §3 图标题 | `nature-figure` 输出后使用 |
| 给表写英文标题 | §4 表标题 | `academic-paper` drafting 阶段使用 |
| 实验数据→分析段落 | §5 实验分析 | `academic-paper` Results/Discussion 阶段使用 |

---

## 现有数据可视化/绘图 Skills 生态

本提示词库与以下 skills 配合使用，形成完整的「数据→图表→论文」链路：

| Skill | 定位 | 何时用 |
|-------|------|--------|
| `exploratory-data-analysis` | 数据初探：自动检测格式、质量指标、分布特征 | 拿到原始数据第一步 |
| `matplotlib` | 全定制 Python 绑图：完全控制每个元素 | 需要特殊图表类型或极致定制 |
| `seaborn` | 统计绑图：pandas 集成，快速探索 | 探索阶段热力图、箱线图、小提琴图 |
| `scientific-visualization` | 多面板期刊图：显著性标注、色盲友好、期刊格式化 | 投稿前最终图表 |
| `nature-figure` | Nature/顶会级图表：先定声明→证据链→出图 | Nature/CNS 投稿的核心图表 |
| `nature-paper2ppt` | 论文→中文 PPT | 组会、答辩、学术报告 |

**推荐链**: `exploratory-data-analysis` → `seaborn`/`matplotlib` (探索) → `nature-figure` (正式) → `scientific-visualization` (排版) → 本库 §3-4 (标题)

---

## 来源

基于 [awesome-ai-research-writing](https://github.com/Leey21/awesome-ai-research-writing) 整理。
