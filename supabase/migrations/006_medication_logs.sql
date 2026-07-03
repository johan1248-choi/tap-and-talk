create table public.medication_logs (

    id uuid primary key default gen_random_uuid(),

    medication_id uuid
        references medications(id)
        on delete cascade,

    elder_id uuid
        references profiles(id)
        on delete cascade,

    taken_at timestamptz default now(),

    status medication_status not null,

    source text default 'nfc',

    created_at timestamptz default now()

);