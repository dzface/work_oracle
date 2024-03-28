
-- DML (DATA Manipulation Language) : 조회(Select), 삭제(Delete), 입력(Insert), 변경(Update)
CREATE TABLE DEPT_TEMP
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;
INSERT INTO DEPT_TEMP(deptno, dname, loc)
VALUES(50,'DATABASE', 'SEOUL');

INSERT into DEPT_TEMP values(60, 'NEWWORK', 'BUSAN');
INSERT into DEPT_TEMP(deptno, loc) VAlues(70, 'suwon') ;

INSERT into DEPT_TEMP values(80, 'M', '');

CREATE TABLE EMP_TEMP
    AS SELECT * 
        FROM EMP
        WHERE 1 != 1; -- 테이블을 복사하면서 데이터는 복사하고 싶지 않을 때 사용하는 방법

SELECT * FROM EMP_TEMP;
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
        VALUES (9001, '나영석', 'PRESIDENT', NULL, '2010/01/01', 9900, 1000, 10);

insert into emp_temp values(9001,'나영석','PRESIDENT', NULL,'2010/01/01', 990, 1000, 10);




Create table dept_temp2
As select * FROM dept;

select * from dept_temp2;

update dept_temp2
set loc ='SEOUL';

ROLLBACK;
UPDATE dept_temp2
set loc = '대전'
WHERE deptno = 40;
DELETE FROM DEPT_TEMP2 where loc = 'SEOUL';