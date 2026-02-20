# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## What This Is

A VS Code color theme extension with two variants: **Chilaquiles Rojos (Dark)** and **Chilaquiles Rojos (Light)**. No build step, no dependencies, no tests — just JSON theme files consumed directly by VS Code.

## Development

Install the extension locally for live testing:

1. Open this folder in VS Code
2. Press `F5` to launch an Extension Development Host with the theme loaded
3. In the new window: `Cmd+K Cmd+T` → select **Chilaquiles Rojos (Dark)** or **Chilaquiles Rojos (Light)**

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

WCAG contrast checker: `node scripts/check-contrast.js "#FOREGROUND" "#BACKGROUND"`

## Extension Manifest

[package.json](package.json) registers both themes under `contributes.themes`. The publisher is `agzertuche`. No scripts, no runtime dependencies.

## Color Palette

All token colors pass WCAG AA (4.5:1 minimum). Colors are mapped to real chilaquiles ingredients across 7 distinct hue lanes.

### Dark Variant (`#1A1008` background)

| Role | Ingredient | Name | Hex | Contrast |
|------|------------|------|-----|----------|
| Default text | Queso fresco | Warm White | `#F5F1E8` | 16.61:1 |
| Keywords | Salsa roja | Vivid Tomato | `#E05C4B` | 5.17:1 |
| Tags / Types | Chili flakes | Rose Chili | `#D97085` | 5.89:1 |
| Attributes | Pickled onion | Lilac Onion | `#C480B0` | 6.30:1 |
| Strings | Tortilla chips | Corn Gold | `#E8B84B` | 10.15:1 |
| Numbers | Egg yolk | Pale Gold | `#E8C96A` | 11.59:1 |
| Functions | Avocado | Bright Cilantro | `#6DBF72` | 8.33:1 |
| Comments | Onion skin | Adobe | `#A67B6A` | 5.05:1 |
| Punctuation | Clay bowl | Warm Tan | `#B8917A` | 6.57:1 |

### Light Variant (`#FFFBF5` background)

| Role | Ingredient | Name | Hex | Contrast |
|------|------------|------|-----|----------|
| Default text | — | Dark Ink | `#2A1810` | 16.47:1 |
| Keywords | Salsa roja | Chili Pepper | `#C4391C` | 5.16:1 |
| Tags / Types | Chili ancho | Ancho Burgundy | `#8C1D35` | 8.70:1 |
| Attributes | Pickled onion | Pickled Onion | `#A64D79` | 5.15:1 |
| Strings | Tortilla chips | Tortilla Gold | `#7B5B00` | 6.10:1 |
| Numbers | Egg yolk | Egg Yolk Amber | `#A05600` | 5.32:1 |
| Functions | Avocado | Avocado Green | `#2E7D32` | 4.97:1 |
| Comments | Onion skin | Onion Skin | `#826858` | 5.00:1 |
| Punctuation | Clay bowl | Bowl Brown | `#6B4A35` | 7.67:1 |

When adding new token scopes, keep colors consistent with this palette.
