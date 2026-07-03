# 🗄️ Tap & Talk Database Design (ERD v1.0)

> Last Updated: 2026-07-03  
> Database: PostgreSQL (Supabase)

---

# 1. 프로젝트 개요

**Tap & Talk**는 NFC 태그를 활용하여 어르신의 복약 여부를 기록하고,
보호자 및 복지사에게 실시간으로 복약 정보를 전달하는 스마트 복약 관리 시스템이다.

본 문서는 데이터베이스 설계의 기준 문서이며,
추후 SQL 생성 및 API 개발의 기준으로 사용된다.

---

# 2. 데이터베이스 설계 원칙

- Database : PostgreSQL (Supabase)
- Primary Key : UUID
- Foreign Key 사용
- 모든 테이블은 `created_at` 포함
- 필요한 경우 `updated_at` 추가
- 컬럼명은 snake_case 사용
- 테이블명은 복수형 사용

예시

users

medications

notifications

---

# 3. 사용자(Role)

| Role | 설명 |
|------|------|
| elder | 어르신 |
| guardian | 보호자 |
| social_worker | 복지사 |

---

# 4. 테이블 목록

| Table | 설명 |
|--------|------|
| users | 사용자 정보 |
| elder_guardians | 어르신-보호자 연결 |
| medications | 복약 일정 |
| nfc_tags | NFC 태그 |
| medication_logs | 복약 기록 |
| notifications | 알림 기록 |

---

# 5. 테이블 상세

---

## users

### 설명

모든 사용자를 하나의 테이블에서 관리한다.

---

### Columns

| Column | Type | Description |
|---------|------|-------------|
| id | UUID | PK |
| role | TEXT | elder / guardian / social_worker |
| name | TEXT | 이름 |
| phone | TEXT | 전화번호 |
| birth | DATE | 생년월일 |
| country | TEXT | 국가 |
| created_at | TIMESTAMP | 생성일 |
| updated_at | TIMESTAMP | 수정일 |

---

## elder_guardians

### 설명

어르신과 보호자의 연결 정보를 저장한다.

한 명의 보호자가 여러 명의 어르신을 관리할 수 있으며,
한 명의 어르신도 여러 명의 보호자를 가질 수 있다.

---

### Columns

| Column | Type |
|---------|------|
| id | UUID |
| elder_id | UUID |
| guardian_id | UUID |
| relationship | TEXT |
| created_at | TIMESTAMP |

---

## medications

### 설명

복약 스케줄을 저장한다.

---

### Columns

| Column | Type |
|---------|------|
| id | UUID |
| elder_id | UUID |
| medicine_name | TEXT |
| dosage | TEXT |
| meal_type | TEXT |
| schedule_time | TIME |
| start_date | DATE |
| end_date | DATE |
| is_active | BOOLEAN |
| created_at | TIMESTAMP |

---

## nfc_tags

### 설명

약통에 부착된 NFC 태그 정보를 저장한다.

---

### Columns

| Column | Type |
|---------|------|
| id | UUID |
| medication_id | UUID |
| tag_uid | TEXT |
| created_at | TIMESTAMP |

---

## medication_logs

### 설명

실제 복약 기록을 저장한다.

---

### Columns

| Column | Type |
|---------|------|
| id | UUID |
| elder_id | UUID |
| medication_id | UUID |
| tag_id | UUID |
| taken_at | TIMESTAMP |
| status | TEXT |
| device_id | TEXT |
| created_at | TIMESTAMP |

---

### Status

SUCCESS

LATE

MISSED

DUPLICATE

---

## notifications

### 설명

알림 발송 이력을 저장한다.

---

### Columns

| Column | Type |
|---------|------|
| id | UUID |
| receiver_id | UUID |
| log_id | UUID |
| type | TEXT |
| is_success | BOOLEAN |
| sent_at | TIMESTAMP |

---

# 6. 테이블 관계

users

↓

1 : N

↓

medications

---

users

↓

N : M

↓

elder_guardians

---

medications

↓

1 : 1

↓

nfc_tags

---

medications

↓

1 : N

↓

medication_logs

---

medication_logs

↓

1 : N

↓

notifications

---

# 7. 향후 추가 예정 테이블

향후 프로젝트 확장 시 아래 테이블을 추가할 예정이다.

- hospitals
- pharmacies
- prescriptions
- medicine_images
- devices
- emergency_contacts
- push_tokens

---

# 8. ERD 버전

| Version | 내용 |
|----------|------|
| v1.0 | MVP 데이터베이스 설계 |
| v2.0 | 통계 및 다국어 지원 |
| v3.0 | 병원·약국 연동 |
