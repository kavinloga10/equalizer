-- Equalizer schema v6: unique-visitor counter for the landing page
-- Run this once in the Supabase SQL Editor (Project → SQL Editor → New query → Run).

-- Stores a salted hash of each visitor's IP, not the raw IP, so the table
-- can only answer "how many unique visitors" — not "who visited."
create table if not exists public.site_visits (
  ip_hash text primary key,
  first_seen timestamptz not null default now()
);

-- RLS is on with no policies at all. Only the backend's service-role key
-- (used from server.js, never shipped to the browser) can read or write
-- this table — the anon key the frontend uses has zero access to it.
alter table public.site_visits enable row level security;
