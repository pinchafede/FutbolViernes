-- ============================================================
--  VIERNES FC — SQL para Supabase
--  Pegá esto en: Supabase → SQL Editor → New query → Run
-- ============================================================

-- Jugadores
create table jugadores (
  id      bigint primary key generated always as identity,
  nombre  text not null,
  apodo   text,
  color   text default '#C8F500',
  activo  boolean default true
);

-- Partidos
create table partidos (
  id          bigint primary key generated always as identity,
  fecha       date not null,
  equipo_a    text default 'Equipo A',
  equipo_b    text default 'Equipo B',
  goles_a     int default 0,
  goles_b     int default 0,
  resultado   text check (resultado in ('a','b','draw')),
  mvp_abierto boolean default false,
  created_at  timestamptz default now()
);

-- Stats por jugador por partido
create table partido_jugadores (
  id          bigint primary key generated always as identity,
  partido_id  bigint references partidos(id) on delete cascade,
  jugador_id  bigint references jugadores(id),
  equipo      text check (equipo in ('a','b')),
  goles       int default 0
);

-- Votos MVP
create table mvp_votos (
  id                bigint primary key generated always as identity,
  partido_id        bigint references partidos(id) on delete cascade,
  jugador_votado_id bigint references jugadores(id),
  created_at        timestamptz default now()
);

-- ============================================================
--  PERMISOS (Row Level Security)
--  Permite lectura pública y escritura pública (los votos)
-- ============================================================

alter table jugadores        enable row level security;
alter table partidos         enable row level security;
alter table partido_jugadores enable row level security;
alter table mvp_votos        enable row level security;

-- Lectura pública para todos
create policy "lectura publica" on jugadores         for select using (true);
create policy "lectura publica" on partidos          for select using (true);
create policy "lectura publica" on partido_jugadores for select using (true);
create policy "lectura publica" on mvp_votos         for select using (true);

-- Escritura pública (la app maneja la seguridad por contraseña de admin)
create policy "escritura publica" on jugadores         for insert with check (true);
create policy "escritura publica" on partidos          for insert with check (true);
create policy "escritura publica" on partido_jugadores for insert with check (true);
create policy "escritura publica" on mvp_votos         for insert with check (true);

-- Update para cerrar votación MVP
create policy "update publico" on partidos for update using (true);
