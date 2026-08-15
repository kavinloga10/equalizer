-- Equalizer schema v6: public student-count stat for the landing page
-- Run this once in the Supabase SQL Editor (Project → SQL Editor → New query → Run).

-- Cleans up the unique-visitor/IP-tracking table from an earlier draft of
-- this feature, in case it was already applied — replaced by the simpler
-- approach below (count registered students directly).
drop table if exists public.site_visits;

-- profiles has RLS restricting reads to "your own row" (see schema.sql),
-- so a logged-out visitor can't just select count(*) from it. This
-- function runs as its owner (security definer) to get past that, but
-- only ever returns a single number — never any row data — so it's safe
-- to expose to anon.
create or replace function public.get_student_count()
returns bigint
language sql
security definer
set search_path = public
as $$
  select count(*) from public.profiles where role = 'student';
$$;

grant execute on function public.get_student_count() to anon, authenticated;
