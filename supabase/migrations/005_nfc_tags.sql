create table public.nfc_tags (

    id uuid primary key default gen_random_uuid(),

    medication_id uuid unique
        references medications(id)
        on delete cascade,

    uid text unique not null,

    is_active boolean default true,

    created_at timestamptz default now()

);