-- =====================================================
-- Tap & Talk
-- Initial Database Setup
-- =====================================================

-- UUID
create extension if not exists pgcrypto;

-- ======================================
-- ENUMS
-- ======================================

create type user_role as enum (
    'elder',
    'guardian',
    'social_worker'
);

create type relationship_type as enum (
    'guardian',
    'social_worker'
);

create type meal_type as enum (
    'before_meal',
    'after_meal',
    'empty_stomach',
    'before_sleep'
);

create type medication_status as enum (
    'taken',
    'late',
    'missed',
    'duplicate'
);

create type notification_type as enum (
    'medicine_time',
    'medicine_taken',
    'medicine_missed'
);