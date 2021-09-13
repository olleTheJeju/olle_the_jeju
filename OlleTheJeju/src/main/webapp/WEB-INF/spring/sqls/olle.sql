DROP TABLE OLLE_TRIP;
DROP TABLE OLLE_SUGGEST;
DROP TABLE OLLE_DATE;
DROP TABLE OLLE_IMG;
DROP TABLE OLLE_PLAN;
DROP TABLE OLLE_HASHTAG;
DROP TABLE OLLE_DIB;
DROP TABLE OLLE_BOOKING;
DROP TABLE OLLE_FOOD;
DROP TABLE OLLE_FAQ;
DROP TABLE OLLE_SUPPORT;
DROP TABLE OLLE_REPORT;
DROP TABLE OLLE_SITUATION;
DROP TABLE OLLE_USER CASCADE CONSTRAINTS;



-- OLLE_USER Table Create SQL
CREATE TABLE OLLE_USER(
	USER_ID VARCHAR2(500) PRIMARY KEY, 
	USER_PW VARCHAR2(500) NOT NULL, 
	USER_NAME VARCHAR2(300) NOT NULL, 
	USER_AGE NUMBER NOT NULL,
	USER_ADDR VARCHAR2(3000)NOT NULL,
	USER_ADDRDETAIL VARCHAR2(3000), 
	USER_PHONE VARCHAR2(100) NOT NULL, 
	USER_EMAIL VARCHAR2(200) NOT NULL, 
	USER_MEMBER VARCHAR2(50)  NOT NULL, 
	USER_STATUS VARCHAR2(300) NOT NULL, 
	USER_WARNING NUMBER NOT NULL, 
	USER_REGDATE DATE  DEFAULT SYSDATE NOT NULL, 
	USER_SECDATE DATE, 
	USER_IMG VARCHAR2(1000) NOT NULL, 
	USER_NICK VARCHAR2(500) NOT NULL
);

select * from olle_user;

SELECT COUNT(USER_ID)
		FROM OLLE_USER
		WHERE USER_ID = '1234';

insert into olle_user
values('admin', 'admin', 'admin', 0, '서울','4층', '010-4568-1234', 'admin@ac.kr', '개인', 'N', 0, SYSDATE, null, 'test.jpg', 'admin');
insert into olle_user
values('1234', '1234', 'user12324', 24, '관악구 남부순환로 1497','1층', '010-1234-1234', '1234@naver.com', '개인', 'N', 0, SYSDATE, null, 'test.jpg', '1234');
insert into olle_user
values('12345', '12345', 'user123245', 24, '관악구 남부순환로 1497','1층', '010-1234-1234', '12345@naver.com', '개인', 'N', 0, SYSDATE, null, 'test.jpg', '12345');
insert into olle_user
values('12346', '12346', 'user123246', 24, '관악구 남부순환로 1497','1층', '010-1234-1234', '12346@naver.com', '개인', 'N', 0, SYSDATE, null, 'test.jpg', '12346');

ALTER TABLE OLLE_USER ADD CONSTRAINT USER_MEMBER_CHK CHECK (USER_MEMBER IN ('개인', '사업자'));
ALTER TABLE OLLE_USER ADD CONSTRAINT USER_WARNING_CHK CHECK(USER_WARNING < 6);
ALTER TABLE OLLE_USER ADD CONSTRAINT USER_STATUS_CHK CHECK(USER_STATUS IN ('Y','N'));

COMMENT ON COLUMN OLLE_USER.USER_ID IS '아이디';
COMMENT ON COLUMN OLLE_USER.USER_PW IS '비밀번호';
COMMENT ON COLUMN OLLE_USER.USER_NAME IS '이름';
COMMENT ON COLUMN OLLE_USER.USER_AGE IS '나이';
COMMENT ON COLUMN OLLE_USER.USER_ADDR IS '주소';
COMMENT ON COLUMN OLLE_USER.USER_ADDRDETAIL IS '상세주소';
COMMENT ON COLUMN OLLE_USER.USER_PHONE IS '휴대폰';
COMMENT ON COLUMN OLLE_USER.USER_EMAIL IS '이메일';
COMMENT ON COLUMN OLLE_USER.USER_MEMBER IS '가입구분(개인, 사업자)';
COMMENT ON COLUMN OLLE_USER.USER_STATUS IS '탈퇴여부(Y,N)';
COMMENT ON COLUMN OLLE_USER.USER_WARNING IS '경고 수(누적 5회 이상시 강퇴)';
COMMENT ON COLUMN OLLE_USER.USER_REGDATE IS '가입일';
COMMENT ON COLUMN OLLE_USER.USER_SECDATE IS '탈퇴일';
COMMENT ON COLUMN OLLE_USER.USER_IMG IS '프로필';
COMMENT ON COLUMN OLLE_USER.USER_NICK IS '닉네임';


