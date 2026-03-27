#!/usr/bin/env python3
"""
Generate portfolio visualization figures for the AI Automation Learning Roadmap.

Outputs:
    docs/images/learning_roadmap.png   -- Gantt-style timeline of 6 phases across 18 weeks
    docs/images/skills_radar.png       -- Radar/spider chart of skill areas
    docs/images/project_connections.png -- Network diagram of project relationships
    docs/images/tech_stack.png         -- Horizontal grouped bar chart of technologies

Usage:
    python scripts/generate_figures.py
"""

import os
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.patches import FancyBboxPatch
from pathlib import Path

# ---------------------------------------------------------------------------
# Global style: dark theme
# ---------------------------------------------------------------------------
plt.rcParams.update({
    "figure.facecolor": "#1a1a2e",
    "axes.facecolor": "#16213e",
    "axes.edgecolor": "#e0e0e0",
    "axes.labelcolor": "#e0e0e0",
    "text.color": "#e0e0e0",
    "xtick.color": "#c0c0c0",
    "ytick.color": "#c0c0c0",
    "grid.color": "#2a2a4a",
    "grid.alpha": 0.5,
    "font.family": "sans-serif",
    "font.size": 11,
})

# Phase colors
COLORS = {
    1: "#4f7cac",  # Phase 1 - LLM Foundations (steel blue)
    2: "#5a9e8f",  # Phase 2 - RAG Pipelines (teal)
    3: "#9b6b9e",  # Phase 3 - Evaluation (purple)
    4: "#c47e3a",  # Phase 4 - Agentic (orange)
    5: "#b85450",  # Phase 5 - LLMOps (red)
    6: "#4a7c59",  # Phase 6 - Portfolio (green)
}

OUT_DIR = Path(__file__).resolve().parent.parent / "docs" / "images"
OUT_DIR.mkdir(parents=True, exist_ok=True)


# ===== 1. Learning Roadmap (Gantt Timeline) ================================
def generate_learning_roadmap():
    phases = [
        ("Phase 1: LLM Foundations", 1, 3, 1,
         ["Prompt Engineering", "Building Systems", "LangChain", "LCEL"]),
        ("Phase 2: RAG Pipelines", 4, 6, 2,
         ["RAG Fundamentals", "Advanced RAG", "FHIR R4"]),
        ("Phase 3: Evaluation", 7, 9, 3,
         ["Eval & Debugging", "G-Eval", "RAGAS", "Prompt Versioning"]),
        ("Phase 4: Agentic Systems", 10, 12, 4,
         ["Functions & Tools", "LangGraph", "Ollama Benchmark"]),
        ("Phase 5: LLMOps", 13, 15, 5,
         ["LLMOps Course", "LangSmith", "Cost Tracking", "Provider Framework"]),
        ("Phase 6: Portfolio & Prep", 16, 18, 6,
         ["GitHub READMEs", "Certifications", "Blog Post", "Interview Prep"]),
    ]

    fig, ax = plt.subplots(figsize=(16, 7))

    for i, (label, start, end, phase_num, topics) in enumerate(phases):
        y = len(phases) - i - 1
        width = end - start + 1
        color = COLORS[phase_num]

        # Draw main bar
        bar = FancyBboxPatch(
            (start - 0.4, y - 0.35), width - 0.2, 0.7,
            boxstyle="round,pad=0.1",
            facecolor=color, edgecolor="white", linewidth=1.2, alpha=0.9
        )
        ax.add_patch(bar)

        # Phase label (left-aligned inside bar)
        ax.text(start + 0.1, y + 0.05, label,
                fontsize=12, fontweight="bold", color="white",
                va="center", ha="left")

        # Topic list (below bar)
        topic_str = "  |  ".join(topics)
        ax.text(start + 0.1, y - 0.52, topic_str,
                fontsize=8, color="#b0b0b0", va="top", ha="left", style="italic")

    # Project milestones (diamonds)
    milestones = [
        (3, 5.3, "Clinical Note\nClassifier", 1),
        (6, 3.3, "Mental Health\nRAG", 2),
        (9, 2.3, "Clinical Eval\nFramework", 3),
        (12, 1.3, "Intake\nPipeline", 4),
        (15, 0.3, "AI CI/CD", 5),
    ]
    for mx, my, mlabel, phase_num in milestones:
        ax.plot(mx, my + 0.65, marker="D", markersize=10,
                color=COLORS[phase_num], markeredgecolor="white", markeredgewidth=1.5,
                zorder=5)
        ax.text(mx, my + 1.05, mlabel,
                fontsize=7.5, color="#f0f0f0", ha="center", va="bottom",
                fontweight="bold")

    ax.set_xlim(0, 19)
    ax.set_ylim(-1.2, 7.5)
    ax.set_xticks(range(1, 19))
    ax.set_xticklabels([f"W{i}" for i in range(1, 19)], fontsize=9)
    ax.set_yticks([])
    ax.set_xlabel("Week", fontsize=13, fontweight="bold")
    ax.set_title("AI Automation for Healthcare -- 18-Week Learning Roadmap",
                 fontsize=16, fontweight="bold", pad=20, color="white")
    ax.grid(axis="x", linestyle="--", alpha=0.3)

    # Legend for milestones
    ax.plot([], [], marker="D", markersize=8, color="#e0e0e0",
            markeredgecolor="white", linestyle="None", label="Project Milestone")
    ax.legend(loc="upper right", fontsize=9, framealpha=0.3,
              edgecolor="#555555")

    fig.tight_layout()
    fig.savefig(OUT_DIR / "learning_roadmap.png", dpi=180, bbox_inches="tight")
    plt.close(fig)
    print(f"  -> {OUT_DIR / 'learning_roadmap.png'}")


