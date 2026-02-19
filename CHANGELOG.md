# Changelog

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
