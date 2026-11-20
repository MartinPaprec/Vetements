-- À exécuter dans Supabase > SQL Editor > New query
create table if not exists public.wardrobes (
  user_id uuid primary key references auth.users(id) on delete cascade,
  inventory jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.wardrobes enable row level security;

-- Un utilisateur authentifié ne voit et ne modifie que sa propre ligne.
drop policy if exists "Read own wardrobe" on public.wardrobes;
create policy "Read own wardrobe" on public.wardrobes
for select to authenticated using ((select auth.uid()) = user_id);

drop policy if exists "Insert own wardrobe" on public.wardrobes;
create policy "Insert own wardrobe" on public.wardrobes
for insert to authenticated with check ((select auth.uid()) = user_id);

drop policy if exists "Update own wardrobe" on public.wardrobes;
create policy "Update own wardrobe" on public.wardrobes
for update to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

-- Facultatif : updated_at reflète chaque modification.
create or replace function public.touch_wardrobe_updated_at()
returns trigger language plpgsql set search_path = '' as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists wardrobe_updated_at on public.wardrobes;
create trigger wardrobe_updated_at before update on public.wardrobes
for each row execute function public.touch_wardrobe_updated_at();
