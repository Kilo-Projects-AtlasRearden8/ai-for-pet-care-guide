# AI for Pet Care — A Beginner Manual

A plain-English, step-by-step guide to using AI for everyday pet care: tracking medications, vet visits, feeding schedules, and behavior notes — plus pet-sitter instructions, emergency contacts, and printable care sheets.

Written and published by **Asdale Dynamics, LLC** — Indiana, formed October 2026. Beginner-friendly AI education, books, and guides. Learn more at dylanasdale.github.io.

This guide explains AI "like a friend would": plain English, step by step, never condescending. You don't need to be technical. If you can type a question into a search box, you can use it.

## What's inside

| Folder | What it contains |
|--------|------------------|
| `docs/` | The full markdown manual: getting started, medications, vet visits, feeding, behavior notes, pet-sitter instructions, emergency contacts, privacy & safety, and printable care sheets |
| `site/` | The same manual as a static HTML website — no build step, no dependencies, just open `site/index.html` in any browser |
| `templates/` | Blank CSV logs (medications, vet visits, feeding, behavior) and a pet-sitter care sheet template to print and fill in by hand |
| `scripts/` | A repeatable verification script that checks the site, links, templates, LICENSE, and README |
| `LICENSE` | MIT License, Copyright (c) 2026 Asdale Dynamics, LLC |

## How to use it

1. **Start with privacy.** Read `docs/08-privacy-and-safety.md` (or `site/08-privacy.html`) before anything else. Never put your name, address, veterinarian's name, prescription numbers, microchip numbers, or client information into a public AI tool.
2. **Work through the manual one section at a time.** Each section has example AI prompts you can copy, paste, and edit using general details only (nicknames like "my dog" instead of real names).
3. **Print what you need.** Open `site/print.html` and press Ctrl+P (or Cmd+P). The print stylesheet hides the navigation and prints only the care sheets.
4. **Fill in the templates.** Open the CSV files in `templates/` with any spreadsheet app (Excel, Google Sheets, LibreOffice, or a free online equivalent) and print blank copies.

## Who this is for

- New pet owners figuring out routines
- Busy households sharing pet care between family members
- Pet sitters who need clear, written instructions
- Anyone who wants less mental load around pet care

## Privacy (read first)

**Never share client or personal data with AI tools.** That includes names, addresses, phone numbers, veterinarian details, prescription numbers, microchip numbers, payment information, and client information. Use nicknames and general descriptions instead. Keep real contact info on paper only.

Prefer AI tools that run locally on your own computer when you can — nothing about your pet or your home leaves your device.

## Not veterinary advice

This project is educational information only. It is not veterinary advice, diagnosis, or treatment. AI can draft reminders and summaries, but it cannot examine your pet, diagnose illness, or prescribe medication. Always consult a licensed veterinarian for your pet's health needs.

## Verify it

Run the included verification script:

```
./scripts/verify.sh
```

It checks that all HTML pages load, links work, templates parse, the LICENSE has the correct copyright line, the README credits Asdale Dynamics, LLC, and no secrets or personal data are present.

## Credit

Written and published by **Asdale Dynamics, LLC**.
