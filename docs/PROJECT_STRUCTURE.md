# 📂 Tap & Talk Project Structure

## 프로젝트 구조

```
tap-and-talk
│
├── app/                # Expo Router 화면
├── assets/             # 이미지 및 아이콘
├── components/         # 재사용 컴포넌트
├── constants/          # 상수
├── docs/               # 프로젝트 문서
├── hooks/              # Custom Hook
├── lib/                # 외부 라이브러리 설정
├── services/           # API / Business Logic
├── supabase/           # Supabase 관련
├── types/              # TypeScript 타입
├── utils/              # 공통 함수
```

---

## 개발 원칙

- 화면(UI)와 비즈니스 로직 분리
- TypeScript 적극 활용
- 서비스 계층 분리
- 공통 함수는 utils 사용
- DB 접근은 services에서만 수행

---

## 폴더 역할

### app

화면

### components

재사용 가능한 UI

### services

Supabase 호출

### lib

외부 라이브러리 초기화

### types

Interface

Type

Enum

### utils

공통 함수

Validation

Date Formatting

Time Formatting