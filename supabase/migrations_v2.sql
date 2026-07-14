-- Equalizer schema v2: badges, review mode, daily goals, onboarding, weak-topic tracking
-- Run this once in the Supabase SQL Editor (Project → SQL Editor → New query → Run).
-- Safe to run on the live project: only adds columns, doesn't touch existing data.

alter table public.progress
  add column if not exists daily_goal int not null default 10,
  add column if not exists missed_questions jsonb not null default '{"tj":[],"acl":[]}',
  add column if not exists category_stats jsonb not null default '{}',
  add column if not exists mock_tests_completed int not null default 0,
  add column if not exists best_mock_score int not null default 0,
  add column if not exists writing_practices_completed int not null default 0,
  add column if not exists badges_seen jsonb not null default '[]';

alter table public.profiles
  add column if not exists target_test text,
  add column if not exists target_date date;
