-- =====================================================
-- Tap & Talk
-- Enable Row Level Security
-- =====================================================

---------------------------------------------------------
-- Enable RLS
---------------------------------------------------------

ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_relationships ENABLE ROW LEVEL SECURITY;
ALTER TABLE medications ENABLE ROW LEVEL SECURITY;
ALTER TABLE nfc_tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE medication_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

---------------------------------------------------------
-- Profiles
---------------------------------------------------------

CREATE POLICY "profiles_select_own"
ON profiles
FOR SELECT
USING (
    auth.uid() = id
);

CREATE POLICY "profiles_insert_own"
ON profiles
FOR INSERT
WITH CHECK (
    auth.uid() = id
);

CREATE POLICY "profiles_update_own"
ON profiles
FOR UPDATE
USING (
    auth.uid() = id
);