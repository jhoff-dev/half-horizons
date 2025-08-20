// eslint.config.js
import js from "@eslint/js";
import prettierFlat from "eslint-config-prettier/flat";

export default [
  js.configs.recommended,
  prettierFlat
];
