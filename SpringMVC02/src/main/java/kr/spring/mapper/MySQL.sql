-- MySql_5.1 com com 클릭
-- 실행 단축키 AIT + X 
-- 마우스 우클릭 실행방법 : Execute Selected Text
 
-- 테이블 생성 
CREATE TABLE BOARD(
	IDX INT NOT NULL AUTO_INCREMENT, 
	TITLE VARCHAR(100) NOT NULL, 
	CONTENT VARCHAR(2000) NOT NULL,
	WRITER VARCHAR(30) NOT NULL,
	INDATE DATETIME DEFAULT NOW(), 
	COUNT INT DEFAULT 0, 
	PRIMARY KEY(IDX) 
	-- 테이블 컬럼이 entity패키지에서 만든 필드명이랑 똑같아야함
	-- AUTO_INCREMENT : 오라클의 시퀀스처럼 자동으로 값이 1씩 증가됨
	-- INDATE 날짜를 NOW에 넣지 않으면 insert한 시간이 들어감 , 작성일
	-- COUNT 초기값 0으로 설정, 조회수 
	-- PRIMARY KEY(IDX) 중복X	
);


-- 데이터 넣기
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES('스프링게시판1','내용입니다1','user01');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES('스프링게시판2','내용입니다2','user02');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES('스프링게시판3','내용입니다3','user03');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES('스프링게시판4','내용입니다4','user04');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES('스프링게시판5','내용입니다5','user05');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES('스프링게시판6','내용입니다6','user06');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES('스프링게시판7','내용입니다7','user07');
INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES('스프링게시판8','내용입니다8','user08');

-- 데이터 조회 
SELECT * FROM BOARD;

DROP TABLE BOARD;

-- 데이터 행 삭제
DELETE FROM BOARD WHERE IDX=22 
DELETE FROM BOARD WHERE IDX=26
DELETE FROM BOARD WHERE IDX=28

