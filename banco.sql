-- Execute no SQL Editor do Supabase. ATENÇÃO: leitura e inserção públicas.
create table if not exists public.participantes (
 id uuid primary key default gen_random_uuid(),
 nome text not null check (char_length(nome) between 1 and 60),
 telefone text not null check (telefone ~ '^[0-9]{10,13}$'),
 origem text not null check (char_length(origem) between 1 and 80),
 destino text not null check (char_length(destino) between 1 and 80),
 encontro text not null check (char_length(encontro) between 1 and 120),
 horario time not null,
 app text not null check (app in ('Uber','99','Outro aplicativo')),
 created_at timestamptz not null default now()
);
alter table public.participantes enable row level security;
grant usage on schema public to anon;
grant select, insert on public.participantes to anon;
create policy "Leitura publica" on public.participantes for select to anon using (true);
create policy "Cadastro publico" on public.participantes for insert to anon with check (true);
-- Sem UPDATE ou DELETE públicos. Exclusão deve ser feita por administrador no Supabase.
