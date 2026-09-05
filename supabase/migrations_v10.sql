-- Equalizer schema v10: track when each question was last updated, so the
-- app can show students a "question bank last refreshed" indicator (built
-- to give confidence the content is actively maintained, not stale).
alter table public.questions
  add column if not exists updated_at timestamptz not null default now();

create or replace function public.set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists questions_set_updated_at on public.questions;
create trigger questions_set_updated_at
  before update on public.questions
  for each row
  execute function public.set_updated_at();
