-- Equalizer Supabase schema
-- Run this once in the Supabase SQL Editor (Project → SQL Editor → New query → Run).

create table public.profiles (
  id uuid references auth.users on delete cascade primary key,
  name text not null,
  role text not null default 'student',
  grade text,
  created_at timestamptz not null default now()
);

create table public.progress (
  user_id uuid references auth.users on delete cascade primary key,
  questions_answered int not null default 0,
  correct_answers int not null default 0,
  study_minutes numeric not null default 0,
  streak int not null default 0,
  last_active_date date,
  points int not null default 0,
  subject_stats jsonb not null default '{"tj":{"correct":0,"total":0},"acl":{"correct":0,"total":0}}',
  recent_activity jsonb not null default '[]',
  daily_activity jsonb not null default '{}',
  daily_study_minutes jsonb not null default '{}',
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.progress enable row level security;

create policy "own profile select" on public.profiles for select using (auth.uid() = id);
create policy "own profile insert" on public.profiles for insert with check (auth.uid() = id);
create policy "own profile update" on public.profiles for update using (auth.uid() = id);

create policy "own progress select" on public.progress for select using (auth.uid() = user_id);
create policy "own progress insert" on public.progress for insert with check (auth.uid() = user_id);
create policy "own progress update" on public.progress for update using (auth.uid() = user_id);

-- Narrow view so students can see each other's name + points for the leaderboard,
-- without RLS blocking cross-user reads (a Postgres view runs with the privileges
-- of its owner by default, so it can expose just these two columns for every user
-- even though the underlying tables restrict each user to their own row).
create view public.leaderboard_view as
  select pr.user_id, p.name, pr.points
  from public.progress pr
  join public.profiles p on p.id = pr.user_id;

grant select on public.leaderboard_view to authenticated;