# ===== 2. Skills Radar Chart ===============================================
def generate_skills_radar():
    categories = [
        "Prompt\nEngineering",
        "RAG\nPipelines",
        "Evaluation\n& Testing",
        "Agentic\nSystems",
        "LLMOps",
        "FHIR /\nHealthcare",
    ]
    # Self-assessment skill levels (0-10 scale, reflecting depth of study)
    values = [9, 8, 9, 8, 7, 8]

    N = len(categories)
    angles = np.linspace(0, 2 * np.pi, N, endpoint=False).tolist()
    values_plot = values + values[:1]
    angles += angles[:1]

    fig, ax = plt.subplots(figsize=(8, 8), subplot_kw=dict(polar=True))
    ax.set_facecolor("#16213e")
    fig.patch.set_facecolor("#1a1a2e")

    # Draw the radar
    ax.plot(angles, values_plot, "o-", linewidth=2.5, color="#5a9e8f",
            markersize=8, markerfacecolor="#4f7cac", markeredgecolor="white",
            markeredgewidth=1.5)
    ax.fill(angles, values_plot, alpha=0.20, color="#5a9e8f")

    # Concentric rings with labels
    ax.set_ylim(0, 10)
    ax.set_yticks([2, 4, 6, 8, 10])
    ax.set_yticklabels(["2", "4", "6", "8", "10"], fontsize=8, color="#888888")
    ax.set_rlabel_position(30)

    # Category labels
    ax.set_xticks(angles[:-1])
    ax.set_xticklabels(categories, fontsize=11, fontweight="bold", color="#e0e0e0")

    # Grid styling
    ax.spines["polar"].set_color("#444466")
    ax.grid(color="#333355", linewidth=0.8, alpha=0.7)

    ax.set_title("Skills Coverage Across the Roadmap",
                 fontsize=15, fontweight="bold", pad=25, color="white")

    # Value annotations
    for angle, val, cat in zip(angles[:-1], values, categories):
        ax.annotate(str(val), xy=(angle, val), xytext=(angle, val + 0.8),
                    fontsize=10, fontweight="bold", color="white",
                    ha="center", va="center",
                    bbox=dict(boxstyle="round,pad=0.2", facecolor="#4f7cac",
                              edgecolor="white", alpha=0.8))

    fig.tight_layout()
    fig.savefig(OUT_DIR / "skills_radar.png", dpi=180, bbox_inches="tight")
    plt.close(fig)
    print(f"  -> {OUT_DIR / 'skills_radar.png'}")