-- OLLE_TRIP Table Create SQL
CREATE TABLE OLLE_TRIP(
	TRIP_NUM  NUMBER PRIMARY KEY, 
	TRIP_KATEGORIE VARCHAR2(500) NOT NULL, 
	TRIP_TITLE VARCHAR2(300) NOT NULL, 
	TRIP_CONTENT VARCHAR2(4000)NOT NULL, 
	TRIP_WRITER VARCHAR2(300) NOT NULL, 
	TRIP_REGDATE  DATE  DEFAULT SYSDATE NOT NULL, 
	TRIP_NAIL VARCHAR2(1000) NOT NULL, 
	TRIP_ADDR VARCHAR2(3000) NOT NULL, 
	TRIP_PHONE VARCHAR2(300) NOT NULL, 
	TRIP_VIEWS NUMBER NOT NULL, 
	TRIP_PUSH NUMBER NOT NULL
);

ALTER TABLE OLLE_TRIP ADD CONSTRAINT TRIP_KATEGORIE_CHK CHECK (TRIP_KATEGORIE IN ('명소', '가격', '맛집', '방언'));

COMMENT ON COLUMN OLLE_TRIP.TRIP_NUM IS '글번호';
COMMENT ON COLUMN OLLE_TRIP.TRIP_KATEGORIE IS '카테고리(명소, 가격, 맛집, 방언)';
COMMENT ON COLUMN OLLE_TRIP.TRIP_TITLE IS '장소명';
COMMENT ON COLUMN OLLE_TRIP.TRIP_CONTENT IS '설명';
COMMENT ON COLUMN OLLE_TRIP.TRIP_WRITER IS '작성자(관리자)';
COMMENT ON COLUMN OLLE_TRIP.TRIP_REGDATE IS '작성일';
COMMENT ON COLUMN OLLE_TRIP.TRIP_NAIL IS '썸네일';
COMMENT ON COLUMN OLLE_TRIP.TRIP_ADDR IS '주소';
COMMENT ON COLUMN OLLE_TRIP.TRIP_PHONE IS '전화번호';
COMMENT ON COLUMN OLLE_TRIP.TRIP_VIEWS IS '조회수';
COMMENT ON COLUMN OLLE_TRIP.TRIP_PUSH IS '추천수';


-- OLLE_IMG Table Create SQL
CREATE TABLE OLLE_IMG(
	IMG_NUM  NUMBER PRIMARY KEY, 
	BOARD_NUM NUMBER NOT NULL, 
	TABLE_NUM NUMBER NOT NULL, 
	IMG_TITLE VARCHAR2(1000) NOT NULL, 
	GROUP_NUM NUMBER NOT NULL
);

ALTER TABLE OLLE_IMG ADD CONSTRAINT BOARD_NUM_CHK CHECK (BOARD_NUM IN (1, 2, 3, 4));
--1 : 관광일정, 2 : 추천일정, 3 : 나만의 일정, 4 : 제주상황

COMMENT ON TABLE OLLE_IMG IS '이미지 경로 저장 테이블';
COMMENT ON COLUMN OLLE_IMG.IMG_NUM IS '파일번호';
COMMENT ON COLUMN OLLE_IMG.BOARD_NUM IS '테이블 번호';
COMMENT ON COLUMN OLLE_IMG.TABLE_NUM IS '게시글 번호';
COMMENT ON COLUMN OLLE_IMG.IMG_TITLE IS '이미지 경로';
COMMENT ON COLUMN OLLE_IMG.GROUP_NUM IS '이미지 순서';


