SELECT * FROM EMP; 



-- 연결 연산자 : SELECT문 조회시 컬럼 사이에 특정한 문자를 넣을 때 사용
SELECT ENAME || 'S JOB IS' || JOB as EMPLOYEE
FROM EMP;

-- 실습문제1 : EMP 테이블을 사용하여 사원이름이 S로 끝나는 사원데이터 출력
SELECT * FROM EMP
WHERE ENAME LIKE '%S';
-- 실습문제2 : EMP 테이블을 사용하여 30번 부서에서
-- 근무하고 있는 사원 중에 직책이 SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서 번호 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';
-- 실습문제3 : 20번 30번 부서에 근무하고 있는 사원 중 급여가 2000초과인 사원의
-- 사원번호, 이름, 급여, 부서 번호 출력
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
WHERE DEPTNO = 20 OR DEPTNO = 30;
-- 실습문제4 : NOT BETWEEN A and B 연산자를 쓰지 않고 급여가 2000이상, 3000 이하 범위 이외의
-- 값을 가진 데이터만 출력
SELECT * FROM EMP
WHERE SAL <2000 or SAl >3000;
-- 실습문제5 : 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000 ~ 2000 사이가 아닌,
-- 사원 이름, 사원 번호, 급여, 부서 번호 출력
SELECT * FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30 AND SAL NOT BETWEEN 1000 AND 2000;
-- 실습문제6: 추가 수당이 존재하지 않고, 상급자가 있고, 직책이 MANAGER, CLERK인 사원 중에
-- 사원이름이 두번째 글자가 L이 아닌 사원의 정보출력
SELECT * FROM EMP
WHERE COMM IS NULL
AND MGR IS NOT NULL
AND JOB = 'CLERK' 
OR JOB = 'CLERK' 
AND ENAME NOT LIKE '_L%';

-- 숫자함수 : 수학적 계산식을 처리하기 위한 함수를 의미
-- DUAL 테이블 : SYS 계정에서 제공하는 간단한 계산식, 함수를 테스트 하기 위한 테이블
SELECT -10, abs(-10) FROM DUAL;
-- ROUND : 반올림한 결과를 반환, 위치를 지정할 수 있으며 지정하지 않으면
-- 0의 위치에서 반올림

SELECT ROUND(1234.5678) AS ROUND, -- 위치를 지정하지 않으면 소숫점 첫번째 자리를 반올림 호출 오류 발생
     ROUND(1234.5678, 0) AS ROUND_0,
     ROUND(1234.5678, 1) AS ROUND_1,
     ROUND(1234.5678, 2) AS ROUND_2,
     ROUND(1234.5678, -1) AS ROUND_MINUS1,
     ROUND(1234.5678, -2) AS ROUND_MINUS2
 FROM DUAL;

SELECT TRUNC(1234.5678) AS TRUNC,
     TRUNC(1234.5678, 0) AS TRUNC_0,
     TRUNC(1234.5678, 1) AS TRUNC_1,
     TRUNC(1234.5678, 2) AS TRUNC_2,
     TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
     TRUNC(1234.5678, -2) AS TRUNC_MINUS2
 FROM DUAL;

 -- MOD : 나누기 한 후 나머지를 출력하는 함수 호출 오류 발생
 SELECT MOD(21,5) FROM dual;
 -- CEIL : 소수점 이하가 있으면 무조건 올림
 SELECT CEIL(12.345) FROM dual;
 -- FLOOR : 소수점 이하를 무조건 버림
 SELECT FLOOR(12.565) FROM DUAL;
 -- POWER : 정수 A를 정수 B만큼 제곱하는 함수
 SELECT POWEr(2,10) FROM DUAL;

 -- 문자 함수 : 문자 데이터를 가공하거나 문자 데이터로부터 특정 결과를 얻고자 할 때 사용
 SELECT ENAME, UPPER((ENAME) /*CH CHAR*/), LOWER(ENAME /*CH CHAR*/),INITCAP(ENAME /*CHAR*/)
 FROM emp;

 -- 문자열 길이를 구하는 LENGTH 함수
 SELECT ENAME, LENGTH(ENAME) FROM emp;
-- LENGTH(문자열 길이)와 LENGTHB(문자열의 바이트수 ) 함수 비교
SELECT LENGTH('한글'), LENGTH('ENG'), LENGTHB('한글'), LENGTHB('ENG')
FROM DUAL;

-- SUBSTR /SUBSTRB
-- 대상 문자열의 시작위치부터 선택한 갯수만큼 문자를 반환
-- 데이터베이스는 프로그래밍 언어와 달리 0부터 시작하는 인덱스가 아님
SELECT job, SUBSTR(job, 1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5)
from EMP;

-- 음수값은 뒤에서부터 계산 함(파이썬 문자열 인덱싱과 유사)
SELECT JOB, SUBSTR(JOB, -LENGTH(JOB))
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
FROM EMP;

-- INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지를 알아낼 때 사용  오류발생
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR1, -- 처음부터 검색
    INSTR('HELLO, ORACLE!', 'L',5) AS INSTR2, -- 5번째 부터 검색
    INSERT('HELLO, ORACLE!', 'L',2,2) AS INSTR3 -- 2번째부터 검색하는데 해당 문자 2번째 나타냄
FROM DUAL;

-- 특정 문자가 포함된 행 찾기
SELECT * FROM EMP
WHERE INSTR(ENAME, 'S')>0;

SELECT * FROM EMP
WHERE ENAME LIKE '%S%';

-- REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체 할때 사용
SELECT '010-1234-5678' AS REPLACE_before,
    REPLACE('010-1234-5678', '-', ' ') AS replace1,
    REPLACE('010-1234-5678', '-') AS replace2
FROM DUAL;

-- LPAD /RPAD : 기준 공간 칸수를 지정하고 빈칸 만큼 특정 문자로 채우는 함수
SELECT LPAD('ORACLE',10,'+') FROM dual;
SELECT RPAD('ORACLE',10,'+') FROM dual;
SELECT LPAD('ORACLE',10) FROM dual;

-- 개인정보 뒷자리를 *로 표시하기
SELECT RPAD('971215-',14, '*') As rpad_jumin,
    RPAD('010-1234-',13,'*') AS rpad_phone 
FROM dual;

-- 두 문자열을합치는 CONCAT 함수
SELECT CONCAT(empno, ename), concat(empno, CONCAT(' : ', ENAME))
FROM EMP
WHERE ENAME = 'JAMES';

-- TRIM / LTRIM /RTRIM : 문자열 데이터 내에서 특정 문자를 지우기 위해 사용
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
 '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>', '<_') || ']' AS LTRIM_2,
 '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>', '_>') || ']' AS RTRIM_2
 FROM DUAL;

 -- 날짜 데이터를 다루는 날짜 함수
 -- SYSDATE: 운영체제로 부터 시간을  읽어
 SELECT sysdate FROM DUAL;
 SELECT sysdate as "현재시간",
    sysdate -1 as "어제",
    sysdate +1 as "내일" 
    FROM dual;

-- 몇 개월 이후 날짜를 구하는 ADD_MONTHS 함수
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE,3)
    FROM dual;

-- 입사 10주년 되는 사원들 데이터 출력하기
SELECT EMPNO, ENAME, HIREDATE,
ADD_MONTHS(HIREDATE,120) as "입사10주년"
FROM emp;

-- 연습문제: SYSDATE와 ADD_MONTHS함수를 사용하여 현재 날짜와 6개월 이후 날짜 출력하기
SELECT SYSDATE,
ADD_MONTHS(SYSDATE, 6)
FROM Dual;