CREATE DATABASE team1;

use team1;

-- 회원 테이블 생성
CREATE TABLE member(
	id VARCHAR(16) PRIMARY KEY, -- 아이디
	pw VARCHAR(330) NOT NULL, -- 비밀번호
	NAME VARCHAR(100) NOT NULL, -- 이름
	email VARCHAR(100) NOT NULL, -- 이메일
	tel VARCHAR(13), -- 전화 번호
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 가입일
	POINT INT DEFAULT 0, -- 포인트
	job INT NOT NULL -- 직업 학생: 1, 선생님: 2
);

-- 문제 qna 게시판
-- 질문은 학생만
-- 답변은 선생님만
CREATE TABLE qna_problem(
	qno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 자유 게시판
-- 모두 사용 가능
CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);
	
-- 학생 게시판
-- job을 통해 학생만 접근하도록 설계
CREATE TABLE board_stu(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- qna 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	lev INT DEFAULT 0, -- 게시글 0, 답글 1 이상
	par INT, -- 부모 게시글 번호
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 자바 게시판
-- 선생님만 작성 가능
CREATE TABLE board_java(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- unv 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	link VARCHAR(1000), -- 링크
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 파이썬 게시판
-- 선생님만 작성 가능
CREATE TABLE board_py(
	bno INT PRIMARY KEY AUTO_INCREMENT, -- act 글 번호
	title VARCHAR(200) NOT NULL, -- 제목
	content VARCHAR(1000), -- 내용
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0, -- 조회수
	link VARCHAR(1000), -- 링크
	FOREIGN KEY(author) REFERENCES member(id) ON DELETE 		
		CASCADE -- 작성자를 member id를 이용해 외래키로 사용
);

-- 공지사항
create TABLE notice(
	bno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16), -- 작성자
	resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), -- 작성일
	cnt INT DEFAULT 0 -- 조회수
)

INSERT INTO notice(title, content, author) VALUES('공지사항 제목', '공지사항 내용', 'admin');

-- DROP TABLE board;
-- DROP TABLE board_stu;
-- DROP TABLE board_tea;