-- OLLE_SUGGEST Table Create SQL
CREATE TABLE OLLE_SUGGEST(
	SUG_NUM  NUMBER PRIMARY KEY, 
	SUG_KATEGORIE VARCHAR2(500) NOT NULL, 
	SUG_TITLE VARCHAR2(300) NOT NULL, 
	SUG_CONTENT VARCHAR2(4000) NOT NULL, 
	SUG_WRITER VARCHAR2(500) NOT NULL, 
	SUG_REGDATE  DATE  DEFAULT SYSDATE NOT NULL, 
	SUG_NAIL VARCHAR2(1000) NOT NULL, 
	SUG_TENDENCY VARCHAR2(300) NOT NULL, 
	SUG_ADDR VARCHAR2(3000) NOT NULL, 
	SUG_TERM VARCHAR2(500) NOT NULL, 
	SUG_VIEWS NUMBER NOT NULL, 
	SUG_PUSH NUMBER NOT NULL
);

ALTER TABLE OLLE_SUGGEST ADD CONSTRAINT SUG_KATEGORIE_CHK CHECK (SUG_KATEGORIE IN ('편안', '힐링', '트레킹', '맛집', '올레길'));
ALTER TABLE OLLE_SUGGEST ADD CONSTRAINT SUG_TENDENCY_CHK CHECK (SUG_TENDENCY IN ('혼자', '여자끼리', '남자끼리', '연인', '가족'));

COMMENT ON COLUMN OLLE_SUGGEST.SUG_NUM IS '글번호';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_KATEGORIE IS '카테고리(편안, 힐링, 트레킹, 맛집, 올레길)';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_TITLE IS '제목';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_CONTENT IS '내용';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_WRITER IS '작성자';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_REGDATE IS '작성일';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_NAIL IS '썸네일';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_TENDENCY IS '성향(혼자, 여자끼리, 남자끼리, 연인, 가족)';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_ADDR IS '주소';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_TERM IS '여행 기간';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_VIEWS IS '조회수';
COMMENT ON COLUMN OLLE_SUGGEST.SUG_PUSH IS '추천수';


-- OLLE_PLAN Table Create SQL
CREATE TABLE OLLE_PLAN(
	PLAN_NUM NUMBER PRIMARY KEY, 
	PLAN_TITLE VARCHAR2(300) NOT NULL, 
	PLAN_CONTENT VARCHAR2(4000) NOT NULL, 
	PLAN_WRITER VARCHAR2(500) NOT NULL, 
	PLAN_REGDATE DATE  DEFAULT SYSDATE NOT NULL, 
	PLAN_NAIL VARCHAR2(1000) NOT NULL, 
	PLAN_TENDENCY VARCHAR2(300) NOT NULL, 
	PLAN_ADDR VARCHAR2(3000) NOT NULL, 
	PLAN_TERM VARCHAR2(500) NOT NULL, 
	PLAN_VIEWS NUMBER NOT NULL, 
	PLAN_PUSH NUMBER NOT NULL, 
	PLAN_HIDE NUMBER DEFAULT 0 NOT NULL
);

ALTER TABLE OLLE_PLAN ADD CONSTRAINT PLAN_TENDENCY_CHK CHECK (PLAN_TENDENCY IN ('혼자', '여자끼리', '남자끼리', '연인', '가족'));
ALTER TABLE OLLE_PLAN ADD CONSTRAINT PLAN_HIDE_CHK CHECK (PLAN_HIDE IN (0, 1));

COMMENT ON COLUMN OLLE_PLAN.PLAN_NUM IS '글번호';
COMMENT ON COLUMN OLLE_PLAN.PLAN_TITLE IS '제목';
COMMENT ON COLUMN OLLE_PLAN.PLAN_CONTENT IS '내용';
COMMENT ON COLUMN OLLE_PLAN.PLAN_WRITER IS '작성자';
COMMENT ON COLUMN OLLE_PLAN.PLAN_REGDATE IS '작성일';
COMMENT ON COLUMN OLLE_PLAN.PLAN_NAIL IS '썸네일';
COMMENT ON COLUMN OLLE_PLAN.PLAN_TENDENCY IS '성향(혼자, 여자끼리, 남자끼리, 연인, 가족)';
COMMENT ON COLUMN OLLE_PLAN.PLAN_ADDR IS '주소';
COMMENT ON COLUMN OLLE_PLAN.PLAN_TERM IS '여행 기간';
COMMENT ON COLUMN OLLE_PLAN.PLAN_VIEWS IS '조회수';
COMMENT ON COLUMN OLLE_PLAN.PLAN_PUSH IS '추천수';
COMMENT ON COLUMN OLLE_PLAN.PLAN_HIDE IS '비공개 여부(IN(0, 1))';


