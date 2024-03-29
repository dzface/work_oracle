
CREATE TABLE TABLE_NOTNULL (
    LOGIN_ID VARCHAR2(20) NOT NULL,
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
);


INSERT INTO TABLE_NOTNULL values('note37', '1234', NULL);

SELECT * FROM TABLE_NOTNULL;


-- UPDATE는 DML이며 열의 데이터를 수정
UPDATE TABLE_NOTNULL
SET TEL = '010-5006-4146'
where login_ID = 'note37';

ALTER TABLE TABLE_NOTNULL
MODIFY TEL NOT NULL;


-- 중복 값을 허용하지 않는 UNIQUE

CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PW VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
);

INSERT INTO TABLE_UNIQUE VALUES('안유진', 'ayj1234','010-1234-5678');
INSERT INTO TABLE_UNIQUE VALUES('장원영', 'ayj1234','010-1234-5678');
SELECT * FROM TABLE_UNIQUE;

-- 다른 테이블과 관계를 맺는 FOREIGN KEY(외래키)
-- 외래키는 서로 다른 테이블과 관계를 정의하는데 사용하는 제약조건
-- 참조하고 있는 기본키의 데이터타입과 일치해야하고, 외래키에 참조되고 있는 기본키는 삭제 할 수 없음

CREATE TABLE DEPT_FK(
    DEPTNO NUMBER(2) PRIMARY kEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMber(7,2),
    DEPTNO NUMBER(2) REFERENCES dept_FK(DEPTNO)
);
INSERT into DEPT_FK VALUES(10, '걸그룹','SEOUL');
INSERT into DEPT_FK VALUES(20, 'JYP','SEOUL');
insert into EMP_FK VALUES(9000,'안유진', '가수',8000,SYSDATE,5000,1000,10);
insert into EMP_FK VALUES(9001,'유나', '가수',8000,SYSDATE,5000,1000,20);
SELECT * FROM EMP_FK;
SELECT * FROM DEPT_FK;

DELETE FROM dept_FK
where DEPTNO = 20;

-- 데이터 사전 : 데이터베이스 메모리 성능, 사용자, 권한, 객체 등
SELECT * from user_indexes;
create index inx_emp_sal on emp(sal);

-- 테이블뷰 : 가상 테이블로 뷰는 하나 이상의 테이블을 조회하는 select문을 저장하는 객체
-- 사용 목적은 필요한 테이블만 제공하거나 테이블의 특정 열을 숨기는 등의 보안목적으로 사용할 수 있음

create view vw_emp20
as (select empno, ename, job, DEPTNO
from EMP
where DEPTNO = 20);

-- 규칙에 따라 순번을 생성하는 시퀀스
-- 시퀀스(Sequence)는 오라클 데이터베이스에서 특정규칙에 맞는 연속 숫자를 생성하는 객체

CREATE table DEPT_SEQUENCE
AS (SELECT * from DEPT WHERE 1 <>1);

select * from DEPT_SEQUENCE;
-- 시퀀스 테이블 만들기
create SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT by 10
start with 10
MAXVALUE 90
MINVALUE 0
NOCYCLE
cache 2;

select * from USER_SEQUENCES; -- 시퀀스테이블 조회

insert into DEPT_SEQUENCE VALUES(SEQ_DEPT_SEQUENCE.nextval, 'database','seoul');
select * from dept_SEQUENCE; 
insert into DEPT_SEQUENCE VALUES(SEQ_DEPT_SEQUENCE.nextval, 'REACT','suwon');
select * from dept_SEQUENCE; 

