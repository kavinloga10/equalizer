-- Equalizer schema v4: admin question editing + spaced-repetition review
-- Run this once in the Supabase SQL Editor (Project → SQL Editor → New query → Run).

-- Owner-only write access to questions (self-selected "teacher" role at signup is
-- not a real security boundary, so this is gated to one specific account instead).
create policy "owner can insert questions" on public.questions for insert
  with check (auth.jwt() ->> 'email' = 'kavinloga10@gmail.com');
create policy "owner can update questions" on public.questions for update
  using (auth.jwt() ->> 'email' = 'kavinloga10@gmail.com');
create policy "owner can delete questions" on public.questions for delete
  using (auth.jwt() ->> 'email' = 'kavinloga10@gmail.com');

alter table public.progress
  add column if not exists question_schedule jsonb not null default '{}';
