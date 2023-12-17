return {
  formatCanRange = true,
  formatStdin = true,
  formatCommand = "prettier ${INPUT} ${--range-start=charStart} ${--range-end=charEnd} --log-level debug",
  rootMarkers = {
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.js",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    ".prettierrc.json5",
    ".prettierrc.mjs",
    ".prettierrc.cjs",
    ".prettierrc.toml",
  },
}
