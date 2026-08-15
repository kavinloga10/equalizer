-- Equalizer schema v7: remove practice questions confirmed as verbatim
-- copies of a third-party practice test, not original/AI-generated content.
-- Run this once in the Supabase SQL Editor (Project → SQL Editor → New query → Run).

-- These two were confirmed word-for-word identical (after whitespace
-- normalization) to "STEM Critical Thinking Practice Test – 2" (external
-- PDF reviewed 2026-08-15). Deleted by primary key to avoid any ambiguity
-- from text matching.
delete from public.questions where id in (1, 28);
