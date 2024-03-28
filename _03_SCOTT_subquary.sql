
-- 서브쿼리 :쿠리문 내에 포함되는 쿼리문을 의미, 일반적으로는 SELECT문의 WHERE 절에서 사용
-- 단일행 서브쿼리와 다중행 서브쿼리가 있음

SELECT dname
FROM DEPT 
WHERE DEPTNO = (SELECT DEPTNO 
                FROM EMP
                WHERE ename = 'KING'
                );

-- JONES보다 급여가 많은 사람 
SELECT * FROM EMP
WHERE SAL > (SELECT SAL
                FROM EMP
                WHERE ENAME = 'JONES');

-- ALLEN의 추가 수당보다 많은 수당을 받는 사원정보 출력
SELECT * FROM EMP
WHERE COMM > (SELECT COMM
                FROM EMP
                WHERE ENAME = 'ALLEN');

SELECT * FROM EMP
WHERE HIREDATE < (SELECT HIREDATE FROM EMP
                    WHERE ENAME = 'JAMES');

SELECT e.EMPNO, e.ENAME, e.JOB, e.SAL, d.DEPTNO, d.DNAME, d.loc
FROM EMP e JOIN DEPT D
ON e.DEPTNO = d.DEPTNO
WHERE e.DEPTNO = 20 
AND e.SAL > (SELECT AVG(sal) FROM EMP);

-- 실행 결과가 여러개인 다중형 서브쿼리
-- IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있으면 true
-- ANY, SOME : 메인쿼리의 조건식을 만족하는 서브퀄의 결과가 하나 이상이면 true
-- ALL : 메인 쿼리의 조건식을 서브퀄의 결과가 모두 만족하면 true
-- EXISTS : 서브쿼리의 결과가 존재하면 true


-- 각 부서별 최고임금 결과 출력
SELECT * FROM EMP 
WHERE sal IN(SElect MAX(sal) FROM EMP GROUP BY DEPTNO);

-- 
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE sal > any(SELECT sal FROM EMP WHERE job = 'SALESMAN');

-- ALL : 다중행으로 반환되는 서브쿼리의 결과를 모두 만족해야 true 임
SELECT * FROM EMP
WHERE SAL < ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE sal > all (SELECT sal FROM EMP WHERE JOB = 'MANAGER');

SELECT * FROM EMP
WHERE EXISTS (SELECT dname FROM DEPT WHERE DEPTNO = 40);

-- 다중열 서브쿼리 : 서브쿼리의 결과가 두 개이상의 컬럼으로 반환되어 메인 쿼리에 전달

SELECT EMPNO, ENAME, sal, DEPTNO
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, SAL FROM EMP
                        WHERE DEPTNO = 30);

SELECT * FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                        FROM EMP
                        GROUP BY DEPTNO);

-- FROM 절에서 사용하는 서브쿼리(인라인 뷰): 
-- 테이블 내에 데이터규모가 너무 크거나, 불필요하거나, 보안을 위해 사용
SELECT e10.empno, e10.ename, e10.DEPTNO, d.dname, d.loc
FROM (SELECT EMPNO, ENAME, DEPTNO FROM emp WHERE DEPTNO = 10) e10 join dept D -- 급여를 제하고 테이블 가져옴
on e10.DEPTNO =d.DEPTNO;

-- SELECT절에서 사용하는 서브쿼리 : 스칼라 서브쿼리라고 부름
-- SELECT절에 사용되는 서브쿼리는 반드시 하나의 결과만 반환되어야함
SELECT empno,ENAME, job, sal, 
    (SELECT GRADE FROM SALGRADE
    WHERE e.sal BETWEEN LOSAL AND HISAL) AS SALGRADE, DEPTNO,
    (SELECT DNAME FROM DEPT d
    WHERE e.DEPTNO = d. DEPTNO) As DNAME
FROM EMP e;

SELECT ename, DEPTNO, SAL, (SELECT TRUNC(AVG(SAL)) FROM EMP
                           WHERE DEPTNO = e.DEPTNO AS "부서별 급여 평균")
FROM emp e;

SELECT EMPNO, ENAME, 
Case WHEN DEPTNO = (SELECT DEPTNO FROM DEPT where loc = 'NEW YORK')
THEN '본사'
ELSE '분점'
end as "소속"
FROM emp
order by 소속 DESC;

CREATE table ee,pnr