# ===== 3. Project Connections Network =======================================
def generate_project_connections():
    fig, ax = plt.subplots(figsize=(14, 9))

    # Project nodes: (x, y, label, phase_num, short_desc)
    projects = {
        "classifier": (2, 7, "Clinical Note\nClassifier", 1,
                        "Prompt Engineering\n+ Structured Output"),
        "rag": (5, 4, "Mental Health\nRAG", 2,
                "Retrieval Pipeline\n+ Clinical Protocols"),
        "eval": (9, 7, "Clinical Eval\nFramework", 3,
                 "G-Eval + 4 Rubrics\n+ Baseline Mgmt"),
        "intake": (12, 4, "Agentic Intake\nPipeline", 4,
                   "LangGraph + FHIR R4\n+ Human-in-Loop"),
        "cicd": (8, 1, "Clinical AI\nCI/CD", 5,
                 "GitHub Actions\n+ Eval Gates"),
    }

    # Edges: (from, to, label)
    edges = [
        ("classifier", "rag", "Prompt patterns\nreused in RAG"),
        ("classifier", "eval", "Test cases for\nevaluation"),
        ("rag", "eval", "RAG outputs\nevaluated"),
        ("rag", "intake", "Retrieval patterns\nfeed agents"),
        ("eval", "cicd", "Eval framework\npowers CI/CD"),
        ("eval", "intake", "Validates agent\noutputs"),
        ("intake", "cicd", "Pipeline tested\nin CI/CD"),
    ]

    # Draw edges first (behind nodes)
    for src, dst, label in edges:
        x1, y1 = projects[src][0], projects[src][1]
        x2, y2 = projects[dst][0], projects[dst][1]
        mx, my = (x1 + x2) / 2, (y1 + y2) / 2

        ax.annotate("",
                    xy=(x2, y2), xytext=(x1, y1),
                    arrowprops=dict(arrowstyle="-|>",
                                    color="#888888", lw=1.8,
                                    connectionstyle="arc3,rad=0.15"),
                    zorder=1)
        ax.text(mx, my, label, fontsize=7, color="#aaaaaa",
                ha="center", va="center", style="italic",
                bbox=dict(boxstyle="round,pad=0.2", facecolor="#1a1a2e",
                          edgecolor="none", alpha=0.9))

    # Draw nodes
    for key, (x, y, label, phase_num, desc) in projects.items():
        color = COLORS[phase_num]
        circle = plt.Circle((x, y), 1.3, facecolor=color, edgecolor="white",
                             linewidth=2, alpha=0.85, zorder=3)
        ax.add_patch(circle)
        ax.text(x, y + 0.3, label, fontsize=10, fontweight="bold",
                color="white", ha="center", va="center", zorder=4)
        ax.text(x, y - 0.5, desc, fontsize=7, color="#d0d0d0",
                ha="center", va="center", zorder=4)

    # Phase labels
    phase_labels = [
        (2, 8.8, "Phase 1", 1), (5, 5.8, "Phase 2", 2),
        (9, 8.8, "Phase 3", 3), (12, 5.8, "Phase 4", 4),
        (8, -0.6, "Phase 5", 5),
    ]
    for px, py, plabel, pnum in phase_labels:
        ax.text(px, py, plabel, fontsize=8, color=COLORS[pnum],
                ha="center", fontweight="bold", alpha=0.8)

    ax.set_xlim(-0.5, 14.5)
    ax.set_ylim(-1.5, 10)
    ax.set_aspect("equal")
    ax.axis("off")
    ax.set_title("How the 5 Portfolio Projects Connect and Build on Each Other",
                 fontsize=15, fontweight="bold", pad=15, color="white")

    fig.tight_layout()
    fig.savefig(OUT_DIR / "project_connections.png", dpi=180, bbox_inches="tight")
    plt.close(fig)
    print(f"  -> {OUT_DIR / 'project_connections.png'}")


