// scripts/check-contrast.js
// Usage: node scripts/check-contrast.js "#FOREGROUND" "#BACKGROUND"
// Calculates WCAG relative luminance and contrast ratio

function luminance(hex) {
  const r = parseInt(hex.slice(1, 3), 16) / 255;
  const g = parseInt(hex.slice(3, 5), 16) / 255;
  const b = parseInt(hex.slice(5, 7), 16) / 255;
  const toLinear = (c) => c <= 0.03928 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
  return 0.2126 * toLinear(r) + 0.7152 * toLinear(g) + 0.0722 * toLinear(b);
}

function contrast(fg, bg) {
  const l1 = luminance(fg);
  const l2 = luminance(bg);
  const lighter = Math.max(l1, l2);
  const darker = Math.min(l1, l2);
  return (lighter + 0.05) / (darker + 0.05);
}

const [,, fg, bg] = process.argv;
if (!fg || !bg) {
  console.error('Usage: node scripts/check-contrast.js "#RRGGBB" "#RRGGBB"');
  process.exit(1);
}
const ratio = contrast(fg, bg);
const pass = ratio >= 4.5 ? 'PASS AA' : ratio >= 3.0 ? 'FAIL AA (pass AA-large)' : 'FAIL';
console.log(`${fg} on ${bg}: ${ratio.toFixed(2)}:1 — ${pass}`);
