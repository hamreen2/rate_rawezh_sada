-- Rate Rawezh Ayoub and Sada Samad.
-- Run in the Supabase SQL Editor (project class-wall, shared by all groups).

create table if not exists public.student_feedback (
  id          bigint generated always as identity primary key,
  student     text not null check (student in ('Rawezh Ayoub', 'Sada Samad')),
  name        text check (char_length(name) <= 40),
  comment     text check (char_length(comment) <= 280),
  rating      int  not null check (rating between 1 and 5),
  created_at  timestamptz not null default now()
);

-- Row Level Security: the public key may only READ and INSERT. No update, no delete.
alter table public.student_feedback enable row level security;

create policy "anyone can read"  on public.student_feedback for select to anon using (true);
create policy "anyone can post"  on public.student_feedback for insert to anon with check (true);

-- Realtime: lets the screen update the moment a row is inserted.
alter publication supabase_realtime add table public.student_feedback;
