-- Equalizer Pro: subscription status, set by the Stripe webhook (server.js),
-- never written directly by the client.
alter table public.profiles add column if not exists is_pro boolean not null default false;
alter table public.profiles add column if not exists stripe_customer_id text;
alter table public.profiles add column if not exists stripe_subscription_id text;
