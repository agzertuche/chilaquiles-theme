# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## What This Is

A VS Code color theme extension with four variants across two flavor families:

- **Chilaquiles Rojos (Dark)** / **Chilaquiles Rojos (Light)** —
  warm chili reds and corn golds
- **Chilaquiles Verdes (Dark)** / **Chilaquiles Verdes (Light)** —
  tomatillo greens and corn chip gold

No build step, no dependencies, no tests — just JSON theme files consumed
directly by VS Code.

## Development

Install the extension locally for live testing:

1. Open this folder in VS Code
2. Press `F5` to launch an Extension Development Host with the theme loaded
3. In the new window: `Cmd+K Cmd+T` → select any of the four theme variants

### Releasing

Use the release script to bump version, update changelog, and commit:

```bash
npm run release:patch "Fixed bracket colors"
npm run release:minor "Added Python-specific scopes"
npm run release:major "Breaking: renamed theme files"
```

Then push to `main` and create a **GitHub Release** — the CI workflow (`.github/workflows/publish.yml`) triggers on `release: [published]` and publishes to both the VS Code Marketplace and Open VSX Registry.

To package locally:
```bash
npm install -g @vscode/vsce
vsce package        # produces chilaquiles-theme-x.x.x.vsix
```

## Architecture

All theme logic lives in four JSON files under `themes/`:

- [themes/chilaquiles-dark.json](themes/chilaquiles-dark.json) — Rojos dark
- [themes/chilaquiles-light.json](themes/chilaquiles-light.json) — Rojos light
- [themes/chilaquiles-verdes-dark.json](themes/chilaquiles-verdes-dark.json)
  — Verdes dark
- [themes/chilaquiles-verdes-light.json](themes/chilaquiles-verdes-light.json)
  — Verdes light

Each file defines `tokenColors` (TextMate syntax highlighting),
`semanticTokenColors` (language-server highlighting for TS/JS), and `colors`
(editor UI — sidebar, tabs, status bar, terminal, etc.).

WCAG contrast checker: `node scripts/check-contrast.js "#FG" "#BG"`

## Extension Manifest

[package.json](package.json) registers all four themes under
`contributes.themes`. The publisher is `agzertuche`. Release scripts are
defined under `scripts` (see Releasing above). No runtime dependencies.

## Color Palette

All token colors pass WCAG AA (4.5:1 minimum).

### Rojos Dark (`#1A1008` background)

| Role | Hex | Contrast |
| ---- | --- | -------- |
| Default text | `#F5F1E8` | 16.61:1 |
| Keywords | `#E05C4B` | 5.17:1 |
| Tags / Types | `#D97085` | 5.89:1 |
| Attributes | `#C480B0` | 6.30:1 |
| Strings | `#E8B84B` | 10.15:1 |
| Numbers | `#E8C96A` | 11.59:1 |
| Functions | `#6DBF72` | 8.33:1 |
| Comments | `#A67B6A` | 5.05:1 |
| Punctuation | `#B8917A` | 6.57:1 |

### Rojos Light (`#FFFBF5` background)

| Role | Hex | Contrast |
| ---- | --- | -------- |
| Default text | `#2A1810` | 16.47:1 |
| Keywords | `#C4391C` | 5.16:1 |
| Tags / Types | `#8C1D35` | 8.70:1 |
| Attributes | `#A64D79` | 5.15:1 |
| Strings | `#7B5B00` | 6.10:1 |
| Numbers | `#A05600` | 5.32:1 |
| Functions | `#2E7D32` | 4.97:1 |
| Comments | `#826858` | 5.00:1 |
| Punctuation | `#6B4A35` | 7.67:1 |

### Verdes Dark (`#141614` background)

| Role | Hex | Contrast |
| ---- | --- | -------- |
| Default text | `#F5F1E8` | 16.14:1 |
| Keywords | `#4CAF50` | 6.54:1 |
| Tags / Types | `#C97DB5` | 6.14:1 |
| Attributes | `#D99DC8` | 8.76:1 |
| Strings | `#E8B84B` | 9.86:1 |
| Numbers | `#6FAF5A` | 6.89:1 |
| Functions | `#D4A017` | 7.66:1 |
| Comments | `#5C6E5E` | 3.33:1 |
| Punctuation | `#8AAD8C` | 7.31:1 |

### Verdes Light (`#E8EDE8` background)

| Role | Hex | Contrast |
| ---- | --- | -------- |
| Default text | `#1C2A1C` | 12.67:1 |
| Keywords | `#2A7530` | 4.81:1 |
| Tags / Types | `#8E3A65` | 6.02:1 |
| Attributes | `#853678` | 6.33:1 |
| Strings | `#7D5C00` | 5.20:1 |
| Numbers | `#3E7530` | 4.67:1 |
| Functions | `#7D5C00` | 5.20:1 |
| Comments | `#4A7050` | 4.75:1 |
| Punctuation | `#4A7050` | 4.75:1 |

When adding new token scopes, keep colors consistent with the relevant palette.
