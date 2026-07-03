create table public.profiles (

    id uuid primary key
        references auth.users(id)
        on delete cascade,

    name text not null,

    phone text,

    birth date,

    role user_role not null,

    country text default 'KR',

    created_at timestamptz not null default now(),

    updated_at timestamptz not null default now()

);