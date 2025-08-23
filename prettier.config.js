// prettier.config.js
export default {
  plugins: ["@shufo/prettier-plugin-blade", "prettier-plugin-tailwindcss"],
  // Core
  printWidth: 120,
  tabWidth: 2,
  useTabs: true,
  semi: true,
  singleQuote: false,
  quoteProps: "as-needed",
  jsxSingleQuote: false,
  trailingComma: "es5",
  bracketSpacing: true,
  bracketSameLine: false,
  arrowParens: "always",
  proseWrap: "preserve",
  htmlWhitespaceSensitivity: "ignore",
  endOfLine: "lf",
  singleAttributePerLine: true,
  embeddedLanguageFormatting: "auto",
  // Blade
  wrapAttributes: "aligned-multiple",
  wrapAttributesMinAttrs: 2,
  sortTailwindcssClasses: false,
  sortHtmlAttributes: "alphabetical",
  noPhpSyntaxCheck: false,
  indentInnerHtml: true,
  extraLiners: "",
  trailingCommaPHP: true,
  componentPrefix: "x-,livewire:",
  phpVersion: "8.2",

  // Tailwind
  tailwindPreserveWhitespace: false,
  tailwindPreserveDuplicates: false,
};
