#!/usr/bin/env bash
# Repeatable verification for the AI for Pet Care manual.
# Checks: HTML well-formedness, internal links, CSV templates, LICENSE,
# README credit, secrets scan, and absence of forbidden files.
# Exit non-zero on any failure.
set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FAIL=0
pass() { echo "PASS: $1"; }
fail() { echo "FAIL: $1"; FAIL=1; }

echo "== AI for Pet Care verification =="

# 1. HTML well-formedness + internal link check
echo "-- HTML well-formedness and links --"
python3 - <<'PY'
import html, os, re
from html.parser import HTMLParser

errors = []
files = sorted(f for f in os.listdir("site") if f.endswith(".html"))
if not files:
    print("FAIL: no HTML files in site/")
    raise SystemExit(1)

class LinkChecker(HTMLParser):
    def __init__(self, path):
        super().__init__()
        self.links = []
    def handle_starttag(self, tag, attrs):
        for key, val in attrs:
            if key in ("href", "src") and val and not val.startswith(("http://", "https://", "mailto:", "#")):
                self.links.append(val)

for f in files:
    p = os.path.join("site", f)
    with open(p, encoding="utf-8") as fh:
        content = fh.read()
    parser = LinkChecker(p)
    try:
        parser.feed(content)
    except Exception as e:
        errors.append((f, "parse error", str(e)))
        continue
    for link in parser.links:
        target = os.path.normpath(os.path.join(os.path.dirname(p), link))
        if not os.path.exists(target):
            errors.append((f, "broken link", link))
    for m in re.finditer(r'href="([^"]+)"', content):
        u = m.group(1)
        if u.startswith("http") and "dylanasdale.github.io" not in u:
            errors.append((f, "unexpected external link", u))

if errors:
    for e in errors:
        print("FAIL:", e)
    raise SystemExit(1)
print("PASS: all HTML parses and links resolve")
PY
if [ $? -ne 0 ]; then FAIL=1; fi

# 2. htmlhint lint (optional, only if available)
echo "-- htmlhint lint --"
if command -v npx >/dev/null 2>&1; then
  if npx --yes htmlhint "site/*.html" >/tmp/htmlhint.out 2>&1; then
    pass "htmlhint: no errors"
  else
    fail "htmlhint: errors found"
    tail -20 /tmp/htmlhint.out
  fi
else
  echo "SKIP: htmlhint not installed"
fi

# 3. CSV templates parse
echo "-- CSV templates --"
python3 - <<'PY'
import csv, os
ok = True
for f in sorted(os.listdir("templates")):
    if f.endswith(".csv"):
        with open(os.path.join("templates", f), newline="", encoding="utf-8") as fh:
            rows = list(csv.reader(fh))
        if not rows or not rows[0]:
            print("FAIL:", f, "empty")
            ok = False
        else:
            print("PASS:", f, "header +", len(rows) - 1, "row(s)")
if not ok:
    raise SystemExit(1)
PY
if [ $? -ne 0 ]; then FAIL=1; fi

# 4. LICENSE copyright line
echo "-- LICENSE --"
if grep -q "Copyright (c) 2026 Asdale Dynamics, LLC" LICENSE && head -1 LICENSE | grep -q "MIT License"; then
  pass "LICENSE: exact copyright line and MIT header present"
else
  fail "LICENSE: copyright line or MIT header missing"
  FAIL=1
fi

# 5. README credits Asdale Dynamics, LLC
echo "-- README credit --"
if grep -q "Asdale Dynamics, LLC" README.md; then
  pass "README: credits Asdale Dynamics, LLC"
else
  fail "README: missing Asdale Dynamics, LLC credit"
  FAIL=1
fi

# 6. Secrets scan
echo "-- secrets scan --"
if grep -rI --include='*' -E "(sk-|AKIA[0-9A-Z]{16}|api[_-]?key|password\s*=|secret\s*=|BEGIN [A-Z ]*PRIVATE KEY)" . --exclude-dir=.git --exclude=verify.sh >/dev/null 2>&1; then
  fail "secrets scan: possible secret found"
  FAIL=1
else
  pass "secrets scan: no secrets found"
fi

# 7. Forbidden files
echo "-- forbidden files --"
if [ -d ".github/workflows" ]; then
  fail ".github/workflows present"
  FAIL=1
else
  pass "no .github/workflows"
fi

# 8. Required files present
echo "-- required files --"
for f in README.md LICENSE STATUS.md site/index.html site/print.html templates/medication-log.csv templates/vet-visit-log.csv templates/feeding-schedule.csv templates/behavior-log.csv; do
  if [ -f "$f" ]; then
    pass "present: $f"
  else
    fail "missing: $f"
    FAIL=1
  fi
done

echo
if [ "$FAIL" -eq 0 ]; then
  echo "RESULT: ALL CHECKS PASSED"
  exit 0
else
  echo "RESULT: SOME CHECKS FAILED"
  exit 1
fi