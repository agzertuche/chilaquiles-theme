# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A VS Code color theme extension with two variants: **Chilaquiles Dark** and **Chilaquiles Light**. No build step, no dependencies, no tests — just JSON theme files consumed directly by VS Code.

## Development

Install the extension locally for live testing:

1. Open this folder in VS Code
2. Press `F5` to launch an Extension Development Host with the theme loaded
3. In the new window: `Cmd+K Cmd+T` → select **Chilaquiles Dark** or **Chilaquiles Light**

To package for publishing:
```bash
npm install -g @vscode/vsce
vsce package        # produces chilaquiles-theme-x.x.x.vsix
vsce publish        # publishes to VS Code Marketplace (requires PAT)
```

## Architecture

All theme logic lives in two JSON files under `themes/`:

- [themes/chilaquiles-dark.json](themes/chilaquiles-dark.json) — dark variant (`"type": "dark"`, `"uiTheme": "vs-dark"`)
- [themes/chilaquiles-light.json](themes/chilaquiles-light.json) — light variant (`"type": "light"`, `"uiTheme": "vs"`)

Both files define `tokenColors` (TextMate syntax highlighting), `semanticTokenColors` (language-server-based highlighting for TS/JS), and `colors` (editor UI — sidebar, tabs, status bar, terminal, etc.).

Full palette reference: [docs/palette.md](docs/palette.md)
WCAG contrast checker: `node scripts/check-contrast.js "#FOREGROUND" "#BACKGROUND"`

## Color Palette

All token colors pass WCAG AA (4.5:1 minimum) on their respective backgrounds.

| Role        | Dark (on `#1A1008`)        | Light (on `#FDF8F0`)    |
|-------------|----------------------------|-------------------------|
| Keywords    | Vivid Tomato `#E05C4B`     | Deep Chili `#8B2318`    |
| Strings     | Bright Corn Gold `#E8B84B` | Dark Gold `#6B5000`     |
| Numbers     | Pale Gold `#E8C96A`        | Darker Gold `#5C4400`   |
| Functions   | Bright Cilantro `#6DBF72`  | Deep Cilantro `#145218` |
| Types       | Warm Chili `#D45C4C`       | Deeper Red `#7A1E10`    |
| Comments    | Lightened Adobe `#A67B6A`  | Deep Adobe `#6B4237`    |
| Punctuation | Warm Tan `#B8917A`         | Brown `#5C3D2A`         |

When adding new token scopes, keep colors consistent with this palette.

## Extension Manifest

[package.json](package.json) registers both themes under `contributes.themes`. The publisher is `agzertuche`. No scripts, no runtime dependencies.
