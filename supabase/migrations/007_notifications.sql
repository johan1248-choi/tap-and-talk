create table public.notifications (

    id uuid primary key default gen_random_uuid(),

    receiver_id uuid
        references profiles(id)
        on delete cascade,

    medication_log_id uuid
        references medication_logs(id)
        on delete cascade,

    type notification_type,

    is_sent boolean default false,

    sent_at timestamptz,

    created_at timestamptz default now()

);