# ===== 4. Tech Stack Bar Chart =============================================
def generate_tech_stack():
    categories = [
        "Clinical Note\nClassifier",
        "Mental Health\nRAG",
        "Clinical Eval\nFramework",
        "Agentic Intake\nPipeline",
        "Clinical AI\nCI/CD",
    ]

    # Technologies grouped by category
    tech_groups = {
        "LLM / Prompting":  [1, 1, 1, 1, 1],
        "LangChain / LCEL": [0, 1, 0, 1, 0],
        "LangGraph":        [0, 0, 0, 1, 0],
        "RAG / Embeddings": [0, 1, 0, 0, 0],
        "G-Eval / RAGAS":   [0, 0, 1, 0, 1],
        "FHIR R4":          [0, 0, 0, 1, 0],
        "FastAPI":          [0, 1, 0, 0, 0],
        "GitHub Actions":   [0, 0, 0, 0, 1],
        "Pydantic":         [1, 1, 1, 1, 1],
        "ChromaDB":         [0, 1, 0, 0, 0],
    }

    tech_colors = [
        "#4f7cac", "#5a9e8f", "#9b6b9e", "#c47e3a", "#b85450",
        "#4a7c59", "#6b8e9e", "#8b6b5e", "#7a8b5e", "#5e7a8b",
    ]

    fig, ax = plt.subplots(figsize=(14, 7))

    y_pos = np.arange(len(categories))
    bar_height = 0.07
    group_keys = list(tech_groups.keys())

    for i, tech_name in enumerate(group_keys):
        vals = tech_groups[tech_name]
        offsets = [i * bar_height for _ in vals]
        for j, (val, y) in enumerate(zip(vals, y_pos)):
            if val:
                ax.barh(y + i * bar_height - len(group_keys) * bar_height / 2,
                        val * 0.8 + 0.2,
                        height=bar_height * 0.85,
                        color=tech_colors[i % len(tech_colors)],
                        alpha=0.85, edgecolor="white", linewidth=0.5)

    # Create a cleaner representation: matrix heatmap style
    plt.close(fig)

    # Better approach: grouped horizontal stacked bar
    fig, ax = plt.subplots(figsize=(15, 6))

    tech_names = list(tech_groups.keys())
    n_tech = len(tech_names)
    n_proj = len(categories)

    cell_width = 1.0
    cell_height = 0.6
    gap_x = 0.15
    gap_y = 0.12

    for i, tech in enumerate(tech_names):
        for j, proj in enumerate(categories):
            x = j * (cell_width + gap_x)
            y = (n_tech - 1 - i) * (cell_height + gap_y)
            val = tech_groups[tech][j]

            if val:
                color = tech_colors[i % len(tech_colors)]
                rect = FancyBboxPatch(
                    (x, y), cell_width, cell_height,
                    boxstyle="round,pad=0.05",
                    facecolor=color, edgecolor="white",
                    linewidth=0.8, alpha=0.85
                )
            else:
                rect = FancyBboxPatch(
                    (x, y), cell_width, cell_height,
                    boxstyle="round,pad=0.05",
                    facecolor="#1e1e3e", edgecolor="#333355",
                    linewidth=0.5, alpha=0.5
                )
            ax.add_patch(rect)

    # Row labels (tech names)
    for i, tech in enumerate(tech_names):
        y = (n_tech - 1 - i) * (cell_height + gap_y) + cell_height / 2
        ax.text(-0.3, y, tech, fontsize=10, fontweight="bold",
                color="#e0e0e0", ha="right", va="center")

    # Column labels (project names) -- single line, rotated for clarity
    short_names = [
        "Classifier",
        "RAG",
        "Eval Framework",
        "Intake Pipeline",
        "CI/CD",
    ]
    for j, proj in enumerate(short_names):
        x = j * (cell_width + gap_x) + cell_width / 2
        y = n_tech * (cell_height + gap_y) + 0.15
        ax.text(x, y, proj, fontsize=9, fontweight="bold",
                color="#e0e0e0", ha="center", va="bottom", rotation=35)

    total_w = n_proj * (cell_width + gap_x) - gap_x
    total_h = n_tech * (cell_height + gap_y) - gap_y

    ax.set_xlim(-3.5, total_w + 0.5)
    ax.set_ylim(-0.5, total_h + 2.0)
    ax.set_aspect("equal")
    ax.axis("off")
    ax.set_title("Technology Stack Across Portfolio Projects",
                 fontsize=15, fontweight="bold", pad=20, color="white")

    fig.tight_layout()
    fig.savefig(OUT_DIR / "tech_stack.png", dpi=180, bbox_inches="tight")
    plt.close(fig)
    print(f"  -> {OUT_DIR / 'tech_stack.png'}")


# ===== Main ================================================================
if __name__ == "__main__":
    print("Generating figures...")
    generate_learning_roadmap()
    generate_skills_radar()
    generate_project_connections()
    generate_tech_stack()
    print("Done. All figures saved to docs/images/")
