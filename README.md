# Equalizer

**Level the playing field.** A free web app for students preparing for selective admissions exams — built because quality test prep usually costs hundreds of dollars, and that shouldn't decide who gets in.

🔗 **Live:** [equalizer-app.com](https://equalizer-app.com)

## What it does

- **Practice** — 430+ original questions across Math/Quant, Logic/Reasoning, and Spatial/Geometric, with spaced-repetition review that resurfaces what you got wrong.
- **Mock Tests** — full-length, timed tests that mirror the real exam format.
- **AI Tutor** — when you miss a question, a docked chat panel opens scoped to that exact question (not a generic chatbot) and walks you through the reasoning, step by step.
- **Writing Assessment** — an essay-writing practice test graded against an official, publicly released admissions rubric.
- **Formula Bank, Progress tracking, Leaderboard, Daily streaks** — the usual study-habit scaffolding.
- **Equalizer Pro** (optional, $4.99/mo) — unlimited AI Tutor chat and AI-generated custom practice sets. Core test prep above is free for every student, always; Pro only adds extras on top, it never gates admissions prep itself.

## Tech stack

- **Frontend:** plain HTML, CSS, and vanilla JavaScript — no framework, no build step. Deliberately lightweight so it stays fast on older school Chromebooks, not just new laptops.
- **Backend:** Node.js + [Express](https://expressjs.com/), deployed on [Render](https://render.com/). Proxies every AI call so API keys never reach the browser.
- **Database & Auth:** [Supabase](https://supabase.com/) — Postgres with Row-Level Security, so each student can only ever read or write their own data.
- **AI:** [Google Gemini API](https://ai.google.dev/) for tutoring and AI-generated practice questions.
- **Payments:** [Stripe](https://stripe.com/) Checkout (subscriptions), for the optional Pro tier only.

## Running it locally

Requirements: Node.js 18+, a free [Supabase](https://supabase.com/) project, and a [Gemini API key](https://ai.google.dev/).

```bash
git clone https://github.com/kavinloga10/equalizer.git
cd equalizer
npm install
```

Create a `.env` file (see `.env.example`):

```
GEMINI_API_KEY=your-key-here
```

Then run the schema in `supabase/schema.sql` (and every `supabase/migrations_v*.sql` file, in order) via your Supabase project's SQL editor, and set `SUPABASE_URL` / `SUPABASE_ANON_KEY` in `index.html` to match your own project.

```bash
npm start
```

Open <http://localhost:8743> — the same server serves both the static frontend and the `/api/*` backend.

The optional Pro subscription tier needs three more environment variables (`STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_SECRET`, `SUPABASE_SERVICE_ROLE_KEY`) — everything else runs fully without them.

## Project structure

```
index.html              The entire frontend: markup, styles hook, and all client-side JS
styles.css              All styling
server.js               Express backend: Gemini proxy endpoints, Stripe checkout + webhook
supabase/schema.sql      Base database schema
supabase/migrations_*.sql  Sequential schema changes, run in order
policy.html              Terms & Privacy Policy
render.yaml              Render deployment config
```

## License

MIT
