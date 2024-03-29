CREATE TABLE 성분(
	성분 VARCHAR2(20) PRIMARY KEY,
	효과_A VARCHAR2(20),
	효과_B VARCHAR2(20),
	효과_C VARCHAR2(20)
);

INSERT ALL 
INTO 성분 VALUES('비타민B1', '피로감', '간건강', '여성건강')
INTO 성분 VALUES('판토텐산', '스트레스', '피로감', '피부건강')
INTO 성분 VALUES('마그네슘', '스트레스', '여성건강', '피로감')
INTO 성분 VALUES('홍삼', '항산화', '두뇌활동', '피로감')
INTO 성분 VALUES('비타민B3', '피로감', '피부건강', '혈액순환')
select * from dual;
select * FROM 성분;
CREATE TABLE 영양제(
	영양제이름 VARCHAR2(40) PRIMARY KEY,
	성분_A VARCHAR2(20) REFERENCES 성분(성분),
	성분_B VARCHAR2(20) REFERENCES 성분(성분),
	제조사 VARCHAR2(40),
	복용법 VARCHAR2(3000),
);

CREATE TABLE 댓글(
	영양제이름 VARCHAR2(40) REFERENCES 영양제(영양제이름),
	성분_A VARCHAR2(20) REFERENCES 성분(성분),
	성분_B VARCHAR2(20) REFERENCES 성분(성분),
	제조사 VARCHAR2(40),
	복용법 VARCHAR2(3000),
);

INSERT ALL 
INTO 영양제 VALUES('코어펙', '마그네슘', '비타민B1','디엘오',
                   '아침,점심, 하루에 2회, 1회당 1팩씩 물과 함께 드세요')
INTO 영양제 VALUES('홍삼정 에브리타임', '홍삼', NULL, '정관장',
										'아침,식전, 하루에 1회, 1회당 1포씩 드세요')
select * from dual;

--증상에 맞는 성분 검색
SELECT 성분 FROM 성분
WHERE '여성건강' IN(효과_A,효과_B,효과_C)

--증상에 맞는 성분 검색(직접검색)
SELECT 성분 FROM 성분
WHERE 효과_A LIKE '%피로%' OR 효과_B LIKE '%피로%' OR 효과_C LIKE '%피로%'

--성분 효능 검색
SELECT 성분,효과_A,효과_B,효과_C FROM 성분
WHERE 성분 LIKE '%마그%'

--증상에 맞는 영양제 검색
SELECT 영양제이름, 제조사, 복용법 FROM 영양제 JOIN 성분
ON 성분.성분 = 영양제.성분_A OR 성분.성분 = 영양제.성분_B
WHERE '스트레스&수면' IN(효과_A,효과_B,효과_C)


--증상에 맞는 영양제 검색(직접검색)
SELECT 영양제이름, 제조사, 복용법 FROM 영양제 JOIN 성분
ON 성분.성분 = 영양제.성분_A OR 성분.성분 = 영양제.성분_B
WHERE 효과_A LIKE '%스트레스%' OR 효과_B LIKE '%스트레스%' OR 효과_C LIKE '%스트레스%'


--성분에 맞는 영양제 검색
SELECT 영양제이름, 제조사, 복용법 FROM 영양제 JOIN 성분
ON 성분.성분 = 영양제.성분_A OR 성분.성분 = 영양제.성분_B
WHERE 성분 LIKE '%홍삼%'

select * FROM 성분;