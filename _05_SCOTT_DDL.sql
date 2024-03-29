
-- DDL(Data Definition Language) : 데이터베이스 데이터를 보관하고 관리하기 위해
-- 제공되는 여러객체의 생성(Create), 변경(Alter), 삭제(Drop) 관련 기능을 수행
-- DDL은 commit, rollback이 없음
CREATE TABLE EMP_DDL(
    EMPNO   NUMBER(4),
    ENAME   VARCHAR2(10),
    JOB     VARCHAR2(9),
    MGR     NUMBER(4),
    HIREDATE DATE,
    SAL     NUMBER(7, 2),
    COMM    NUMBER(7, 2),
    DEPTNO  NUMBER(2)
);

DROP table emp_DDL

SELECT * FROM EMP_DDL;

CREATE table DEPT_DDL
AS select * From DEPT;

select * from dept_DDL;

create table EMP_DDL_30
as select * from emp
where deptno = 30;
select * from emp_ddl_30;

-- 테이블을 변경하는 ALTER : 테이블에 새 열을 추가, 삭제하거나 열의 자료형 또는 길이변경
CREATE TABLE emp_ALTER
AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

-- alter에 ADD: 컬럼을 추가
ALTER TABLE EMP_ALTER
add HP VARCHAR(20);
SELECT * FROM EMP_ALTER;

-- ALTER에 rename : 열 이름을 변경
ALTER TABLE EMP_ALTER
RENAME COLUMN HP to TEL;

-- ALTER에 MODIFY : 열의 자료형을 변경
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(4); -- 기존데이터에 영향이 가는 변경은 불가

ALTER TABLE EMP_ALTER
MODIFY TEL VARCHAR(10); -- 크기는 줄였지만 영향 받는 해당 컬럼에 대한 데이터가 받지 않으면 가능


-- ALTER에 DROP : 특정 열을 삭제 할 때
ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

-- 테이블 이름 변경 : rename

RENAME EMP_ALTER to EMP_RENAME;
SELECT * FROM EMP_RENAME;

-- 테이블 데이터를 삭제하는 TRUNCATE
TRUNCATE TABLE EMP_RENAME; -- ROLLBACK 불가
DELETE FROM EMP_RENAME; -- ROLLBACK 가능
ROLLBACK;

-- 테이블을 삭제하는 Drop
DROP TABLE EMP_RENAME;

