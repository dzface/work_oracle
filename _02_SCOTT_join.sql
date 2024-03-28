
-- 조인(join) : 두 개 이상의 테이블에서 데이터를 가져와서 연결하는데 사용되는 SQL 기능
-- 테이블에 대한 식별 값인 Primary Key와 테이블간의 공통 값인 Foreign key 값을 사용하여 조인
-- 내부조인 (동등 조인, inner join)이며, 오라클 방식, 양쪽에 동일한 컬럼이 있는 경우 테이블 이름을 표시해야 함
SELECT *
from EMP, DEPT
order by EMPNO; -- 테이블을 두개 가져올경우 중복값이 행 X 행으로 출력 됨

SELECT empno, ename, mgr, sal, E.DEPTNO
from EMP e, DEPT d -- e, d 테이블 별칭
where e.DEPTNO = d.DEPTNO
AND sal >=3000;

-- ANSI 방식
SELECT EMPNO, ENAME, MGR, ,sal, e.DEPTNO
FROM emp e join dept D
on e.DEPTNO = d.DEPTNO;
where sal >= 3000;

-- EMP 테이블 별칭을 E, 로 DEPT 테이블 별칭은 D로 하여 다음과 같이 등가 조인을 했을 때,
-- 급여가 2500 이하이고 사우너번호가 9999 이하인 사원의 정보가 출력되도록 작성

SELECT E.EMPNO, E.ename, D.deptno, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
on E.DEPTNO = D.DEPTNO
where sal <=2500 and empno <=9999
order by empno;

-- 비등가 조인 : 동일한 컬럼이 없을 때 사용하는 조인(일반적으로 많이 사용되지 않음)
select * FROM EMP;
select * FROM SALGRADE;
SELECT e.ENAME, e.sal, s.grade
FROM EMP e JOIN SALGRADE S
on e.SAL BETWEEN s.LOSAL and s.HISAL;

-- 자체 조인 : 자기자신의 테이블을 조인하여 그 테이블의 데이터를 한번 더 결과를 찾아 낼 때 사용
SELECT e1.EMPNO, e1.ENAME, e1.MGR,
e2.EMPNO AS "상관의 사원번호",
e2.ENAME AS "상관 이름"
From EMP e1 JOIN EMP e2
ON e1.MGR = e2.EMPNO;

-- 외부조인: (RIGHT outer join): 부족한 부분이 있는 행이 있는 데이블에 (+)
SELECT e.ENAME, e.DEPTNO, d.DNAME
from emp e, DEPT D
where e.DEPTNO(+) = d.DEPTNO -- 왼쪽에 결핍된 것을 오른쪽 테이블에서 채워넣어라
order by e.DEPTNO;

SELECT e.ename, e.deptno, d.DNAME
FROM emp e RIGHT OUTER JOIN DEPT D -- 오른쪽 데이터를 왼쪽 테이블로 채움 (LEFT, RIGHT, FULL)
on e.DEPTNO = d.DEPTNO 
order by e.DEPTNO;

-- NATURAL JOIN : 동등조인을 사용하는 다른방법, WHERE 조건절 없이사용
-- 두 테이블의 같은 열을 자동으로 연결
SELECT e.empno, e.ENAME, d.DNAME, DEPTNO -- DEPTNO는 겹치는 열로 자동으로 적용되고, 테이블 선택을 해주면 안됨
from emp e NATURAL JOIN DEPT d;

-- JOIN USING : 동등조인(등가조인)을 대신하는 방법
SELECT e.empno, e.ENAME, d.DNAME, DEPTNO, e.SAL
FROM emp e JOIN DEPT d USING(DEPTNO)
where sal >= 3000
order by deptno, e.EMPNO;

-- 연습문제 1: 급여가 2000 초과인 사원들의 부서정보, 사원정보 출력 (SQL-99방식)
SELECT DEPTNO, DNAME, EMPNO, ENAME, SAL
FROM emp NATURAL JOIN DEPT
WHERE SAL > 2000;

-- 연습문제 2 : 부서별 평균, 최대 급여, 최소급여, 사원 수 출력 (ANSI JOIN)
SELECT d.deptno,
DNAME,
ROUND(AVG(SAL)) as "평균 급여",
MAX(SAL) as "최대 급여",
MIN(SAL) as "최소 급여",
count(*) as "사원 수"
FROM EMP e join dept d
on e.DEPTNO = d.deptno
group by d.deptno, d.DNAME;

-- 연습문제 3: 모든부서 정보와 사원정보를 부서번호, 사원 이름순으로 정렬해서 출력
SELECT d.deptno, d.DNAME, e.empno, e.ename, e.job, e.sal
FROM emp e RIGHT OUTER join dept D
on e.DEPTNO = d.DEPTNO
ORDER by d.DEPTNO, e.ENAME;