-- Equalizer schema v5: require policy acceptance for existing accounts too
-- Run this once in the Supabase SQL Editor (Project → SQL Editor → New query → Run).

-- Defaults to false, so every account that existed before this migration is
-- treated as not-yet-accepted and gets prompted on next login. New signups
-- explicitly set this to true at insert time (they already checked the box).
alter table public.profiles
  add column if not exists policy_accepted boolean not null default false;
