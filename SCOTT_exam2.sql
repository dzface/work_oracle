
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
where not ENAME in('A%','B%','C%','D%','E%','F%','G%','H%','I%','J%','K%')
order by ENAME;
-- 4. 입사일이 81년 4월2일 보다 늦고, 82년 12월9일 보다 빠른 사원의 이름, 급여, 부서번호 출력
SELECT ENAME, SAL, DEPTNO
    FROM EMP
WHERE HIREDATE BETWEEN '1981/04/02' and '1982/12/09';
