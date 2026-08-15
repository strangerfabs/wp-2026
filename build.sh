#!/usr/bin/env bash
# Erzeugt index.html (vollständiges Dokument für GitHub Pages) aus card.src.html
# (Artifact-Fassung, die ohne <html>/<head> auskommt).
set -euo pipefail
cd "$(dirname "$0")"

python3 - <<'PY'
import re, pathlib

body = pathlib.Path("card.src.html").read_text(encoding="utf-8")
title = re.search(r"<title>(.*?)</title>", body).group(1)
body = re.sub(r"<title>.*?</title>\s*", "", body, count=1)

doc = f"""<!doctype html>
<html lang="de">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="robots" content="noindex, nofollow, noarchive, nosnippet">
<meta name="theme-color" content="#ffffff">
<title>{title}</title>
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>%F0%9F%8E%9F%EF%B8%8F</text></svg>">
<style>*{{margin:0}}</style>
</head>
<body>
{body.strip()}
</body>
</html>
"""
pathlib.Path("index.html").write_text(doc, encoding="utf-8")
print(f"index.html neu gebaut ({len(doc)} Bytes)")
PY