-- OLLE_HASHTAG Table Create SQL
CREATE TABLE OLLE_HASHTAG(
	HASH_NUM NUMBER PRIMARY KEY, 
	BOARD_NUM NUMBER NOT NULL, 
	TABLE_NUM NUMBER NOT NULL, 
	GROUP_NUM NUMBER NOT NULL, 
	HASH_CONTENT VARCHAR2(300) NOT NULL
);

ALTER TABLE OLLE_HASHTAG ADD CONSTRAINT HASHTAG_BOARD_NUM_CHK CHECK (BOARD_NUM IN (1, 2, 3, 4));
--1 : 관광일정, 2 : 추천일정, 3 : 나만의 일정, 4 : 제주상황

COMMENT ON TABLE OLLE_HASHTAG IS '해시태그 테이블';
COMMENT ON COLUMN OLLE_HASHTAG.HASH_NUM IS '태그번호';
COMMENT ON COLUMN OLLE_HASHTAG.BOARD_NUM IS '게시판 번호';
COMMENT ON COLUMN OLLE_HASHTAG.TABLE_NUM IS '게시글번호';
COMMENT ON COLUMN OLLE_HASHTAG.GROUP_NUM IS '그룹내용';
COMMENT ON COLUMN OLLE_HASHTAG.HASH_CONTENT IS '태그내용';


-- OLLE_DIB Table Create SQL
CREATE TABLE OLLE_DIB(
	DIB_NUM  NUMBER PRIMARY KEY, 
	BOARD_NUM NUMBER NOT NULL, 
	TABLE_NUM NUMBER NOT NULL, 
	USER_ID VARCHAR2(500) NOT NULL,
    CONSTRAINT USER_ID_FK FOREIGN KEY(USER_ID) REFERENCES OLLE_USER(USER_ID) ON DELETE CASCADE
    
);

ALTER TABLE OLLE_DIB ADD CONSTRAINT DIB_BOARD_NUM_CHK CHECK (BOARD_NUM IN (1, 2, 3, 4));
--1 : 관광일정, 2 : 추천일정, 3 : 나만의 일정, 4 : 제주상황

COMMENT ON TABLE OLLE_DIB IS '찜목록 테이블';
COMMENT ON COLUMN OLLE_DIB.DIB_NUM IS '찜번호';
COMMENT ON COLUMN OLLE_DIB.BOARD_NUM IS '게시판 번호';
COMMENT ON COLUMN OLLE_DIB.TABLE_NUM IS '게시글번호';
COMMENT ON COLUMN OLLE_DIB.USER_ID IS '아이디';


-- OLLE_SITUATION Table Create SQL
CREATE TABLE OLLE_SITUATION(
	SITU_NUM NUMBER PRIMARY KEY, 
	SITU_NAME VARCHAR2(300) NOT NULL, 
	SITU_WRITER VARCHAR2(500) NOT NULL, 
	SITU_REGDATE DATE  DEFAULT SYSDATE NOT NULL, 
	SITU_PHONE VARCHAR2(100) NOT NULL, 
	SITU_ADDR VARCHAR2(3000) NOT NULL, 
	SITU_TIME DATE  NOT NULL, 
	SITU_HOME VARCHAR2(500)
);


