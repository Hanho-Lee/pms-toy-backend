-- 업무 패키지 테이블
CREATE TABLE tb_work_package (
    work_package_id   BIGSERIAL PRIMARY KEY,                      -- 업무 패키지 ID (PK)
    title             VARCHAR(100) NOT NULL,                      -- 제목
    content           TEXT,                                       -- 내용
    work_type         VARCHAR(20),                                -- 업무 유형 (개발/디자인 등)
    work_status       VARCHAR(20),                                -- 업무 상태 (진행중/완료 등)
    manage_id         BIGINT,                                     -- 담당자 ID
    manage_group_id   BIGINT,                                     -- 담당 그룹 ID
    start_date        DATE,                                  -- 시작일
    end_date          DATE,                                  -- 종료일
    create_id         BIGINT,                                     -- 생성자 ID
    create_dt         TIMESTAMP DEFAULT NOW(),                    -- 생성일시
    update_id         BIGINT,                                     -- 수정자 ID
    update_dt         TIMESTAMP,                                  -- 수정일시
    file_id           BIGINT,                                     -- 첨부파일 ID (FK)
    CONSTRAINT fk_work_package_file FOREIGN KEY (file_id)
        REFERENCES tb_file(file_id) ON DELETE SET NULL            -- 파일 삭제 시 NULL 처리
);

-- 인덱스 추가 (성능 향상)
CREATE INDEX idx_tb_work_package_status ON tb_work_package(work_status);   -- 상태별 조회
CREATE INDEX idx_tb_work_package_manage ON tb_work_package(manage_id);     -- 담당자별 조회
CREATE INDEX idx_tb_work_package_dates ON tb_work_package(start_date, end_date); -- 기간별 조회

-- 테이블 주석
COMMENT ON TABLE tb_work_package IS '업무 패키지 관리 테이블';
-- tb_work_package 컬럼 주석
COMMENT ON COLUMN tb_work_package.work_package_id IS '업무 패키지 ID (PK, 자동증가)';
COMMENT ON COLUMN tb_work_package.title IS '업무 패키지 제목';
COMMENT ON COLUMN tb_work_package.content IS '업무 패키지 내용';
COMMENT ON COLUMN tb_work_package.work_type IS '업무 유형 (예: 개발, 디자인, 기획)';
COMMENT ON COLUMN tb_work_package.work_status IS '업무 상태 (예: 대기, 진행중, 완료)';
COMMENT ON COLUMN tb_work_package.manage_id IS '담당자 ID';
COMMENT ON COLUMN tb_work_package.manage_group_id IS '담당 그룹 ID';
COMMENT ON COLUMN tb_work_package.start_date IS '시작일시';
COMMENT ON COLUMN tb_work_package.end_date IS '종료일시';
COMMENT ON COLUMN tb_work_package.create_id IS '생성자 ID';
COMMENT ON COLUMN tb_work_package.create_dt IS '생성일시';
COMMENT ON COLUMN tb_work_package.update_id IS '수정자 ID';
COMMENT ON COLUMN tb_work_package.update_dt IS '수정일시';
COMMENT ON COLUMN tb_work_package.file_id IS '첨부파일 ID (tb_file 참조)';


-- 파일 테이블
CREATE TABLE tb_file (
    file_id           BIGSERIAL PRIMARY KEY,                      -- 파일 ID (PK)
    origin_file_name  VARCHAR(255) NOT NULL,                      -- 원본 파일명
    saved_file_name   VARCHAR(255) NOT NULL,                      -- 저장 파일명 (UUID 등)
    file_path         VARCHAR(500) NOT NULL,                      -- 파일 저장 경로
    file_size         BIGINT,                                     -- 파일 크기 (bytes) - INT → BIGINT 권장
    file_ext          VARCHAR(10),                                -- 파일 확장자 (오타 수정: varchr → varchar)
    create_id         BIGINT,                                     -- 업로드자 ID
    create_dt         TIMESTAMP DEFAULT NOW()                     -- 업로드일시
);

-- 인덱스 추가 (성능 향상)
CREATE INDEX idx_file_create ON tb_file(create_id);                  -- 업로드자별 조회

-- 테이블 주석
COMMENT ON TABLE tb_file IS '파일 관리 테이블';
-- tb_file 컬럼 주석
COMMENT ON COLUMN tb_file.file_id IS '파일 ID (PK, 자동증가)';
COMMENT ON COLUMN tb_file.origin_file_name IS '원본 파일명 (사용자가 업로드한 파일명)';
COMMENT ON COLUMN tb_file.saved_file_name IS '저장 파일명 (서버에 저장된 파일명, UUID 등)';
COMMENT ON COLUMN tb_file.file_path IS '파일 저장 경로';
COMMENT ON COLUMN tb_file.file_size IS '파일 크기 (bytes)';
COMMENT ON COLUMN tb_file.file_ext IS '파일 확장자 (예: pdf, jpg, xlsx)';
COMMENT ON COLUMN tb_file.create_id IS '업로드자 ID';
COMMENT ON COLUMN tb_file.create_dt IS '업로드일시';
