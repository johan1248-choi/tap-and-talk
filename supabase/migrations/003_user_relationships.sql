create table public.user_relationships (

    id uuid primary key default gen_random_uuid(),

    elder_id uuid not null
        references profiles(id)
        on delete cascade,

    related_user_id uuid not null
        references profiles(id)
        on delete cascade,

    relationship relationship_type not null,

    created_at timestamptz default now()

);