COMMENT ON COLUMN OLLE_SITUATION.SITU_NUM IS '글번호';
COMMENT ON COLUMN OLLE_SITUATION.SITU_NAME IS '음식점 이름';
COMMENT ON COLUMN OLLE_SITUATION.SITU_WRITER IS '작성자';
COMMENT ON COLUMN OLLE_SITUATION.SITU_REGDATE IS '작성일';
COMMENT ON COLUMN OLLE_SITUATION.SITU_PHONE IS '전화번호';
COMMENT ON COLUMN OLLE_SITUATION.SITU_ADDR IS '주소';
COMMENT ON COLUMN OLLE_SITUATION.SITU_TIME IS '운영시간';
COMMENT ON COLUMN OLLE_SITUATION.SITU_HOME IS '홈페이지';


-- OLLE_BOOKING Table Create SQL
CREATE TABLE OLLE_BOOKING(
	BOOK_NUM NUMBER PRIMARY KEY, 
	SITU_NUM NUMBER NOT NULL, 
	BOOK_NAME VARCHAR2(500) NOT NULL, 
	BOOK_PEOPLE NUMBER NOT NULL, 
	BOOK_REGDATE DATE  DEFAULT SYSDATE NOT NULL, 
	BOOK_TIME VARCHAR2(300) NOT NULL, 
	BOOK_PHONE VARCHAR2(100) NOT NULL, 
	BOOK_CONTENT VARCHAR2(3000) NOT NULL,
	CONSTRAINT SITU_NUM_FK FOREIGN KEY(SITU_NUM) REFERENCES OLLE_SITUATION(SITU_NUM) ON DELETE CASCADE
);

COMMENT ON TABLE OLLE_BOOKING IS '맛집예약 테이블';
COMMENT ON COLUMN OLLE_BOOKING.BOOK_NUM IS '예약번호';
COMMENT ON COLUMN OLLE_BOOKING.SITU_NUM IS '음식점 번호';
COMMENT ON COLUMN OLLE_BOOKING.BOOK_NAME IS '예약자명';
COMMENT ON COLUMN OLLE_BOOKING.BOOK_PEOPLE IS '명수';
COMMENT ON COLUMN OLLE_BOOKING.BOOK_REGDATE IS '예약일';
COMMENT ON COLUMN OLLE_BOOKING.BOOK_TIME IS '예약시간';
COMMENT ON COLUMN OLLE_BOOKING.BOOK_PHONE IS '예약자 연락처';
COMMENT ON COLUMN OLLE_BOOKING.BOOK_CONTENT IS '요청사항';


-- OLLE_FAQ Table Create SQL
CREATE TABLE OLLE_FAQ(
	FAQ_NUM NUMBER PRIMARY KEY, 
	FAQ_TITLE  VARCHAR2(300) NOT NULL, 
	FAQ_CONTENT VARCHAR2(4000) NOT NULL, 
	FAQ_WRITER VARCHAR2(500) NOT NULL, 
	FAQ_REGDATE DATE  DEFAULT SYSDATE NOT NULL, 
	FAQ_NUM NUMBER NOT NULL
);

ALTER TABLE OLLE_FAQ ADD CONSTRAINT FAQ_NUM_CHK CHECK (FAQ_NUM IN (1, 2, 3, 4));
--1 : 관광일정, 2 : 추천일정, 3 : 나만의 일정, 4 : 제주상황

COMMENT ON TABLE OLLE_FAQ IS '고객지원 테이블';
COMMENT ON COLUMN OLLE_FAQ.FAQ_NUMBER IS '게시글번호';
COMMENT ON COLUMN OLLE_FAQ.FAQ_TITLE IS '제목';
COMMENT ON COLUMN OLLE_FAQ.FAQ_CONTENT IS '내용';
COMMENT ON COLUMN OLLE_FAQ.FAQ_WRITER IS '작성자';
COMMENT ON COLUMN OLLE_FAQ.FAQ_REGDATE IS '작성일';
COMMENT ON COLUMN OLLE_FAQ.FAQ_NUM IS '게시판번호';


-- OLLE_SUPPORT Table Create SQL
CREATE TABLE OLLE_SUPPORT(
	SUP_NUM NUMBER PRIMARY KEY,
	CHAT_GROUP VARCHAR2(200) NOT NULL,
	FROM_USER VARCHAR2(500) NOT NULL, 
	TO_USER VARCHAR2(500) NOT NULL, 
	SUP_CONTENT VARCHAR2(3000) NOT NULL, 
	SUP_REGDATE DATE NOT NULL
);

