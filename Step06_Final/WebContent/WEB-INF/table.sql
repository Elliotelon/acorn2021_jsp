
-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE users(
	id VARCHAR2(100) PRIMARY KEY,
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100), --프로필 이미지 경로를 저장할 칼럼
	regadate DATE --가입일
);

CREATE TABLE board_cafe(
num NUMBER PRIMARY KEY, --글번호
writer VARCHAR2(100) NOT NULL,--작성자(로그인된 아이디)
title VARCHAR2(100) NOT NULL,--제목
content CLOB,--글 내용
viewCount NUMBER,--조회수
regdate DATE--글 작성일
);
--게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_cafe_seq;