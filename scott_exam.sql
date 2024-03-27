-- 1. **EMP테이블에서 COMM 의 값이 NULL이 아닌 정보 조회**
SELECT * FROM emp
WHERE NOT COMM is NULL;
-- 2. **EMP테이블에서 커미션을 받지 못하는 직원 조회**
SELECT * FROM emp
WHERE COMM is NULL or COMM =0;
-- 3. **EMP테이블에서 관리자가 없는 직원 정보 조회**
SELECT * FROM emp
WHERE MGR is NULL;
-- 4. **EMP테이블에서 급여를 많이 받는 직원 순으로 조회**
SELECT * FROM emp
order by sal;
-- 5. **EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회**
SELECT * FROM emp
order by sal, sal DESC;
-- 6. **EMP테이블에서 사원번호, 사원명,직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)**
SELECT EMPNO, ENAME,JOB,HIREDATE FROM emp
order by HIREDATE;
-- 7. **EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)**
SELECT EMPNO, ENAME FROM emp
order by EMPNO;
-- 8. **EMP테이블에서 사번, 입사일, 사원명, 급여 조회  (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)**
SELECT EMPNO, HIREDATE,ENAME, SAL FROM emp
order by DEPTNO, HIREDATE;
-- 9. **오늘 날짜에 대한 정보 조회**
SELECT SYSDATE FROM dual;
-- 10. **EMP테이블에서 사번, 사원명, 급여 조회  (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)**
SELECT EMPNO, ENAME, ROUND(SAL,-2) FROM emp
order by DEPTNO, HIREDATE;
-- 11. **EMP테이블에서 사원번호가 홀수인 사원들을 조회**
SELECT * FROM EMP;

-- 12. **EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)**
SELECT ENAME, HIREDATE FROM EMP

-- 13. **EMP테이블에서 9월에 입사한 직원의 정보 조회**
SELECT * 
    FROM EMP
    WHERE EXTRACT(MONTH FROM HIREDATE) = 9;
-- 14. **EMP테이블에서 81년도에 입사한 직원 조회**
SELECT * 
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 81;
-- 15. **EMP테이블에서 이름이 'E'로 끝나는 직원 조회**
SELECT * FROM EMP
WHERE ENAME like '%E';
-- 16. **EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회**
SELECT * FROM EMP
WHERE ENAME like '__R%';
-- - **LIKE 사용**
-- 1. **EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회**
-- 2. **EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회**
SELECT * FROM EMP
WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12 >=38;
-- 3. **오늘 날짜에서 년도만 추출**