COMMENT ON TABLE OLLE_SUPPORT IS '문의 테이블';
COMMENT ON COLUMN OLLE_SUPPORT.SUP_NUM IS '문의번호';
COMMENT ON COLUMN OLLE_SUPPORT.CHAT_GROUP IS '채팅방';
COMMENT ON COLUMN OLLE_SUPPORT.FROM_USER IS '보낸사람';
COMMENT ON COLUMN OLLE_SUPPORT.TO_USER IS '받는사람';
COMMENT ON COLUMN OLLE_SUPPORT.SUP_CONTENT IS '내용';
COMMENT ON COLUMN OLLE_SUPPORT.SUP_REGDATE IS '작성일';


-- OLLE_REPORT Table Create SQL
CREATE TABLE OLLE_REPORT(
	REP_NUM NUMBER PRIMARY KEY, 
	USER_ID VARCHAR2(500) NOT NULL, 
	REP_RESON VARCHAR2(2000) NOT NULL, 
	REP_USER VARCHAR2(500) NOT NULL, 
	PLAN_NUM NUMBER NOT NULL, 
	REP_REGDATE DATE DEFAULT SYSDATE NOT NULL,
	CONSTRAINT PLAN_NUM_FK FOREIGN KEY(PLAN_NUM) REFERENCES OLLE_PLAN(PLAN_NUM) ON DELETE CASCADE
);

COMMENT ON TABLE OLLE_REPORT IS '신고내역 테이블';
COMMENT ON COLUMN OLLE_REPORT.REP_NUM IS '신고번호';
COMMENT ON COLUMN OLLE_REPORT.USER_ID IS '신고자';
COMMENT ON COLUMN OLLE_REPORT.REP_RESON IS '신고 사유';
COMMENT ON COLUMN OLLE_REPORT.REP_USER IS '신고대상';
COMMENT ON COLUMN OLLE_REPORT.PLAN_NUM IS '게시글번호';
COMMENT ON COLUMN OLLE_REPORT.REP_REGDATE IS '신고일';


-- OLLE_FOOD Table Create SQL
CREATE TABLE OLLE_FOOD(
	FOOD_NUM NUMBER PRIMARY KEY, 
	SITU_NUM NUMBER NOT NULL, 
	GROUP_NUM NUMBER NOT NULL, 
	FOOD_NAME VARCHAR2(20) NOT NULL,
	CONSTRAINT FOOD_SITU_NUM_FK FOREIGN KEY(SITU_NUM) REFERENCES OLLE_SITUATION(SITU_NUM) ON DELETE CASCADE
);


COMMENT ON COLUMN OLLE_FOOD.FOOD_NUM IS '메뉴 번호';
COMMENT ON COLUMN OLLE_FOOD.SITU_NUM IS '음식점 번호';
COMMENT ON COLUMN OLLE_FOOD.GROUP_NUM IS '그룹 번호';
COMMENT ON COLUMN OLLE_FOOD.FOOD_NAME IS '메뉴이름';


-- OLLE_DATE Table Create SQL
CREATE TABLE OLLE_DATE(
	DATE_NUM NUMBER PRIMARY KEY,
	BOARD_NUM NUMBER NOT NULL,
	TABLE_NUM NUMBER NOT NULL,
	DATE_N   NUMBER NOT NULL, 
	GROUP_NUM NUMBER NOT NULL, 
	DATE_NAME VARCHAR2(200) NOT NULL, 
	DATE_ADDR VARCHAR2(3000) NOT NULL
);


COMMENT ON COLUMN OLLE_DATE.DATE_NUM IS '목록번호';
COMMENT ON COLUMN OLLE_DATE.BOARD_NUM IS '게시판번호';
COMMENT ON COLUMN OLLE_DATE.TABLE_NUM IS '게시물번호';
COMMENT ON COLUMN OLLE_DATE.DATE_N IS 'N일차';
COMMENT ON COLUMN OLLE_DATE.GROUP_NUM IS '그룹 번호';
COMMENT ON COLUMN OLLE_DATE.DATE_NAME IS '장소명';
COMMENT ON COLUMN OLLE_DATE.DATE_ADDR IS '주소';