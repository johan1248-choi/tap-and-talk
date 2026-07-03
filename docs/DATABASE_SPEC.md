# Database Specification

## profiles

설명

사용자의 추가 정보를 저장한다.

Primary Key

id

Foreign Key

auth.users(id)

---

## medications

설명

사용자가 등록한 약 정보를 저장한다.

관계

profiles (1)

↓

medications (N)

---

## medicine_schedules

설명

복약 시간을 저장한다.

관계

medications (1)

↓

medicine_schedules (N)

---

## medication_logs

설명

실제 복약 기록

관계

medicine_schedules (1)

↓

medication_logs (N)