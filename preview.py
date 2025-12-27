#!/usr/bin/env python3
"""
preview.py (namu-dark only)

Generates a single preview image that looks like a UI mock:
- Sidebar + editor + statusline
- Cursor line + visual selection block
- Palette swatches grid

Output: preview.png
"""

import matplotlib.pyplot as plt
import matplotlib.patches as patches


PALETTE = {
    "bg": "#1e1c1a",
    "fg": "#e3ded7",
    "line_nr": "#6d665f",
    "line_nr_active": "#b6ada3",
    "sel": "#3e3a35",
    "sel_inactive": "#2f2b27",
    "cursor": "#d0c49e",
    "ws": "#3a3733",
    "indent": "#2b2825",
    "indent_active": "#4e4944",
    "sidebar_bg": "#24211f",
    "sidebar_fg": "#d5cfc6",
    "status_bg": "#2f2b27",
    "status_fg": "#d7d0c6",
    "title_bg": "#2a2724",
    "title_fg": "#ddd6cc",
    "comment": "#847e77",
    "string": "#4e74ad",
    "keyword": "#1a9b80",
    "var": "#7e77c3",
    "const": "#c99252",
    "func": "#6db09d",
    "type": "#ae6890",
    "punct": "#9d938b",
    "regex": "#d98a5e",
    "langvar": "#d75a5a",
}


def rounded(ax, x, y, w, h, fc, ec="none", lw=1.0, r=0.02, alpha=1.0):
    ax.add_patch(
        patches.FancyBboxPatch(
            (x, y), w, h,
            boxstyle=f"round,pad=0.008,rounding_size={r}",
            facecolor=fc, edgecolor=ec, linewidth=lw, alpha=alpha
        )
    )


def rect(ax, x, y, w, h, fc, ec="none", lw=1.0, alpha=1.0):
    ax.add_patch(
        patches.Rectangle(
            (x, y), w, h,
            facecolor=fc, edgecolor=ec, linewidth=lw, alpha=alpha
        )
    )


def text(ax, x, y, s, c, size=11, ha="left", va="center", weight="normal", alpha=1.0):
    ax.text(
        x, y, s,
        color=c, fontsize=size,
        ha=ha, va=va,
        fontfamily="monospace",
        fontweight=weight,
        alpha=alpha
    )


