# Changelog

## [0.6.0] - 2026-02-19

### Changed

- Renamed themes to "Chilaquiles Rojos (Dark)" and "Chilaquiles Rojos (Light)" for future variant support.
- Expanded token palette from 5 to 7 distinct hue lanes for better syntax differentiation:
  - Dark: rose chili `#D97085` for tags/types, lilac onion `#C480B0` for attributes.
  - Light: ancho burgundy `#8C1D35` for tags/types, pickled onion `#A64D79` for attributes.
- Brightened light theme background from `#FDF8F0` to `#FFFBF5` for improved contrast.
- Improved light theme readability: keywords, strings, numbers, and functions all boosted.

### Added

- Extension icon (`chilaquiles_logo.png`).
- `AGENTS.md` consolidating project guidance and full palette reference.

### Removed

- `CLAUDE.md` and `docs/palette.md` (merged into `AGENTS.md`).

## [0.5.0] - 2026-02-19

### Added

- 49 new UI color keys (185 total) covering: diff editor, merge conflicts, suggest widget, hover widget, peek view, breadcrumb, minimap, sticky scroll, inlay hints, bracket colorization, gutter indicators, quick input, overview ruler, word highlight, and editor link.
- Explicit `semanticHighlighting: true` flag in both theme files per VS Code best practices.
- `package.json`: added `homepage` and `bugs` fields for Marketplace listing.

### Changed

- `.vscodeignore`: expanded exclusions to reduce published package size (excludes docs, scripts, CI config, dev files).

## [0.4.0] - 2026-02-19

### Changed

- Improved color palette: all token colors now pass WCAG AA (4.5:1) on both variants.
- Dark theme: functions changed from dark forest green (`#2E7D32`) to bright cilantro green (`#6DBF72`) for readability.
- Benchmarked against Dracula, Monokai, and Night Owl; adopted higher-lightness accents on dark background.

### Added

- `docs/palette.md`: palette reference with contrast ratios for all token roles.
- `scripts/check-contrast.js`: WCAG contrast ratio utility.

## [0.3.1] - 2026-02-19

### Fixed

- CI/CD: publish workflow now uses Node 20 (required by vsce) and also publishes to Open VSX Registry.

## [0.3.0] - 2026-02-19

### Added

- Semantic token support for both Dark and Light variants (TypeScript/JavaScript language server integration).
- TypeScript/JavaScript language-specific token overrides for generics, arrow functions, interface names, and built-in types.
- CI/CD: GitHub Actions workflow auto-publishes to VS Code Marketplace when `package.json` version is bumped on `main`.

## [0.2.0] - 2026-02-19

### Added

- Full editor UI colors for both Dark and Light variants: activity bar, sidebar, tabs, status bar, terminal, notifications, input fields, buttons, scrollbars, and git decorations.

## [0.1.0] - 2026-02-17

### Added

- Chilaquiles Dark theme with syntax highlighting
- Chilaquiles Light theme with contrast-adjusted palette
- Coverage for: JS/TS, JSX/TSX, CSS, HTML, Python, Rust, Markdown
