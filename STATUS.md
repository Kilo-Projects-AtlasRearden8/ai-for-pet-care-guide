# STATUS — AI for Pet Care Beginner Manual

## What was built

A privacy-first beginner manual for using AI in pet care, plus a static HTML version of the same content, published by Asdale Dynamics, LLC (Indiana, formed October 2026). Written "like a friend would": plain English, step by step, never condescending.

**`docs/`** — 9 markdown sections:
- `index.md` — overview and how to use the manual
- `01-getting-started-with-ai.md` — picking a tool, first prompt, local-first guidance
- `02-tracking-medications.md` — medication logs, reminder schedules, refill checklists
- `03-tracking-vet-visits.md` — appointment prep, visit notes, visit history
- `04-feeding-schedules.md` — weekly feeding charts, portions, treats
- `05-behavior-notes.md` — behavior logs, patterns, vet conversation prep
- `06-pet-sitter-instructions.md` — print-ready sitter care sheets
- `07-emergency-contacts.md` — contact list, emergency plan, warning signs
- `08-privacy-and-safety.md` — never share client or personal data with AI tools
- `09-printable-care-sheets.md` — one-page sheets and blank templates

**`site/`** — 10 static HTML pages (no build step, no dependencies):
- `index.html` + 8 section pages + `print.html`
- `css/style.css` — includes print stylesheet that hides navigation and prints care sheets only
- `js/app.js` — active-page highlighting in navigation

**`templates/`** — blank CSV logs (medication, vet visit, feeding schedule, behavior) and a markdown pet-sitter care sheet template. Rows contain clearly fictional example data only.

**`scripts/`** — `verify.sh`, a repeatable verification script that checks HTML well-formedness and links, runs htmlhint, validates CSV templates, confirms the LICENSE copyright line and README credit, scans for secrets, and checks for forbidden files.

**Root** — `README.md`, `LICENSE` (MIT, exact copyright line: `Copyright (c) 2026 Asdale Dynamics, LLC`), `STATUS.md`.

## How to run it

No installation required. The site is plain HTML/CSS/JS:

1. Open `site/index.html` in any web browser (double-click, or `python3 -m http.server` from the folder and visit `localhost:8000/site/index.html`).
2. Read `docs/08-privacy-and-safety.md` (or `site/08-privacy.html`) first.
3. Work through sections one at a time; copy the example AI prompts and edit with general details only.
4. Print care sheets: open `site/print.html` and press Ctrl+P (or Cmd+P). The print stylesheet hides navigation and prints the sheets only.
5. Fill `templates/*.csv` by hand or in any spreadsheet app.

## Verification results

Run the included script: `./scripts/verify.sh`

Last run: **all checks passed**.

- HTML well-formedness and internal links (all 10 HTML files): 0 parse errors, 0 broken links, no unexpected external links
- htmlhint 1.9.2 lint: scanned 10 files, no errors found
- CSV templates: all 4 parse correctly (header + 1 fictional example row each)
- `LICENSE`: exact copyright line `Copyright (c) 2026 Asdale Dynamics, LLC` present; MIT License header present
- `README.md`: credits Asdale Dynamics, LLC
- Secrets scan (API key/password/secret/private-key patterns): none found
- `.github/workflows`: not present (not added)
- No personal data, API keys, or secrets in any file

## Known gaps

- No automated test suite beyond the verify script (project is static documentation; verification is lint + link + template checks above).
- No full-text search on the static site.
- Example data in CSV templates is fictional and labeled as such; users must replace with their own (paper-only) real details.
- No backend — AI prompts are executed by the user in whatever AI tool they choose; this repo does not include or call any AI service.
- The manual covers the core pet-care topics; it does not include advanced AI topics (agents/MCP, local-LLM setup) that the LLC may add later.