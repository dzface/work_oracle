
--1. 사원번호가 7499인 사원의 이름, 입사일 부서번호 출력
SELECT ENAME,HIREDATE, e.DEPTNO
from EMP E JOIN DEPT D
ON e.DEPTNO = d.DEPTNO
where e.empno = 7499;

--2.이름이 ALLEN인 사원의 모든 정보 출력
SELECT *
from emp NATURAL join DEPT
where ENAME = 'ALLEN';

-- 3. 이름이 K보다 큰 글자로 시작하는 사원의 모든 정보 출력 안됨
SELECT ENAME
FROM EMP
where ename > 'K';
-- 4. 입사일이 81년 4월2일 보다 늦고, 82년 12월9일 보다 빠른 사원의 이름, 급여, 부서번호 출력
-- VSC 에서만 오류 발생
SELECT ENAME, SAL, DEPTNO
    FROM EMP
WHERE HIREDATE BETWEEN '1981/04/02' and '1982/12/09';

-- 5.급여가 1,600 보다 크고, 3000보다 작은 사원의 이름, 직무, 급여를 출력
SELECT ENAME, JOB, SAL
FROM emp
where sal > 1600  and SAL < 3000;

-- 6.입사일이 81년 이외에 입사한 사원의 모든 정보 출력
-- VSC 에서만 오류 발생 >> 날짜 형식 DD/MON/YY 로 바꿀 것
SELECT *
FROM EMP
where HIREDATE not BETWEEN '01/JAN/81' and '01/DEC/81';

-- 7.직업이 MANAGER와 SALESMAN인 사원의 모든 정보를 출력
SELECT *
FROM EMP
where JOB = 'MANAGER' OR JOB = 'SALESMAN'; 

-- 8.부서가 20번, 30번을 제외한 모든 사원의 이름, 사원번호, 부서번호를 출력
SELECT ENAME, EMPNO, DEPTNO
FROM EMP
where DEPTNO <> 30 AND DEPTNO <>20; 

-- 9.이름이 S로 시작하는 사원의 사원번호, 이름, 부서번호 출력
SELECT EMPNO,ENAME,DEPTNO
FROM EMP
WHERE ENAME like 'S%';

-- 10. 처음 글자는 관계없고, 두 번째 글자가 A인 사원의 모든 정보를 출력
SELECT * FROM EMP
where ENAME like '_A%';

-- 11. 커미션이 NULL이 아닌 사원의 모든 정보를 출력
SELECT * FROM EMP
WHERE COMM is NOT NULL;

SELECT * from emp;