def draw_preview(out_path="preview.png"):
    p = PALETTE

    fig = plt.figure(figsize=(14, 8), facecolor=p["bg"])
    ax = fig.add_axes([0, 0, 1, 1])
    ax.set_xlim(0, 100)
    ax.set_ylim(0, 100)
    ax.axis("off")

    # Background frame
    rounded(ax, 2, 3, 96, 94, fc=p["bg"], ec=p["indent_active"], lw=1.2, r=2.0)

    # Title bar
    rect(ax, 2, 92, 96, 5, fc=p["title_bg"])
    text(ax, 4, 94.5, "namu-dark — Korean Night Ink", p["title_fg"], size=14, weight="bold")
    text(ax, 96, 94.5, "Vim/Neovim", p["comment"], size=11, ha="right")

    # Layout sizes
    sidebar_w = 26
    gutter_w = 6
    content_x0 = 2
    content_y0 = 8
    content_w = 96
    content_h = 84

    # Sidebar
    rect(ax, content_x0, content_y0, sidebar_w, content_h, fc=p["sidebar_bg"])
    text(ax, content_x0 + 2, content_y0 + content_h - 3.5, "Explorer", p["sidebar_fg"], size=12, weight="bold")
    # Sidebar items (mock)
    items = [
        ("src/", p["sidebar_fg"]),
        ("  colors/", p["sidebar_fg"]),
        ("    namu-dark.vim", p["cursor"]),
        ("README.md", p["sidebar_fg"]),
        ("lua/", p["sidebar_fg"]),
        ("  config.lua", p["sidebar_fg"]),
    ]
    y = content_y0 + content_h - 8
    for name, col in items:
        text(ax, content_x0 + 2, y, name, col, size=11)
        y -= 4

    # Editor area
    editor_x = content_x0 + sidebar_w
    rect(ax, editor_x, content_y0, content_w - sidebar_w, content_h, fc=p["bg"])

    # Split line between sidebar and editor
    rect(ax, editor_x, content_y0, 0.4, content_h, fc=p["indent"])

    # Gutter (line numbers) background
    rect(ax, editor_x + 0.6, content_y0, gutter_w, content_h, fc=p["bg"])
    rect(ax, editor_x + gutter_w + 0.6, content_y0, 0.4, content_h, fc=p["indent"])

    # CursorLine background (mock) in editor text region
    cursor_line_y = content_y0 + 50
    rect(ax, editor_x + gutter_w + 1.0, cursor_line_y - 2.0, (content_w - sidebar_w) - gutter_w - 1.6, 4.2, fc=p["sel_inactive"])

    # Visual selection block (mock)
    rect(ax, editor_x + gutter_w + 20, cursor_line_y - 2.0, 30, 4.2, fc=p["sel"], alpha=0.95)

    # Line numbers
    ln_x = editor_x + gutter_w + 0.2
    y0 = content_y0 + content_h - 6
    line_h = 4.2
    active_ln = 12
    for i in range(1, 18):
        c = p["line_nr_active"] if i == active_ln else p["line_nr"]
        w = "bold" if i == active_ln else "normal"
        text(ax, ln_x - 1.0, y0 - (i - 1) * line_h, f"{i:>2}", c, size=11, ha="right", weight=w)

    # A few "token-like" bars (not code text, just color accents)
    # This keeps it "color-only" while showing contrast relationships.
    start_x = editor_x + gutter_w + 2.0
    start_y = y0
    bars = [
        [(18, p["comment"]), (10, p["keyword"]), (14, p["func"]), (8, p["punct"])],
        [(10, p["type"]), (6, p["punct"]), (20, p["var"]), (8, p["punct"]), (12, p["const"])],
        [(14, p["keyword"]), (6, p["punct"]), (28, p["string"])],
        [(12, p["keyword"]), (20, p["var"]), (10, p["punct"]), (14, p["regex"])],
        [(10, p["keyword"]), (16, p["var"]), (10, p["punct"]), (10, p["langvar"]), (10, p["punct"]), (12, p["const"])],
    ]
    for row, segs in enumerate(bars):
        y = start_y - row * line_h
        x = start_x
        for w, col in segs:
            rect(ax, x, y - 1.4, w, 2.2, fc=col)
            x += w + 1.0

        # whitespace markers (subtle)
        rect(ax, start_x + 78, y - 1.1, 2.5, 1.6, fc=p["ws"], alpha=0.8)

    # Status line
    rect(ax, 2, 3, 96, 5, fc=p["status_bg"])
    text(ax, 4, 5.5, "NORMAL", p["status_fg"], size=12, weight="bold")
    text(ax, 16, 5.5, "namu-dark.vim", p["sidebar_fg"], size=12)
    text(ax, 96, 5.5, "Ln 12, Col 18  |  utf-8  |  unix", p["comment"], size=11, ha="right")

    # Cursor color swatch marker
    rounded(ax, 86.5, 4.2, 2.6, 2.6, fc=p["cursor"], ec=p["indent_active"], lw=1.0, r=0.6)
    text(ax, 85.8, 8.7, "cursor", p["comment"], size=9, ha="right")

    # Palette swatches block (right side top)
    sw_x0 = 61
    sw_y0 = 67
    sw_w = 35
    sw_h = 23
    rounded(ax, sw_x0, sw_y0, sw_w, sw_h, fc=p["title_bg"], ec=p["indent_active"], lw=1.0, r=1.2)

    text(ax, sw_x0 + 1.6, sw_y0 + sw_h - 2.2, "Palette anchors", p["title_fg"], size=12, weight="bold")
    text(ax, sw_x0 + 1.6, sw_y0 + sw_h - 5.2, "contrast-first, low-saturation base", p["comment"], size=9)

    swatches = [
        ("bg", p["bg"]),
        ("fg", p["fg"]),
        ("comment", p["comment"]),
        ("keyword", p["keyword"]),
        ("func", p["func"]),
        ("type", p["type"]),
        ("string", p["string"]),
        ("const", p["const"]),
        ("var", p["var"]),
        ("punct", p["punct"]),
        ("regex", p["regex"]),
        ("langvar", p["langvar"]),
    ]

    cols = 4
    cell_w = (sw_w - 3.0) / cols
    cell_h = 6.0
    for i, (name, col) in enumerate(swatches):
        r = i // cols
        c = i % cols
        x = sw_x0 + 1.5 + c * cell_w
        y = sw_y0 + sw_h - 9.0 - r * cell_h

        rounded(ax, x, y - 3.4, 3.6, 3.6, fc=col, ec=p["indent_active"], lw=0.8, r=0.6)
        text(ax, x + 4.6, y - 1.6, name, p["sidebar_fg"], size=9)
        text(ax, x + 4.6, y - 3.0, col, p["line_nr"], size=8)

    fig.savefig(out_path, dpi=220, facecolor=p["bg"], bbox_inches="tight")
    plt.close(fig)
    print(f"Wrote: {out_path}")


if __name__ == "__main__":
    draw_preview()
