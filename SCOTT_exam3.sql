-- 연습문제 1 :전체 사원 중 ALLEN과 같은 직책(JOB)인 사원들의 사원 정보,
-- 부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
SELECT e.* FROM EMP e
WHERE JOB IN (SELECT JOB from EMP
              WHERE ENAME = 'ALLEN');

-- 연습문제 2 : 전체 사원의 평균 급여(SAL)보다
-- 높은 급여를 받는 사원들의 사원 정보, 부서 정보, 급여 등급
-- 정보를 출력하는 SQL문을 작성하세요
-- (단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는
-- 사원 번호를 기준으로 오름차순으로 정렬하세요).

SELECT e.*, d.*, grade
from emp e join DEPT D
ON e.DEPTNO = d.DEPTNO
JOIN SALGRADE s on e.sal BETWEEN s.losal and s.hisal
where e.sal > (SELECT AVG(SAL) fROM emp)
ORDER by e.SAL, e.EMPNO;

-- 연습문제 3 : 10번 부서에 근무하는 사원 중 30번 부서에는
-- 존재하지 않는 직책을 가진 사원들의 사원 정보, 부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.



-- 연습문제 4 : 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원 정보,
-- 급여 등급 정보를 다음과 같이 출력하는 SQL문을 작성하세요
-- (단 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원 번호를 기준으로 오름차순으로 정렬하세요).

