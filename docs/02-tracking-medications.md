# Tracking Medications with AI

Help your pet stay on schedule — and help you remember what was given, when, and by whom.

## Why it matters

Missed or double-dosed medications are stressful for everyone. A simple log removes guesswork, especially when more than one person cares for the pet.

## Step 1: Set up a medication log

Create a simple table (paper, notebook, or spreadsheet). Columns:

| Pet | Medication | Dose | When | Given by | Done? |
|-----|------------|------|------|----------|-------|

Template: `templates/medication-log.csv`

## Step 2: Ask AI to build a reminder schedule

Use general details only. Never include your address, vet's name, or prescription numbers.

**Example prompt:**

> "I have an 8-year-old cat who needs medication every 12 hours. Help me write a simple daily reminder schedule and a short text I can send to a family member explaining what to give and when. Use plain language."

**What to do with the answer:**

1. Read it carefully.
2. Check every dose and time against your vet's instructions.
3. Adjust wording until it sounds like you.
4. Print or write it out. Post it where you give medications.

## Step 3: Use AI for refill reminders

Ask your AI to draft a refill checklist:

> "Help me write a medication refill checklist: when to call the vet, what information to have ready, and how far ahead to request refills."

Keep the checklist near your pet's supplies.

## Safety checks (always do these)

- [ ] Compare AI drafts to your vet's written instructions before using them
- [ ] Never change a dose because an AI suggested it
- [ ] Log each dose right after giving it, not from memory later
- [ ] If something looks wrong in an AI suggestion, ignore it and call your vet

## Example log entry (fictional)

| Date | Pet | Medication | Dose | Time | Given by | Notes |
|------|-----|------------|------|------|----------|-------|
| Oct 1 | Milo | Example medicine | 5 mg | 8:00 AM | Alex | None |

Print the blank template in `templates/` and fill it in by hand, or open it in any spreadsheet app.

## Credit

Written and published by **Asdale Dynamics, LLC**. Education only — not veterinary advice.