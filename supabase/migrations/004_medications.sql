create table public.medications (

    id uuid primary key default gen_random_uuid(),

    elder_id uuid not null
        references profiles(id)
        on delete cascade,

    medicine_name text not null,

    dosage text not null,

    take_time time not null,

    meal meal_type,

    memo text,

    start_date date,

    end_date date,

    is_active boolean default true,

    created_at timestamptz default now(),

    updated_at timestamptz default now()

);